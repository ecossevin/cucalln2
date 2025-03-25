MODULE CUDTDQN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUDTDQN_LOKI (YDTHF, YDCST, YDEPHLI, YDPHNC, YDECUMF, YDEPHY, KIDIA, KFDIA, KLON, KLEV, KTOPM2, KTYPE, KCTOP,  &
  & KCBOT, KDTOP, LDTDKMF, LDCUM, LDDRAF, LSCVFLAG, PTSPHY, PAPH, PAP, PGEOH, PGEO, PTEN, PTENH, PQEN, PQENH, PQSEN, PLGLAC,  &
  & PLUDE, PLUDELI, PSNDE, PMFU, PMFD, PMFUS, PMFDS, PMFUQ, PMFDQ, PMFUL, PDMFUP, PDPMEL, PMFLXR, PMFLXS, PTENT, PTENQ, PENTH,  &
  & YDSTACK_L)
    
    !**** *CUDTDQ* - UPDATES T AND Q TENDENCIES, PRECIPITATION RATES
    !                DOES GLOBAL DIAGNOSTICS
    
    !**   INTERFACE.
    !     ----------
    
    !          *CUDTDQ* IS CALLED FROM *CUMASTR*
    
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
    !    *KCTOP*        CLOUD TOP LEVEL
    !    *KCBOT*        CLOUD BASE LEVEL
    !    *KDTOP*        TOP LEVEL OF DOWNDRAFTS
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    !    *LDDRAF*       FLAG: .TRUE. FOR DOWNDRAFT LEVEL
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTSPHY*       TIME STEP FOR THE PHYSICS                       S
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS            PA
    !    *PAP *         PROVISIONAL PRESSURE ON FULL LEVELS            PA
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                   M2/S2
    !    *PGEO*         GEOPOTENTIAL ON FULL LEVELS                   M2/S2
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)       K
    !    *PQEN*         PROVISIONAL ENVIRONMENT SPEC. HUMIDITY (T+1)  KG/KG
    !    *PTENH*        ENV. TEMPERATURE (T+1) ON HALF LEVELS           K
    !    *PQENH*        ENV. SPEC. HUMIDITY (T+1) ON HALF LEVELS      KG/KG
    !    *PQSEN*        SATURATION ENV. SPEC. HUMIDITY (T+1)          KG/KG
    !    *PLGLAC*       FLUX OF FROZEN CLOUDWATER IN UPDRAFTS         KG/(M2*S)
    !    *PLUDE*        DETRAINED CONDENSATE                          KG/(M2*S)
    !    *PLUDELI*      DETRAINED LIQUID, ICE                         KG/(M2*S)
    !    *PSNDE*        DETRAINED SNOW/RAIN                           KG/(M2*S)
    !    *PMFU*         MASSFLUX UPDRAFTS                             KG/(M2*S)
    !    *PMFD*         MASSFLUX DOWNDRAFTS                           KG/(M2*S)
    !    *PMFUS*        FLUX OF DRY STATIC ENERGY IN UPDRAFTS          J/(M2*S)
    !    *PMFDS*        FLUX OF DRY STATIC ENERGY IN DOWNDRAFTS        J/(M2*S)
    !    *PMFUQ*        FLUX OF SPEC. HUMIDITY IN UPDRAFTS            KG/(M2*S)
    !    *PMFDQ*        FLUX OF SPEC. HUMIDITY IN DOWNDRAFTS          KG/(M2*S)
    !    *PMFUL*        FLUX OF LIQUID WATER IN UPDRAFTS              KG/(M2*S)
    !    *PDMFUP*       FLUX DIFFERENCE OF PRECIP.                    KG/(M2*S)
    !    *PDPMEL*       CHANGE IN PRECIP.-FLUXES DUE TO MELTING       KG/(M2*S)
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PTENT*        TEMPERATURE TENDENCY                           K/S
    !    *PTENQ*        MOISTURE TENDENCY                             KG/(KG S)
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PENTH*        INCREMENT OF DRY STATIC ENERGY                 J/(KG*S)
    
    !----------------------------------------------------------------------
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE         E.C.M.W.F.     7/86 MODIF. 12/89
    
    !     MODIFICATIONS.
    !     --------------
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      03-08-28       : Clean up LINPHYS  P.BECHTOLD
    !      05-10-13       : implicit solution P.BECHTOLD
    !      10-11-17       : allow to substract subbsidence (dyn) P. Bechtold
    !      28-12-21       : correction for enthalpy conservation ice phase P. Bechtold
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !---------------------------------------------------------------------------------
    
    USE cubidiag_LOKI_MOD, ONLY: cubidiag_LOKI
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOETHF, ONLY: TTHF
    USE YOECUMF, ONLY: TECUMF
    USE YOEPHY, ONLY: TEPHY
    USE YOEPHLI, ONLY: TEPHLI
    USE YOPHNC, ONLY: TPHNC
    
    IMPLICIT NONE
    
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    TYPE(TEPHY), INTENT(IN) :: YDEPHY
    TYPE(TPHNC), INTENT(IN) :: YDPHNC
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KTOPM2
    INTEGER(KIND=JPIM), INTENT(IN) :: KTYPE(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KCTOP(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KDTOP(KLON)
    LOGICAL, INTENT(INOUT) :: LDCUM(KLON)
    LOGICAL, INTENT(IN) :: LDDRAF(KLON)
    LOGICAL, INTENT(IN) :: LDTDKMF
    LOGICAL, INTENT(IN) :: LSCVFLAG(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PTSPHY
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PTENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PLGLAC(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PLUDE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PLUDELI(KLON, KLEV, 2)
    REAL(KIND=JPRB), INTENT(INOUT) :: PSNDE(KLON, KLEV, 2)
    REAL(KIND=JPRB), INTENT(IN) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFUS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFDS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFUQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFDQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFUL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PDMFUP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PDPMEL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFLXR(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PMFLXS(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENT(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PENTH(KLON, KLEV)
    
    LOGICAL :: LLTEST
    INTEGER(KIND=JPIM) :: JK, IK, IM, JL
    REAL(KIND=JPRB) :: ZTSPHY, ZIMP, ZORCPD, ZOEALFA, ZTARG, ZZP, ZGQ, ZGS, ZGH, ZS, ZQ
    REAL(KIND=JPRB) :: ZALV(KLON, KLEV), ZALV2(KLON, KLEV), ZINT, ZINT2
    
    REAL(KIND=JPRB) :: ZMFUS(KLON, KLEV), ZMFUQ(KLON, KLEV), ZMFDS(KLON, KLEV), ZMFDQ(KLON, KLEV), ZADVW(KLON)
    
    REAL(KIND=JPRB), DIMENSION(KLON, KLEV) :: ZDTDT, ZDQDT, ZDP
    REAL(KIND=JPRB), DIMENSION(KLON, KLEV) :: ZB, ZR1, ZR2
    LOGICAL, DIMENSION(KLON, KLEV) :: LLCUMBAS
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
#include "fcttre.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    POINTER(IP_ZALV, ZALV)
    POINTER(IP_ZALV2, ZALV2)
    POINTER(IP_ZMFUS, ZMFUS)
    POINTER(IP_ZMFUQ, ZMFUQ)
    POINTER(IP_ZMFDS, ZMFDS)
    POINTER(IP_ZMFDQ, ZMFDQ)
    POINTER(IP_ZADVW, ZADVW)
    POINTER(IP_ZDTDT, ZDTDT)
    POINTER(IP_ZDQDT, ZDQDT)
    POINTER(IP_ZDP, ZDP)
    POINTER(IP_ZB, ZB)
    POINTER(IP_ZR1, ZR1)
    POINTER(IP_ZR2, ZR2)
    POINTER(IP_LLCUMBAS, LLCUMBAS)
    YLSTACK_L = YDSTACK_L
    IP_ZALV = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZALV2 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUQ = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDQ = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZADVW = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDTDT = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDQDT = YLSTACK_L
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
!$acc data present( KTYPE, KCTOP, KCBOT, KDTOP, LDCUM, LDDRAF, LSCVFLAG, PAPH, PAP, PGEOH, PGEO, PTEN, PTENH, PQEN, PQENH,  &
!$acc & PQSEN, PLGLAC, PLUDE, PLUDELI, PSNDE, PMFU, PMFD, PMFUS, PMFDS, PMFUQ, PMFDQ, PMFUL, PDMFUP, PDPMEL, PMFLXR, PMFLXS,  &
!$acc & PTENT, PTENQ, PENTH, YDTHF, YDCST, YDEPHLI, YDPHNC, YDECUMF, YDEPHY )
    
    !----------------------------------------------------------------------
    
    !*    1.0          SETUP AND INITIALIZATIONS
    !                  -------------------------
    
    ZIMP = 1.0_JPRB - YDECUMF%RMFSOLTQ
    ZTSPHY = 1.0_JPRB / PTSPHY
    ZORCPD = 1.0_JPRB / YDCST%RCPD
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      ZADVW(JL) = 0.0_JPRB
      IF (KTYPE(JL) == 1) ZADVW(JL) = YDECUMF%RMFADVW
      
!$acc loop seq
      DO JK=1,KLEV
        PENTH(JL, JK) = 0.0_JPRB
      END DO
      
      !         MASS-FLUX APPROACH SWITCHED ON FOR DEEP CONVECTION ONLY
      !         IN THE TANGENT-LINEAR AND ADJOINT VERSIONS
      
      IF (KTYPE(JL) /= 1 .and. YDEPHLI%LPHYLIN) LDCUM(JL) = .false.
      
      ! zero detrained liquid water if diagnostic cloud scheme to be used
      
      ! this means that detrained liquid water will be evaporated in the
      ! cloud environment and not fed directly into a cloud liquid water
      ! variable
      
      LLTEST = .not.YDEPHY%LEPCLD .and. .not.YDPHNC%LENCLD2 .and. .not.YDPHNC%LEPCLD2 .or. YDEPHLI%LPHYLIN .and.  &
      & .not.YDPHNC%LENCLD2 .and. .not.YDPHNC%LEPCLD2
      
      IF (LLTEST) THEN
!$acc loop seq
        DO JK=1,KLEV
          PLUDE(JL, JK) = 0.0_JPRB
          PLUDELI(JL, JK, 1) = 0.0_JPRB
          PLUDELI(JL, JK, 2) = 0.0_JPRB
        END DO
      END IF
      
!$acc loop seq
      DO JK=1,KLEV
        IF (LDCUM(JL)) THEN
          ZDP(JL, JK) = YDCST%RG / (PAPH(JL, JK + 1) - PAPH(JL, JK))
          ZMFUS(JL, JK) = PMFUS(JL, JK)
          ZMFDS(JL, JK) = PMFDS(JL, JK)
          ZMFUQ(JL, JK) = PMFUQ(JL, JK)
          ZMFDQ(JL, JK) = PMFDQ(JL, JK)
        END IF
      END DO
      
      !------------------------------------------------------------------------------
      
      IF (YDECUMF%RMFSOLTQ > 0.0_JPRB) THEN
        
        !*    2.0          RECOMPUTE CONVECTIVE FLUXES IF IMPLICIT
        
!$acc loop seq
        DO JK=KTOPM2,KLEV
          IK = JK - 1
          !DIR$ IVDEP
          !OCL NOVREC
          IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
            ! compute interpolating coefficients ZGS and ZGQ for half-level values
            ZGQ = (PQENH(JL, JK) - PQEN(JL, IK)) / PQSEN(JL, JK)
            ZGH = YDCST%RCPD*PTEN(JL, JK) + PGEO(JL, JK)
            ZGS = (YDCST%RCPD*(PTENH(JL, JK) - PTEN(JL, IK)) + PGEOH(JL, JK) - PGEO(JL, IK)) / ZGH
            
            !half-level environmental values for S and Q
            ZS = YDCST%RCPD*(ZIMP*PTEN(JL, IK) + ZGS*PTEN(JL, JK)) + PGEO(JL, IK) + ZGS*PGEO(JL, JK)
            ZQ = ZIMP*PQEN(JL, IK) + ZGQ*PQSEN(JL, JK)
            ZMFUS(JL, JK) = PMFUS(JL, JK) - PMFU(JL, JK)*ZS
            ZMFUQ(JL, JK) = PMFUQ(JL, JK) - PMFU(JL, JK)*ZQ
            IF (LDDRAF(JL) .and. JK >= KDTOP(JL)) THEN
              ZMFDS(JL, JK) = PMFDS(JL, JK) - PMFD(JL, JK)*ZS
              ZMFDQ(JL, JK) = PMFDQ(JL, JK) - PMFD(JL, JK)*ZQ
            END IF
          END IF
        END DO
        
      END IF
      
      !*    3.0          COMPUTE TENDENCIES
      !                  ------------------
      
      ZINT = 0._JPRB
!$acc loop seq
      DO JK=KTOPM2,KLEV
        ZALV(JL, JK) = FOELHMCU(PTEN(JL, JK))
        ZALV2(JL, JK) = ZALV(JL, JK)
      END DO
      IF (YDECUMF%LMFENTHCONS) THEN
        ! Integrals for conservation correction ice-phase
!$acc loop seq
        DO JK=KTOPM2,KLEV - 1
          IF (LSCVFLAG(JL)) ZALV(JL, JK) = YDCST%RLVTT
          ZINT = ZINT + YDCST%RLMLT*(PLGLAC(JL, JK) - PDPMEL(JL, JK)) - ZALV(JL, JK)*(PMFUL(JL, JK + 1) - PMFUL(JL, JK)) +  &
          & ZALV2(JL, JK)*PDMFUP(JL, JK)
        END DO
        JK = KLEV
        IF (LSCVFLAG(JL)) ZALV(JL, JK) = YDCST%RLVTT
        ZINT = ZINT + YDCST%RLMLT*(PLGLAC(JL, JK) - PDPMEL(JL, JK)) + ZALV(JL, JK)*PMFUL(JL, JK) + ZALV2(JL, JK)*PDMFUP(JL, JK)
        ZINT2 = ZINT - YDCST%RLVTT*PMFLXR(JL, KLEV + 1) - YDCST%RLSTT*PMFLXS(JL, KLEV + 1)
        IF (ABS(ZINT) > 0.1_JPRB) THEN
          ZINT = ZINT2 / (ZINT + 1.E-3_JPRB)
        ELSE
          ZINT = 0.0_JPRB
        END IF
        IF (ABS(ZINT) > 2.0_JPRB) ZINT = 0.0_JPRB
      END IF
      
!$acc loop seq
      DO JK=KTOPM2,KLEV
        
        IF (JK < KLEV) THEN
          IF (LDCUM(JL)) THEN
            IF (YDEPHLI%LPHYLIN) THEN
              ZTARG = PTEN(JL, JK)
              ZOEALFA = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB))
              ZALV(JL, JK) = ZOEALFA*YDCST%RLVTT + (1.0_JPRB - ZOEALFA)*YDCST%RLSTT
              ZALV2(JL, JK) = ZALV(JL, JK)
            END IF
            IF (LDTDKMF) THEN
              ZDTDT(JL, JK) = ZDP(JL, JK)*ZORCPD*(ZMFUS(JL, JK + 1) - ZMFUS(JL, JK) + ZMFDS(JL, JK + 1) - ZMFDS(JL, JK) +  &
              & YDCST%RLMLT*PLGLAC(JL, JK) - YDCST%RLMLT*PDPMEL(JL, JK) - ZALV(JL, JK)*(PMFUL(JL, JK + 1) - PMFUL(JL, JK) -  &
              & PLUDE(JL, JK) - PDMFUP(JL, JK)))
              
              ZDQDT(JL, JK) = ZDP(JL, JK)*(ZMFUQ(JL, JK + 1) - ZMFUQ(JL, JK) + ZMFDQ(JL, JK + 1) - ZMFDQ(JL, JK) + PMFUL(JL, JK + &
              &  1) - PMFUL(JL, JK) - PLUDE(JL, JK) - PDMFUP(JL, JK))
            ELSE
              ZDTDT(JL, JK) = ZDP(JL, JK)*ZORCPD*(ZMFUS(JL, JK + 1) - ZMFUS(JL, JK) + ZMFDS(JL, JK + 1) - ZMFDS(JL, JK) +  &
              & (YDCST%RLMLT*(PLGLAC(JL, JK) - PDPMEL(JL, JK)) - ZALV(JL, JK)*(PMFUL(JL, JK + 1) - PMFUL(JL, JK)) + ZALV2(JL, JK) &
              & *PDMFUP(JL, JK))*(1.0_JPRB - ZINT) + YDCST%RLVTT*(PLUDELI(JL, JK, 1) + PSNDE(JL, JK, 1)) +  &
              & YDCST%RLSTT*(PLUDELI(JL, JK, 2) + PSNDE(JL, JK, 2)))
              
              ZDQDT(JL, JK) = ZDP(JL, JK)*(ZMFUQ(JL, JK + 1) - ZMFUQ(JL, JK) + ZMFDQ(JL, JK + 1) - ZMFDQ(JL, JK) + PMFUL(JL, JK + &
              &  1) - PMFUL(JL, JK) - PLUDE(JL, JK) - PDMFUP(JL, JK) - PSNDE(JL, JK, 1) - PSNDE(JL, JK, 2))
            END IF
          END IF
          
        ELSE
          IF (LDCUM(JL)) THEN
            IF (YDEPHLI%LPHYLIN) THEN
              ZTARG = PTEN(JL, JK)
              ZOEALFA = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB))
              ZALV(JL, JK) = ZOEALFA*YDCST%RLVTT + (1.0_JPRB - ZOEALFA)*YDCST%RLSTT
              ZALV2(JL, JK) = ZALV(JL, JK)
            END IF
            ZDTDT(JL, JK) = -ZDP(JL, JK)*ZORCPD*(ZMFUS(JL, JK) + ZMFDS(JL, JK) + (YDCST%RLMLT*(PDPMEL(JL, JK) - PLGLAC(JL, JK)) - &
            &  ZALV(JL, JK)*PMFUL(JL, JK) - ZALV2(JL, JK)*PDMFUP(JL, JK))*(1.0_JPRB - ZINT))
            
            ZDQDT(JL, JK) = -ZDP(JL, JK)*(ZMFUQ(JL, JK) + ZMFDQ(JL, JK) + (PMFUL(JL, JK) + PDMFUP(JL, JK)))
          END IF
        END IF
        
      END DO
    END DO
    
    
    IF (YDECUMF%RMFSOLTQ == 0.0_JPRB) THEN
      
      !*    3.1          UPDATE TENDENCIES
      !                  -----------------
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
!$acc loop seq
        DO JK=KTOPM2,KLEV
          IF (LDCUM(JL)) THEN
            PTENT(JL, JK) = PTENT(JL, JK) + ZDTDT(JL, JK)
            PTENQ(JL, JK) = PTENQ(JL, JK) + ZDQDT(JL, JK)
            PENTH(JL, JK) = ZDTDT(JL, JK)*YDCST%RCPD
          END IF
        END DO
      END DO
      
      
    ELSE
      !----------------------------------------------------------------------
      
      !*    3.2          IMPLICIT SOLUTION
      !                  -----------------
      
      ! Fill bi-diagonal Matrix vectors A=k-1, B=k, C=k+1;
      ! reuse ZMFUS=A
      ! ZDTDT and ZDQDT correspond to the RHS ("constants") of the equation
      ! The solution is in ZR1 and ZR2
      
      LLCUMBAS(:, :) = .false.
      ZB(:, :) = 1.0_JPRB
      ZMFUS(:, :) = 0.0_JPRB
      
      ! Fill vectors A, B and RHS
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
!$acc loop seq
        DO JK=KTOPM2,KLEV
          IK = JK + 1
          IM = JK - 1
          LLCUMBAS(JL, JK) = LDCUM(JL) .and. JK >= KCTOP(JL) - 1
          IF (LLCUMBAS(JL, JK)) THEN
            ZZP = YDECUMF%RMFSOLTQ*ZDP(JL, JK)*PTSPHY
            ZMFUS(JL, JK) = -ZZP*(PMFU(JL, JK) + PMFD(JL, JK))
            IF (JK < KLEV) THEN
              ZB(JL, JK) = 1.0_JPRB + ZZP*(PMFU(JL, IK) + PMFD(JL, IK))
            ELSE
              ZB(JL, JK) = 1.0_JPRB
            END IF
            IF (LDTDKMF) THEN
              ZDTDT(JL, JK) = ZDTDT(JL, JK)*PTSPHY + PTEN(JL, JK)
              ZDQDT(JL, JK) = ZDQDT(JL, JK)*PTSPHY + PQEN(JL, JK)
            ELSE
              ZZP = YDCST%RG*(PMFU(JL, JK) + YDECUMF%RMFADVWDD*PMFD(JL, JK)) / (PAP(JL, JK) - PAP(JL, IM))*PTSPHY*ZADVW(JL)
              ZS = ZZP*(PTEN(JL, IM) - PTEN(JL, JK) + ZORCPD*(PGEO(JL, IM) - PGEO(JL, JK)))
              ZQ = ZZP*(PQEN(JL, IM) - PQEN(JL, JK))
              ZDTDT(JL, JK) = (ZDTDT(JL, JK) + PTENT(JL, JK)*YDECUMF%RMFSOLRHS)*PTSPHY + PTEN(JL, JK) - ZS
              ZDQDT(JL, JK) = (ZDQDT(JL, JK) + PTENQ(JL, JK)*YDECUMF%RMFSOLRHS)*PTSPHY + PQEN(JL, JK) - ZQ
            END IF
          END IF
        END DO
      END DO
      
      
      CALL CUBIDIAG_LOKI(KIDIA, KFDIA, KLON, KLEV, KCTOP, LLCUMBAS, ZMFUS, ZB, ZDTDT, ZR1, YDSTACK_L=YLSTACK_L)
      
      CALL CUBIDIAG_LOKI(KIDIA, KFDIA, KLON, KLEV, KCTOP, LLCUMBAS, ZMFUS, ZB, ZDQDT, ZR2, YDSTACK_L=YLSTACK_L)
      
      ! Compute tendencies
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
!$acc loop seq
        DO JK=KTOPM2,KLEV
          IF (LLCUMBAS(JL, JK)) THEN
            IF (LDTDKMF) THEN
              PTENT(JL, JK) = PTENT(JL, JK) + (ZR1(JL, JK) - PTEN(JL, JK))*ZTSPHY
              PTENQ(JL, JK) = PTENQ(JL, JK) + (ZR2(JL, JK) - PQEN(JL, JK))*ZTSPHY
            ELSE
              PTENT(JL, JK) = PTENT(JL, JK)*(1.0_JPRB - YDECUMF%RMFSOLRHS) + (ZR1(JL, JK) - PTEN(JL, JK))*ZTSPHY
              PTENQ(JL, JK) = PTENQ(JL, JK)*(1.0_JPRB - YDECUMF%RMFSOLRHS) + (ZR2(JL, JK) - PQEN(JL, JK))*ZTSPHY
            END IF
            PENTH(JL, JK) = (ZR1(JL, JK) - PTEN(JL, JK))*ZTSPHY
          END IF
        END DO
      END DO
      
      
      !----------------------------------------------------------------------
    END IF
    
    
!$acc end data
  END SUBROUTINE CUDTDQN_LOKI
END MODULE CUDTDQN_LOKI_MOD
