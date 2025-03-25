MODULE CUDUDV_LOKI_MOD
  CONTAINS
  SUBROUTINE CUDUDV_LOKI (YDCST, YDECUMF, YDSPP_CONFIG, YDPERTPAR, KIDIA, KFDIA, KLON, KLEV, KTOPM2, KTYPE, KCBOT, KCTOP, LDCUM,  &
  & PTSPHY, PAPH, PAP, PUEN, PVEN, PMFU, PMFD, PMFUO, PMFDO, PUU, PUD, PVU, PVD, PGP2DSPP, PTENU, PTENV, YDSTACK_L)
    
    !**** *CUDUDV* - UPDATES U AND V TENDENCIES,
    !                DOES GLOBAL DIAGNOSTIC OF DISSIPATION
    
    !**   INTERFACE.
    !     ----------
    
    !          *CUDUDV* IS CALLED FROM *CUMASTR*
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KTYPE*        TYPE OF CONVECTION
    !                       1 = PENETRATIVE CONVECTION
    !                       2 = SHALLOW CONVECTION
    !                       3 = MIDLEVEL CONVECTION
    !    *KCBOT*        CLOUD BASE LEVEL
    !    *KCTOP*        CLOUD TOP LEVEL
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTSPHY*       TIME STEP FOR THE PHYSICS                      S
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS            PA
    !    *PAP *         PROVISIONAL PRESSURE ON FULL LEVELS            PA
    !    *PUEN*         PROVISIONAL ENVIRONMENT U-VELOCITY (T+1)       M/S
    !    *PVEN*         PROVISIONAL ENVIRONMENT V-VELOCITY (T+1)       M/S
    !    *PMFU*         MASSFLUX UPDRAFTS                             KG/(M2*S)
    !    *PMFD*         MASSFLUX DOWNDRAFTS                           KG/(M2*S)
    !    *PUU*          U-VELOCITY IN UPDRAFTS                         M/S
    !    *PUD*          U-VELOCITY IN DOWNDRAFTS                       M/S
    !    *PVU*          V-VELOCITY IN UPDRAFTS                         M/S
    !    *PVD*          V-VELOCITY IN DOWNDRAFTS                       M/S
    !    *PGP2DSPP*     Standard stochastic variable (mean=0, SD=1)
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PTENU*        TENDENCY OF U-COMP. OF WIND                    M/S2
    !    *PTENV*        TENDENCY OF V-COMP. OF WIND                    M/S2
    
    !            METHOD
    !            -------
    !       EXPLICIT UPSTREAM AND IMPLICIT SOLUTION OF VERTICAL ADVECTION
    !       DEPENDING ON VALUE OF RMFSOLUV:
    !       0=EXPLICIT 0-1 SEMI-IMPLICIT >=1 IMPLICIT
    
    !       FOR EXPLICIT SOLUTION: ONLY ONE SINGLE ITERATION
    !       FOR IMPLICIT SOLUTION: FIRST IMPLICIT SOLVER, THEN EXPLICIT SOLVER
    !                              TO CORRECT TENDENCIES BELOW CLOUD BASE
    
    !            EXTERNALS
    !            ---------
    !            CUBIDIAG
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE         E.C.M.W.F.     7/86 MODIF. 12/89
    
    !     MODIFICATIONS.
    !     --------------
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      P.BECHTOLD        E.C.M.W.F.    11/02/05 IMPLICIT SOLVER
    !      M. Leutbecher&S.-J. Lock (Jan 2016) Introduced SPP scheme (LSPP)
    !      S.-J. Lock    Jul 2017    Extended SPP perturbations to include shallow convection
    !      L. Descamps 2020-02-25 Introduced perturbed parameter option for PEARP (LPERTPAR)
    !      M. Leutbecher & S. Lang Oct 2020    SPP abstraction and revision
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !     R. El Khatib 20-Jul-2024 Remove PM's Q&D patch after LD's merge fix.
    !----------------------------------------------------------------------
    
    USE cubidiag_LOKI_MOD, ONLY: cubidiag_LOKI
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOECUMF, ONLY: TECUMF
    USE SPP_MOD, ONLY: TSPP_CONFIG
    USE YOMPERTPAR, ONLY: TPERTPAR
    USE SPP_GEN_MOD, ONLY: SPP_PERT
    
    IMPLICIT NONE
    
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TSPP_CONFIG), INTENT(IN) :: YDSPP_CONFIG
    TYPE(TPERTPAR), INTENT(IN) :: YDPERTPAR
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KTOPM2
    INTEGER(KIND=JPIM), INTENT(IN) :: KTYPE(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KCTOP(KLON)
    LOGICAL, INTENT(IN) :: LDCUM(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PTSPHY
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PUEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFUO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFDO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PUU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PUD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGP2DSPP(KLON, YDSPP_CONFIG%SM%NRFTOTAL)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENV(KLON, KLEV)
    REAL(KIND=JPRB) :: ZMFUU(KLON, KLEV), ZMFDU(KLON, KLEV), ZMFUV(KLON, KLEV), ZMFDV(KLON, KLEV), ZADVW(KLON)
    
    INTEGER(KIND=JPIM) :: IK, IM, IKB, JK, JL
    INTEGER(KIND=JPIM) :: IPCUDU, IPCUDV, IPCUDUS, IPCUDVS
    INTEGER(KIND=JPIM) :: IPN1, IPN2
    TYPE(SPP_PERT) :: PN1, PN2    ! SPP pertn. config.
    
    REAL(KIND=JPRB) :: ZZP, ZIMP, ZTSPHY, ZU, ZV
    REAL(KIND=JPRB) :: ZMDU, ZMDV, ZLIMN2
    REAL(KIND=JPRB) :: ZXU, ZXV, ZXU_MAG, ZXV_MAG, ZN2, ZFAC
    REAL(KIND=JPRB) :: ZRDU, ZRDV
    REAL(KIND=JPRB), DIMENSION(KLON, KLEV) :: ZDUDT, ZDVDT, ZDP
    REAL(KIND=JPRB), DIMENSION(KLON, KLEV) :: ZB, ZR1, ZR2
    LOGICAL, DIMENSION(KLON, KLEV) :: LLCUMBAS
    LOGICAL :: LLPPAR_CUDUV
    LOGICAL :: LLPERT_CUDUDV, LLPERT_CUDUDVS    ! SPP perturbation on?
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    POINTER(IP_ZMFUU, ZMFUU)
    POINTER(IP_ZMFDU, ZMFDU)
    POINTER(IP_ZMFUV, ZMFUV)
    POINTER(IP_ZMFDV, ZMFDV)
    POINTER(IP_ZADVW, ZADVW)
    POINTER(IP_ZDUDT, ZDUDT)
    POINTER(IP_ZDVDT, ZDVDT)
    POINTER(IP_ZDP, ZDP)
    POINTER(IP_ZB, ZB)
    POINTER(IP_ZR1, ZR1)
    POINTER(IP_ZR2, ZR2)
    POINTER(IP_LLCUMBAS, LLCUMBAS)
    YLSTACK_L = YDSTACK_L
    IP_ZMFUU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUV = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDV = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZADVW = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDUDT = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDVDT = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDP = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZB = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZR1 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZR2 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_LLCUMBAS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
!$acc data present( KTYPE, KCBOT, KCTOP, LDCUM, PAPH, PAP, PUEN, PVEN, PMFU, PMFD, PMFUO, PMFDO, PUU, PUD, PVU, PVD, PGP2DSPP,  &
!$acc & PTENU, PTENV, YDCST, YDECUMF, YDSPP_CONFIG, YDPERTPAR )
    !----------------------------------------------------------------------
    
    ZIMP = 1.0_JPRB - YDECUMF%RMFSOLUV
    ZTSPHY = 1.0_JPRB / PTSPHY
    
    LLPPAR_CUDUV = .false.
    LLPERT_CUDUDV = .false.
    LLPERT_CUDUDVS = .false.
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      ZADVW(JL) = 0.0_JPRB
      IF (KTYPE(JL) == 1) ZADVW(JL) = YDECUMF%RMFADVW
      
      
!$acc loop seq
      DO JK=1,KLEV
        IF (LDCUM(JL)) THEN
          ZDP(JL, JK) = YDCST%RG / (PAPH(JL, JK + 1) - PAPH(JL, JK))
        END IF
      END DO
      
      !----------------------------------------------------------------------
      
      
      !*    1.0          CALCULATE FLUXES AND UPDATE U AND V TENDENCIES
      !                  ----------------------------------------------
      
!$acc loop seq
      DO JK=KTOPM2,KLEV
        IK = JK - 1
        IF (LDCUM(JL)) THEN
          ZMFUU(JL, JK) = PMFU(JL, JK)*(PUU(JL, JK) - ZIMP*PUEN(JL, IK))
          ZMFUV(JL, JK) = PMFU(JL, JK)*(PVU(JL, JK) - ZIMP*PVEN(JL, IK))
          ZMFDU(JL, JK) = PMFD(JL, JK)*(PUD(JL, JK) - ZIMP*PUEN(JL, IK))
          ZMFDV(JL, JK) = PMFD(JL, JK)*(PVD(JL, JK) - ZIMP*PVEN(JL, IK))
        END IF
      END DO
      
      ! linear fluxes below cloud
      IF (YDECUMF%RMFSOLUV == 0.0_JPRB) THEN
!$acc loop seq
        DO JK=KTOPM2,KLEV
          !DIR$ IVDEP
          !OCL NOVREC
          IF (LDCUM(JL) .and. JK > KCBOT(JL)) THEN
            IKB = KCBOT(JL)
            ZZP = ((PAPH(JL, KLEV + 1) - PAPH(JL, JK)) / (PAPH(JL, KLEV + 1) - PAPH(JL, IKB)))
            IF (KTYPE(JL) == 3) THEN
              ZZP = ZZP*ZZP
            END IF
            ZMFUU(JL, JK) = ZMFUU(JL, IKB)*ZZP
            ZMFUV(JL, JK) = ZMFUV(JL, IKB)*ZZP
            ZMFDU(JL, JK) = ZMFDU(JL, IKB)*ZZP
            ZMFDV(JL, JK) = ZMFDV(JL, IKB)*ZZP
          END IF
        END DO
      END IF
      
      !*    1.2          COMPUTE TENDENCIES
      !                  ------------------
      
!$acc loop seq
      DO JK=KTOPM2,KLEV
        
        IF (JK < KLEV) THEN
          IK = JK + 1
          IF (LDCUM(JL)) THEN
            ZDUDT(JL, JK) = ZDP(JL, JK)*(ZMFUU(JL, IK) - ZMFUU(JL, JK) + ZMFDU(JL, IK) - ZMFDU(JL, JK))
            ZDVDT(JL, JK) = ZDP(JL, JK)*(ZMFUV(JL, IK) - ZMFUV(JL, JK) + ZMFDV(JL, IK) - ZMFDV(JL, JK))
          END IF
          
        ELSE
          IF (LDCUM(JL)) THEN
            ZDUDT(JL, JK) = -ZDP(JL, JK)*(ZMFUU(JL, JK) + ZMFDU(JL, JK))
            ZDVDT(JL, JK) = -ZDP(JL, JK)*(ZMFUV(JL, JK) + ZMFDV(JL, JK))
          END IF
        END IF
        
      END DO
    END DO
    
    
    IF (YDECUMF%RMFSOLUV == 0.0_JPRB) THEN
      
      !*    1.3          UPDATE TENDENCIES
      !                  -----------------
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
!$acc loop seq
        DO JK=KTOPM2,KLEV
          IF (LDCUM(JL)) THEN
            PTENU(JL, JK) = PTENU(JL, JK) + ZDUDT(JL, JK)
            PTENV(JL, JK) = PTENV(JL, JK) + ZDVDT(JL, JK)
          END IF
        END DO
      END DO
      
      
    ELSE
      !----------------------------------------------------------------------
      
      !*      1.6          IMPLICIT SOLUTION
      !                    -----------------
      
      ! Fill bi-diagonal Matrix vectors A=k-1, B=k;
      ! reuse ZMFUU=A and ZB=B;
      ! ZDUDT and ZDVDT correspond to the RHS ("constants") of the equation
      ! The solution is in ZR1 and ZR2
      
      LLCUMBAS(:, :) = .false.
      ZB(:, :) = 1.0_JPRB
      ZMFUU(:, :) = 0.0_JPRB
      
      ! Fill vectors A, B and RHS
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
!$acc loop seq
        DO JK=KTOPM2,KLEV
          IK = JK + 1
          IM = JK - 1
          LLCUMBAS(JL, JK) = LDCUM(JL) .and. JK >= KCTOP(JL) - 1
          IF (LLCUMBAS(JL, JK)) THEN
            ZZP = YDECUMF%RMFSOLUV*ZDP(JL, JK)*PTSPHY
            ZMFUU(JL, JK) = -ZZP*(PMFU(JL, JK) + PMFD(JL, JK))
            IF (JK < KLEV) THEN
              ZB(JL, JK) = 1.0_JPRB + ZZP*(PMFU(JL, IK) + PMFD(JL, IK))
            ELSE
              ZB(JL, JK) = 1.0_JPRB
            END IF
            ZZP = YDCST%RG*(PMFUO(JL, JK) + YDECUMF%RMFADVWDD*PMFDO(JL, JK)) / (PAP(JL, JK) - PAP(JL, IM))*PTSPHY*ZADVW(JL)
            ZU = ZZP*(PUEN(JL, IM) - PUEN(JL, JK))
            ZV = ZZP*(PVEN(JL, IM) - PVEN(JL, JK))
            ZDUDT(JL, JK) = (ZDUDT(JL, JK) + PTENU(JL, JK)*YDECUMF%RMFSOLRHS)*PTSPHY + PUEN(JL, JK) - ZU
            ZDVDT(JL, JK) = (ZDVDT(JL, JK) + PTENV(JL, JK)*YDECUMF%RMFSOLRHS)*PTSPHY + PVEN(JL, JK) - ZV
          END IF
        END DO
      END DO
      
      
      CALL CUBIDIAG_LOKI(KIDIA, KFDIA, KLON, KLEV, KCTOP, LLCUMBAS, ZMFUU, ZB, ZDUDT, ZR1, YDSTACK_L=YLSTACK_L)
      
      CALL CUBIDIAG_LOKI(KIDIA, KFDIA, KLON, KLEV, KCTOP, LLCUMBAS, ZMFUU, ZB, ZDVDT, ZR2, YDSTACK_L=YLSTACK_L)
      ! prepare RP perturbations (MF PEARP)
      LLPPAR_CUDUV = YDPERTPAR%LPERTPAR .and. YDPERTPAR%LPERT_CUDUV
      ! prepare SPP perturbations
      IF (YDSPP_CONFIG%LSPP) THEN
        IPN1 = YDSPP_CONFIG%PPTR%CUDUDV
        LLPERT_CUDUDV = IPN1 > 0
        IF (LLPERT_CUDUDV) THEN
          PN1 = YDSPP_CONFIG%SM%PN(IPN1)
          IPCUDU = PN1%MP
          IF (PN1%NRF == 1) THEN
            IPCUDV = IPCUDU
          ELSE
            IPCUDV = IPCUDU + 1
          END IF
        END IF
        IPN2 = YDSPP_CONFIG%PPTR%CUDUDVS
        LLPERT_CUDUDVS = IPN2 > 0
        IF (LLPERT_CUDUDVS) THEN
          PN2 = YDSPP_CONFIG%SM%PN(IPN2)
          IPCUDUS = PN2%MP
          IF (PN2%NRF == 1) THEN
            IPCUDVS = IPCUDUS
          ELSE
            IPCUDVS = IPCUDUS + 1
          END IF
        END IF
      ELSE
        LLPERT_CUDUDV = .false.
        LLPERT_CUDUDVS = .false.
      END IF
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
        IF (LLPERT_CUDUDV .or. LLPERT_CUDUDVS .or. LLPPAR_CUDUV) THEN
          ZMDU = 1.0_JPRB            ! mean      zonal momentum transport pdf
          ZMDV = 1.0_JPRB            ! mean meridional momentum transport pdf
          ZLIMN2 = 9.0_JPRB*PN1%SDEV**2            ! limit for norm squared (3 stdev)
          
          IF (KTYPE(JL) == 1 .and. (LLPERT_CUDUDV .or. LLPPAR_CUDUV) .or. KTYPE(JL) == 2 .and. (LLPERT_CUDUDVS .or. LLPPAR_CUDUV) &
          & ) THEN
            !perturb deep/shallow convection
            
            IF (KTYPE(JL) == 1) THEN
              IF (.not.LLPPAR_CUDUV) THEN
                ZXU = PGP2DSPP(JL, IPCUDU)
                ZXV = PGP2DSPP(JL, IPCUDV)
                ZXU_MAG = PN1%XMAG(1)
                ZXV_MAG = PN1%XMAG(2)
              ELSE
                ZXU = YDPERTPAR%CUDU_MOD
                ZXV = YDPERTPAR%CUDV_MOD
              END IF
            END IF
            
            IF (KTYPE(JL) == 2) THEN
              IF (.not.LLPPAR_CUDUV) THEN
                ZXU = PGP2DSPP(JL, IPCUDUS)
                ZXV = PGP2DSPP(JL, IPCUDVS)
                ZXU_MAG = PN2%XMAG(1)
                ZXV_MAG = PN2%XMAG(2)
              ELSE
                ZXU = YDPERTPAR%CUDU_MOD
                ZXV = YDPERTPAR%CUDV_MOD
              END IF
            END IF
            
            ZN2 = ZXU**2 + ZXV**2
            IF (ZN2 > ZLIMN2) THEN
              ZFAC = SQRT(ZLIMN2 / ZN2)
              ZXU = ZFAC*ZXU
              ZXV = ZFAC*ZXV
            END IF
            IF (.not.LLPPAR_CUDUV) THEN
              ZRDU = ZMDU + ZXU_MAG*ZXU
              ZRDV = ZMDV + ZXV_MAG*ZXV
            ELSE
              ZRDU = ZMDU + ZXU
              ZRDV = ZMDV + ZXV
            END IF
          ELSE
            !other convection - unperturbed
            ZRDU = ZMDU
            ZRDV = ZMDV
          END IF
        END IF
        
        
        ! Compute tendencies
        
!$acc loop seq
        DO JK=KTOPM2,KLEV
          IF (LLCUMBAS(JL, JK)) THEN
            IF (LLPERT_CUDUDV .or. LLPPAR_CUDUV) THEN
              !Apply SPP perturbations or RP perturbation
              PTENU(JL, JK) = PTENU(JL, JK)*(1.0_JPRB - YDECUMF%RMFSOLRHS) + ZRDU*(ZR1(JL, JK) - PUEN(JL, JK))*ZTSPHY
              PTENV(JL, JK) = PTENV(JL, JK)*(1.0_JPRB - YDECUMF%RMFSOLRHS) + ZRDV*(ZR2(JL, JK) - PVEN(JL, JK))*ZTSPHY
            ELSE
              PTENU(JL, JK) = PTENU(JL, JK)*(1.0_JPRB - YDECUMF%RMFSOLRHS) + (ZR1(JL, JK) - PUEN(JL, JK))*ZTSPHY
              PTENV(JL, JK) = PTENV(JL, JK)*(1.0_JPRB - YDECUMF%RMFSOLRHS) + (ZR2(JL, JK) - PVEN(JL, JK))*ZTSPHY
            END IF
          END IF
        END DO
      END DO
      
      
      
    END IF
    !----------------------------------------------------------------------
    
    
!$acc end data
  END SUBROUTINE CUDUDV_LOKI
END MODULE CUDUDV_LOKI_MOD
