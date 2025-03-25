MODULE CUCTRACER_LOKI_MOD
  CONTAINS
  SUBROUTINE CUCTRACER_LOKI (YDCST, YDCUMFS, YDECUMF2, YDECUMF, KIDIA, KFDIA, KLON, KLEV, KTRAC, KCTOP, KDTOP, KTYPE, LDCUM,  &
  & LDDRAF, PTSPHY, PAPH, PAP, PMFU, PMFD, PMFUO, PMFDO, PUDRATE, PDDRATE, PDMFUP, PDMFDP, PCEN, PTENC, PSCAV, YDSTACK_L)
    
    !**** *CUCTRACER* - COMPUTE CONVECTIVE TRANSPORT OF CHEM. TRACERS
    !                   IMPORTANT: ROUTINE IS FOR POSITIVE DEFINIT QUANTITIES
    !                              SCAVENGING IS DONE IF SCAVENGING COEFFICIENT>0
    
    !          P.BECHTOLD        E.C.M.W.F.              11/02/2004
    
    !**   INTERFACE.
    !     ----------
    
    !          *CUTRACER* IS CALLED FROM *CUMASTR*
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KTRAC*        NUMBER OF CHEMICAL TRACERS
    
    !    *KCTOP*        CLOUD TOP  LEVEL
    !    *KDTOP*        DOWNDRAFT TOP LEVEL
    !    *KTYPE*        TYPE OF CONVECTION
    !                       1 = PENETRATIVE CONVECTION
    !                       2 = SHALLOW CONVECTION
    !                       3 = MIDLEVEL CONVECTION
    
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    !    *LDDRAF*       FLAG: .TRUE. IF DOWNDRAFTS EXIST
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTSPHY*       PHYSICS TIME-STEP                              S
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS            PA
    !    *PAPH          PROVISIONAL PRESSURE ON FULL LEVELS            PA
    !    *PCEN*         PROVISIONAL ENVIRONMENT TRACER CONCENTRATION
    !    *PMFU*         MASSFLUX UPDRAFTS                             KG/(M2*S)
    !    *PMFD*         MASSFLUX DOWNDRAFTS                           KG/(M2*S)
    !    *PUDRATE*      UPDRAFT DETRAINMENT                           KG/(M2*S)
    !    *PDDRATE*      DOWNDRAFT DETRAINMENT                         KG/(M2*S)
    !    *PDMFUP*       UPDRAUGT PRECIP (PRODUCTION) IN LAYER         KG/(M2*S)
    !    *PDMFDP*       DDRAUGHT PRECIP (PRODUCTION) IN LAYER         KG/(M2*S)
    !    *PSCAV*        WET SCAVENGING COEFFICIENTS                   UNITLESS
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PTENC*        UPDATED TENDENCY OF CHEM. TRACERS              1/S
    
    !          METHOD
    !          -------
    !     EXPLICIT UPSTREAM AND IMPLICIT SOLUTION OF VERTICAL ADVECTION
    !     DEPENDING ON VALUE OF RMFSOLCT: 0=EXPLICIT 0-1 SEMI-IMPLICIT >=1 IMPLICIT
    
    !     FOR EXPLICIT SOLUTION: ONLY ONE SINGLE ITERATION
    !     FOR IMPLICIT SOLUTION: FIRST IMPLICIT SOLVER, THEN EXPLICIT SOLVER
    !                            TO CORRECT TENDENCIES BELOW CLOUD BASE
    
    
    !------------------------------------------------------------------------------------
    !     COMMENTS FOR OFFLINE USERS IN CHEMICAL TRANSPORT MODELS
    !     (i.e. reading mass fluxes and detrainment rates from ECMWF archive:
    !      ------------------------------------------------------------------
    !     KCTOP IS FIRST LEVEL FROM TOP WHERE PMFU>0
    !     KDTOP IS FIRST LEVEL FROM TOP WHERE PMFD<0
    !     ATTENTION: ON ARCHIVE DETRAINMENT RATES HAVE UNITS KG/(M3*S), SO FOR USE
    !                IN CURRENT ROUTINE YOU HAVE TO MULTIPLY ARCHIVED VALUES BY DZ
    !     LDCUM  IS TRUE IF CONVECTION EXISTS, i.e. IF PMFU>0 IN COLUMN OR IF
    !                       KCTOP>0 AND KCTOP<KLEV
    !     LDDRAF IS TRUE IF DOWNDRAUGHTS EXIST IF PMFD<0 IN COLUMN OR IF
    !                       KDTOP>0 AND KDTOP<KLEV
    !     IF MASSFLUX SATISFIES CFL CRITERIUM M<=DP/Dt IT IS SUFFICIENT TO
    !     ONLY CONSIDER EXPLICIT SOLUTION (RMFSOLCT=0), IN THIS CASE
    !     YOU CAN IGNORE IMPLICIT PART 7.0 OF CURRENT ROUTINE
    !------------------------------------------------------------------------------------
    
    !          EXTERNALS
    !          ---------
    !          CUBIDIAG
    
    !          MODIFICATIONS
    !          -------------
    !        M.Hamrud      01-Oct-2003 CY28 Cleaning
    !        P.Bechtold    07-Oct-2009 add scavenging
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    
    !----------------------------------------------------------------------
    
    USE cubidiag_LOKI_MOD, ONLY: cubidiag_LOKI
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOECUMF, ONLY: TECUMF
    USE YOECUMF2, ONLY: TECUMF2
    USE YOMCUMFS, ONLY: TCUMFS
    
    IMPLICIT NONE
    
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TCUMFS), INTENT(IN) :: YDCUMFS
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TECUMF2), INTENT(IN) :: YDECUMF2
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KTRAC
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KCTOP(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KDTOP(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KTYPE(KLON)
    LOGICAL, INTENT(IN) :: LDCUM(KLON)
    LOGICAL, INTENT(IN) :: LDDRAF(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PTSPHY
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFUO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFDO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PUDRATE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PDDRATE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PDMFUP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PDMFDP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PCEN(KLON, KLEV, KTRAC)
    REAL(KIND=JPRB), INTENT(IN) :: PSCAV(KTRAC)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENC(KLON, KLEV, KTRAC)
    INTEGER(KIND=JPIM) :: IK, IM, JK, JL, JN
    
    REAL(KIND=JPRB) :: ZZP, ZMFA, ZIMP, ZERATE, ZPOSI, ZTSPHY, ZC, ZADVW(KLON)
    REAL(KIND=JPRB) :: ZRMFCMIN, ZRMFSOLCT
    
    !     ALLOCATABLE ARAYS
    REAL(KIND=JPRB), DIMENSION(KLON, KLEV, KTRAC) :: ZCEN, ZCU, ZCD, ZTENC, ZMFC
    REAL(KIND=JPRB), DIMENSION(KLON, KLEV) :: ZDP, ZB, ZR1
    LOGICAL, DIMENSION(KLON, KLEV) :: LLCUMASK, LLCUMBAS
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    POINTER(IP_ZADVW, ZADVW)
    POINTER(IP_ZCEN, ZCEN)
    POINTER(IP_ZCU, ZCU)
    POINTER(IP_ZCD, ZCD)
    POINTER(IP_ZTENC, ZTENC)
    POINTER(IP_ZMFC, ZMFC)
    POINTER(IP_ZDP, ZDP)
    POINTER(IP_ZB, ZB)
    POINTER(IP_ZR1, ZR1)
    POINTER(IP_LLCUMASK, LLCUMASK)
    POINTER(IP_LLCUMBAS, LLCUMBAS)
    YLSTACK_L = YDSTACK_L
    IP_ZADVW = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZCEN = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*KTRAC*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZCU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*KTRAC*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZCD = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*KTRAC*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZTENC = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*KTRAC*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFC = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*KTRAC*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDP = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZB = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZR1 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_LLCUMASK = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
    IP_LLCUMBAS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
!$acc data present( KCTOP, KDTOP, KTYPE, LDCUM, LDDRAF, PAPH, PAP, PMFU, PMFD, PMFUO, PMFDO, PUDRATE, PDDRATE, PDMFUP, PDMFDP,  &
!$acc & PCEN, PTENC, PSCAV, YDCST, YDCUMFS, YDECUMF2, YDECUMF )
    !----------------------------------------------------------------------
    
    IF (YDCUMFS%LECUMFS) THEN
      ZRMFSOLCT = YDECUMF2%RMFSOLCT2
      ZRMFCMIN = YDECUMF2%RMFCMIN2
    ELSE
      ZRMFSOLCT = YDECUMF%RMFSOLCT
      ZRMFCMIN = YDECUMF%RMFCMIN
    END IF
    
    ZIMP = 1.0_JPRB - ZRMFSOLCT
    ZTSPHY = 1.0_JPRB / PTSPHY
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      ZADVW(JL) = 0.0_JPRB
      IF (KTYPE(JL) == 1) ZADVW(JL) = YDECUMF%RMFADVW
      
      ! Initialize Cumulus mask + some setups
      
!$acc loop seq
      DO JK=2,KLEV
        LLCUMASK(JL, JK) = .false.
        IF (LDCUM(JL)) THEN
          ZDP(JL, JK) = YDCST%RG / (PAPH(JL, JK + 1) - PAPH(JL, JK))
          IF (JK >= -1 + KCTOP(JL)) THEN
            LLCUMASK(JL, JK) = .true.
          END IF
        END IF
      END DO
      !----------------------------------------------------------------------
      
!$acc loop seq
      DO JN=1,KTRAC
        
        !*    1.0          DEFINE TRACERS AT HALF LEVELS
        !                  -----------------------------
        
!$acc loop seq
        DO JK=2,KLEV
          IK = JK - 1
          ZCEN(JL, JK, JN) = PCEN(JL, JK, JN)
          ZCD(JL, JK, JN) = PCEN(JL, IK, JN)
          ZCU(JL, JK, JN) = PCEN(JL, IK, JN)
          ZMFC(JL, JK, JN) = 0.0_JPRB
          ZTENC(JL, JK, JN) = 0.0_JPRB
        END DO
        ZCU(JL, KLEV, JN) = PCEN(JL, KLEV, JN)
        
        !*    2.0          COMPUTE UPDRAFT VALUES
        !                  ----------------------
        
!$acc loop seq
        DO JK=KLEV - 1,3,-1
          IK = JK + 1
          IF (LLCUMASK(JL, JK)) THEN
            ZERATE = PMFU(JL, JK) - PMFU(JL, IK) + PUDRATE(JL, JK)
            ZMFA = 1.0_JPRB / MAX(ZRMFCMIN, PMFU(JL, JK))
            IF (JK >= KCTOP(JL)) THEN
              ZCU(JL, JK, JN) = (PMFU(JL, IK)*ZCU(JL, IK, JN) + ZERATE*PCEN(JL, JK, JN) - (PUDRATE(JL, JK) + PDMFUP(JL, JK) &
              & *PSCAV(JN))*ZCU(JL, IK, JN))*ZMFA
              ! if you have a source term dc/dt=dcdt write
              !             ZCU(JL,JK,JN)=( PMFU(JL,IK)*ZCU(JL,IK,JN)+ZERATE*PCEN(JL,JK,JN) &
              !                           -PUDRATE(JL,JK)*ZCU(JL,IK,JN) )*ZMFA
              !                           +dcdt(jl,ik,jn)*ptsphy
            END IF
          END IF
        END DO
        
        
        !*    3.0          COMPUTE DOWNDRAFT VALUES
        !                  ------------------------
        
!$acc loop seq
        DO JK=3,KLEV
          IK = JK - 1
          IF (LDDRAF(JL) .and. JK == KDTOP(JL)) THEN
            !Nota: in order to avoid final negative Tracer values at LFS the allowed value of ZCD
            !      depends on the jump in mass flux at the LFS
            !ZCD(JL,JK,JN)=0.5_JPRB*ZCU(JL,JK,JN)+0.5_JPRB*PCEN(JL,IK,JN)
            ZCD(JL, JK, JN) = 0.1_JPRB*ZCU(JL, JK, JN) + 0.9_JPRB*PCEN(JL, IK, JN)
          ELSE IF (LDDRAF(JL) .and. JK > KDTOP(JL)) THEN
            ZERATE = -PMFD(JL, JK) + PMFD(JL, IK) + PDDRATE(JL, JK)
            ZMFA = 1._JPRB / MIN(-ZRMFCMIN, PMFD(JL, JK))
            ZCD(JL, JK, JN) = (PMFD(JL, IK)*ZCD(JL, IK, JN) - ZERATE*PCEN(JL, IK, JN) + (PDDRATE(JL, JK) + PDMFDP(JL, JK) &
            & *PSCAV(JN))*ZCD(JL, IK, JN))*ZMFA
            ! if you have a source term dc/dt=dcdt write
            !             ZCD(JL,JK,JN)=( PMFD(JL,IK)*ZCD(JL,IK,JN)-ZERATE*PCEN(JL,IK,JN) &
            !                           &+PDDRATE(JL,JK)*ZCD(JL,IK,JN) &
            !                           &+dcdt(jl,ik,jn)*ptsphy
          END IF
        END DO
        
        ! In order to avoid negative Tracer at KLEV adjust ZCD
        JK = KLEV
        IK = JK - 1
        IF (LDDRAF(JL)) THEN
          ZPOSI = -ZDP(JL, JK)*(PMFU(JL, JK)*ZCU(JL, JK, JN) + PMFD(JL, JK)*ZCD(JL, JK, JN) - (PMFU(JL, JK) + PMFD(JL, JK)) &
          & *PCEN(JL, IK, JN))
          IF (PCEN(JL, JK, JN) + PTSPHY*ZPOSI < 0.0_JPRB) THEN
            ZMFA = 1._JPRB / MIN(-ZRMFCMIN, PMFD(JL, JK))
            ZCD(JL, JK, JN) = ((PMFU(JL, JK) + PMFD(JL, JK))*PCEN(JL, IK, JN) - PMFU(JL, JK)*ZCU(JL, JK, JN) + PCEN(JL, JK, JN) / &
            &  (PTSPHY*ZDP(JL, JK)))*ZMFA
          END IF
        END IF
        
      END DO
      
      !----------------------------------------------------------------------
      
!$acc loop seq
      DO JN=1,KTRAC
        
        !*    4.0          COMPUTE FLUXES
        !                  --------------
        
!$acc loop seq
        DO JK=2,KLEV
          IK = JK - 1
          IF (LLCUMASK(JL, JK)) THEN
            ZMFA = PMFU(JL, JK) + PMFD(JL, JK)
            ZMFC(JL, JK, JN) = PMFU(JL, JK)*ZCU(JL, JK, JN) + PMFD(JL, JK)*ZCD(JL, JK, JN) - ZIMP*ZMFA*ZCEN(JL, IK, JN)
          END IF
        END DO
        
        !*    5.0          COMPUTE TENDENCIES = RHS
        !                  ------------------------
        
!$acc loop seq
        DO JK=2,KLEV - 1
          IK = JK + 1
          IF (LLCUMASK(JL, JK)) THEN
            ZTENC(JL, JK, JN) = ZDP(JL, JK)*(ZMFC(JL, IK, JN) - ZMFC(JL, JK, JN))
            !ZTENC(JL,JK,JN)=ZTENC(JL,JK,JN)-ZDP(JL,JK)*PDMFUP(JL,JK)*PSCAV(JN)*ZCU(JL,JK,JN)
          END IF
        END DO
        
        JK = KLEV
        IF (LDCUM(JL)) THEN
          ZTENC(JL, JK, JN) = -ZDP(JL, JK)*ZMFC(JL, JK, JN)
          !ZTENC(JL,JK,JN)=ZTENC(JL,JK,JN)-ZDP(JL,JK)*PDMFUP(JL,JK)*PSCAV(JN)*ZCU(JL,JK,JN)
        END IF
        
      END DO
    END DO
    
    
    IF (ZRMFSOLCT == 0.0_JPRB) THEN
      
      
      !*    6.0          UPDATE TENDENCIES
      !                  -----------------
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
!$acc loop seq
        DO JN=1,KTRAC
!$acc loop seq
          DO JK=2,KLEV
            IF (LLCUMASK(JL, JK)) THEN
              PTENC(JL, JK, JN) = PTENC(JL, JK, JN) + ZTENC(JL, JK, JN)
            END IF
          END DO
        END DO
      END DO
      
      
    ELSE
      
      !---------------------------------------------------------------------------
      
      !*    7.0          IMPLICIT SOLUTION
      !                  -----------------
      
      ! Fill bi-diagonal Matrix vectors A=k-1, B=k;
      ! reuse ZMFC=A and ZB=B;
      ! ZTENC corresponds to the RHS ("constants") of the equation
      ! The solution is in ZR1
      
      LLCUMBAS(:, :) = .false.
      ZB(:, :) = 1._JPRB
      
!$acc loop seq
      DO JN=1,KTRAC
        
        ! Fill vectors A, B and RHS
        
        
!$acc loop vector
        DO JL=KIDIA,KFDIA
!$acc loop seq
          DO JK=2,KLEV
            IK = JK + 1
            IM = JK - 1
            ! LLCUMBAS(JL,JK)=LLCUMASK(JL,JK).AND.JK<=KCBOT(JL)
            LLCUMBAS(JL, JK) = LLCUMASK(JL, JK)
            IF (LLCUMBAS(JL, JK)) THEN
              ZZP = ZRMFSOLCT*ZDP(JL, JK)*PTSPHY
              ZMFC(JL, JK, JN) = -ZZP*(PMFU(JL, JK) + PMFD(JL, JK))
              IF (JK < KLEV) THEN
                ZB(JL, JK) = 1.0_JPRB + ZZP*(PMFU(JL, IK) + PMFD(JL, IK))
              ELSE
                ZB(JL, JK) = 1.0_JPRB
              END IF
              ZZP = YDCST%RG*(PMFUO(JL, JK) + YDECUMF%RMFADVWDD*PMFDO(JL, JK)) / (PAP(JL, JK) - PAP(JL, IM))*PTSPHY*ZADVW(JL)
              ZC = ZZP*(PCEN(JL, IM, JN) - PCEN(JL, JK, JN))
              ZTENC(JL, JK, JN) = ZTENC(JL, JK, JN)*PTSPHY + PCEN(JL, JK, JN) - ZC
            END IF
          END DO
        END DO
        
        
        CALL CUBIDIAG_LOKI(KIDIA, KFDIA, KLON, KLEV, KCTOP, LLCUMBAS, ZMFC(:, :, JN), ZB, ZTENC(:, :, JN), ZR1,  &
        & YDSTACK_L=YLSTACK_L)
        
        ! Compute tendencies
        
        
!$acc loop vector
        DO JL=KIDIA,KFDIA
!$acc loop seq
          DO JK=2,KLEV
            IF (LLCUMBAS(JL, JK)) THEN
              PTENC(JL, JK, JN) = PTENC(JL, JK, JN) + (ZR1(JL, JK) - PCEN(JL, JK, JN))*ZTSPHY
              !  for implicit solution including tendency source term
              !  PTENC(JL,JK,JN)=(ZR1(JL,JK)-PCEN(JL,JK,JN))*ZTSPHY
            END IF
          END DO
        END DO
        
        
      END DO
      
    END IF
    !---------------------------------------------------------------------------
    
    
!$acc end data
  END SUBROUTINE CUCTRACER_LOKI
END MODULE CUCTRACER_LOKI_MOD
