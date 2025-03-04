!OPTIONS XOPT(HSFUN)
MODULE CUFLXN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUFLXN_LOKI (YDTHF, YDCST, YDEPHLI, YDECUMF, KIDIA, KFDIA, KLON, KLEV, PTSPHY, PTEN, PQEN, PQSEN, PTENH, PQENH,  &
  & PAPH, PAP, PGEOH, LDLAND, LDCUM, LDTDKMF, KCBOT, KCTOP, KDTOP, KTOPM2, KTYPE, LDDRAF, PMFU, PMFD, PMFUS, PMFDS, PMFUQ,  &
  & PMFDQ, PMFUL, PLUDE, PLUDELI, PLRAIN, PSNDE, PDMFUP, PDMFDP, PDPMEL, PLGLAC, PMFLXR, PMFLXS, PRAIN, PMFUDE_RATE,  &
  & PMFDDE_RATE, YDSTACK_L)
    
    !          PURPOSE
    !          -------
    
    !          THIS ROUTINE DOES THE FINAL CALCULATION OF CONVECTIVE
    !          FLUXES IN THE CLOUD LAYER AND IN THE SUBCLOUD LAYER
    
    !          INTERFACE
    !          ---------
    !          THIS ROUTINE IS CALLED FROM *CUMASTR*.
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KCBOT*        CLOUD BASE LEVEL
    !    *KCTOP*        CLOUD TOP LEVEL
    !    *KDTOP*        TOP LEVEL OF DOWNDRAFTS
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDLAND*       LAND SEA MASK (.TRUE. FOR LAND)
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    !    *LDTDKMF*      Arpege tuning (if TRUE)
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTSPHY*       TIME STEP FOR THE PHYSICS                       S
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)       K
    !    *PQEN*         PROVISIONAL ENVIRONMENT SPEC. HUMIDITY (T+1)  KG/KG
    !    *PQSEN*        ENVIRONMENT SPEC. SATURATION HUMIDITY (T+1)   KG/KG
    !    *PTENH*        ENV. TEMPERATURE (T+1) ON HALF LEVELS           K
    !    *PQENH*        ENV. SPEC. HUMIDITY (T+1) ON HALF LEVELS      KG/KG
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS            PA
    !    *PAP*          PROVISIONAL PRESSURE ON FULL LEVELS            PA
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                   M2/S2
    
    !    UPDATED PARAMETERS (INTEGER):
    
    !    *KTYPE*        SET TO ZERO IF LDCUM=.FALSE.
    
    !    UPDATED PARAMETERS (LOGICAL):
    
    !    *LDDRAF*       SET TO .FALSE. IF LDCUM=.FALSE. OR KDTOP<KCTOP
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PMFU*         MASSFLUX IN UPDRAFTS                          KG/(M2*S)
    !    *PMFD*         MASSFLUX IN DOWNDRAFTS                        KG/(M2*S)
    !    *PMFUS*        FLUX OF DRY STATIC ENERGY IN UPDRAFTS          J/(M2*S)
    !    *PMFDS*        FLUX OF DRY STATIC ENERGY IN DOWNDRAFTS        J/(M2*S)
    !    *PMFUQ*        FLUX OF SPEC. HUMIDITY IN UPDRAFTS            KG/(M2*S)
    !    *PMFDQ*        FLUX OF SPEC. HUMIDITY IN DOWNDRAFTS          KG/(M2*S)
    !    *PMFUL*        FLUX OF LIQUID WATER IN UPDRAFTS              KG/(M2*S)
    !    *PLUDE*        DETRAINED LIQUID WATER                        KG/(M2*S)
    !    *PLRAIN*       SNOW/RAIN MIXING RATIO                        KG/(KG)
    !    *PSNDE*        DETRAINED SNOW/RAIN                           KG/(M2*S)
    !    *PDMFUP*       FLUX DIFFERENCE OF PRECIP. IN UPDRAFTS        KG/(M2*S)
    !    *PDMFDP*       FLUX DIFFERENCE OF PRECIP. IN DOWNDRAFTS      KG/(M2*S)
    !    *PMFUDE_RATE*  UPDRAFT DETRAINMENT RATE                      KG/(M2*S)
    !    *PMFDDE_RATE*  DOWNDRAFT DETRAINMENT RATE                    KG/(M2*S)
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PDPMEL*       CHANGE IN PRECIP.-FLUXES DUE TO MELTING       KG/(M2*S)
    !    *PLGLAC*       FLUX OF FROZEN CLOUD WATER IN UPDRAFTS        KG/(M2*S)
    !    *PMFLXR*       CONVECTIVE RAIN FLUX                          KG/(M2*S)
    !    *PMFLXS*       CONVECTIVE SNOW FLUX                          KG/(M2*S)
    !    *PRAIN*        TOTAL PRECIP. PRODUCED IN CONV. UPDRAFTS      KG/(M2*S)
    !                   (NO EVAPORATION IN DOWNDRAFTS)
    
    !          EXTERNALS
    !          ---------
    !          NONE
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE         E.C.M.W.F.     7/86 MODIF. 12/89
    
    !     MODIFICATIONS.
    !     --------------
    !      03-08-28 : Clean up LINPHYS; Bugs in Evapor.    P.BECHTOLD
    !      05-02-11 : Extend DDMflux to surface if zero    P.BECHTOLD
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      N.Semane+P.Bechtold     04-10-2012 Add RCVRFACTOR factor for small planet
    !      20210913 : Modifications for Arpege Y.Bouteloup (LDTDKMF)
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !----------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOETHF, ONLY: TTHF
    USE YOEPHLI, ONLY: TEPHLI
    USE YOECUMF, ONLY: TECUMF
    
    IMPLICIT NONE
    
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    REAL(KIND=JPRB), INTENT(IN) :: PTSPHY
    REAL(KIND=JPRB), INTENT(IN) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PTENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    LOGICAL, INTENT(IN) :: LDLAND(KLON)
    LOGICAL, INTENT(IN) :: LDCUM(KLON)
    LOGICAL, INTENT(IN) :: LDTDKMF
    INTEGER(KIND=JPIM), INTENT(IN) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KCTOP(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KDTOP(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KTOPM2
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KTYPE(KLON)
    LOGICAL, INTENT(INOUT) :: LDDRAF(KLON)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFUS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFDS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFUQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFDQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFUL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLUDE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLUDELI(KLON, KLEV, 2)
    REAL(KIND=JPRB), INTENT(IN) :: PLRAIN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PSNDE(KLON, KLEV, 2)
    REAL(KIND=JPRB), INTENT(INOUT) :: PDMFUP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PDMFDP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PDPMEL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PLGLAC(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFLXR(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFLXS(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(OUT) :: PRAIN(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PMFUDE_RATE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFDDE_RATE(KLON, KLEV)
    
    REAL(KIND=JPRB) :: ZRHEBC, ZMFS, ZRCUCOV
    INTEGER(KIND=JPIM) :: IK, IKB, JK, JL
    INTEGER(KIND=JPIM) :: IDBAS
    LOGICAL :: LLDDRAF
    
    REAL(KIND=JPRB) :: ZALFAW, ZCONS1, ZCONS1A, ZCONS2, ZDENOM, ZDRFL, ZDRFL1, ZFAC, ZFOEEWI, ZFOEEWL, ZOEALFA, ZOEEWM, ZOELHM,  &
    & ZPDR, ZPDS, ZRFL, ZRFLN, ZRMIN, ZRNEW, ZSNMLT, ZTARG, ZTMST, ZZP, ZTWETB, ZWETB, ZTEN, ZGLAC, ZMFMAX, ZRHM
    ! Numerical fit to wet bulb temperature
    REAL(KIND=JPRB), PARAMETER :: ZTW1 = 1329.31_JPRB
    REAL(KIND=JPRB), PARAMETER :: ZTW2 = 0.0074615_JPRB
    REAL(KIND=JPRB), PARAMETER :: ZTW3 = 0.85E5_JPRB
    REAL(KIND=JPRB), PARAMETER :: ZTW4 = 40.637_JPRB
    REAL(KIND=JPRB), PARAMETER :: ZTW5 = 275.0_JPRB
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    !DIR$ VFUNCTION EXPHF
#include "fcttre.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    YLSTACK_L = YDSTACK_L
!$acc data present( PTEN, PQEN, PQSEN, PTENH, PQENH, PAPH, PAP, PGEOH, LDLAND, LDCUM, KCBOT, KCTOP, KDTOP, KTYPE, LDDRAF, PMFU,  &
!$acc & PMFD, PMFUS, PMFDS, PMFUQ, PMFDQ, PMFUL, PLUDE, PLUDELI, PLRAIN, PSNDE, PDMFUP, PDMFDP, PDPMEL, PLGLAC, PMFLXR, PMFLXS,  &
!$acc & PRAIN, PMFUDE_RATE, PMFDDE_RATE, YDTHF, YDCST, YDEPHLI, YDECUMF )
    
    !--------------------------------------------------------------------
    !*             SPECIFY CONSTANTS
    
    ZTMST = PTSPHY
    ZCONS1A = YDCST%RCPD / (YDCST%RLMLT*YDCST%RG*YDECUMF%RTAUMEL)
    !ZCONS2=1.0_JPRB/(RG*ZTMST)
    ZCONS2 = YDECUMF%RMFCFL / (YDCST%RG*ZTMST)
    IF (YDECUMF%LMFWETB) THEN
      ZWETB = 1.0_JPRB
    ELSE
      ZWETB = 0.0_JPRB
    END IF
    IF (YDECUMF%LMFGLAC) THEN
      ZGLAC = 0.0_JPRB
    ELSE
      ZGLAC = 1.0_JPRB
    END IF
    
    !*    1.0          DETERMINE FINAL CONVECTIVE FLUXES
    !                  ---------------------------------
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      PRAIN(JL) = 0.0_JPRB
      IF (.not.LDCUM(JL) .or. KDTOP(JL) < KCTOP(JL)) LDDRAF(JL) = .false.
      IF (.not.LDCUM(JL)) KTYPE(JL) = 0
      IDBAS = KLEV
      IF (LDLAND(JL)) THEN
        ZRHEBC = 0.75_JPRB
        IF (KTYPE(JL) == 1) ZRHEBC = 0.70_JPRB
      ELSE
        ZRHEBC = YDECUMF%RHEBC
        IF (KTYPE(JL) == 1) ZRHEBC = 0.85_JPRB
      END IF
      ! TO GET IDENTICAL RESULTS FOR DIFFERENT NPROMA FORCE KTOPM2 TO 2
      KTOPM2 = 2
!$acc loop seq
      DO JK=KTOPM2,KLEV
        IKB = MIN(JK + 1, KLEV)
        !DIR$ IVDEP
        !OCL NOVREC
        PMFLXR(JL, JK) = 0.0_JPRB
        PMFLXS(JL, JK) = 0.0_JPRB
        PDPMEL(JL, JK) = 0.0_JPRB
        PSNDE(JL, JK, 1) = 0.0_JPRB
        PSNDE(JL, JK, 2) = 0.0_JPRB
        IF (LDCUM(JL) .and. JK >= KCTOP(JL)) THEN
          PMFUS(JL, JK) = PMFUS(JL, JK) - PMFU(JL, JK)*(YDCST%RCPD*PTENH(JL, JK) + PGEOH(JL, JK))
          PMFUQ(JL, JK) = PMFUQ(JL, JK) - PMFU(JL, JK)*PQENH(JL, JK)
          PLGLAC(JL, JK) = PMFU(JL, JK)*PLGLAC(JL, JK)
          LLDDRAF = LDDRAF(JL) .and. JK >= KDTOP(JL)
          IF (LLDDRAF) THEN
            PMFDS(JL, JK) = PMFDS(JL, JK) - PMFD(JL, JK)*(YDCST%RCPD*PTENH(JL, JK) + PGEOH(JL, JK))
            PMFDQ(JL, JK) = PMFDQ(JL, JK) - PMFD(JL, JK)*PQENH(JL, JK)
          ELSE
            PMFD(JL, JK) = 0.0_JPRB
            PMFDS(JL, JK) = 0.0_JPRB
            PMFDQ(JL, JK) = 0.0_JPRB
            PDMFDP(JL, JK - 1) = 0.0_JPRB
          END IF
          IF (LLDDRAF .and. PMFD(JL, JK) < 0._JPRB .and. PMFD(JL, IKB) == 0._JPRB) THEN
            IDBAS = JK
          END IF
        ELSE
          PMFU(JL, JK) = 0.0_JPRB
          PMFD(JL, JK) = 0.0_JPRB
          PMFUS(JL, JK) = 0.0_JPRB
          PMFDS(JL, JK) = 0.0_JPRB
          PMFUQ(JL, JK) = 0.0_JPRB
          PMFDQ(JL, JK) = 0.0_JPRB
          PMFUL(JL, JK) = 0.0_JPRB
          PLGLAC(JL, JK) = 0.0_JPRB
          PDMFUP(JL, JK - 1) = 0.0_JPRB
          PDMFDP(JL, JK - 1) = 0.0_JPRB
          PLUDE(JL, JK - 1) = 0.0_JPRB
          PLUDELI(JL, JK - 1, 1) = 0.0_JPRB
          PLUDELI(JL, JK - 1, 2) = 0.0_JPRB
        END IF
      END DO
      PMFLXR(:, KLEV + 1) = 0.0_JPRB
      PMFLXS(:, KLEV + 1) = 0.0_JPRB
      PMFLXR(:, 1) = 0.0_JPRB
      PMFLXS(:, 1) = 0.0_JPRB
      PSNDE(:, 1, 1) = 0.0_JPRB
      PSNDE(:, 1, 2) = 0.0_JPRB
      
      !*    1.5          SCALE FLUXES BELOW CLOUD BASE
      !                  LINEAR DCREASE
      !                  -----------------------------
      
      !DIR$ IVDEP
      !OCL NOVREC
      IF (LDCUM(JL)) THEN
        IKB = KCBOT(JL)
        IK = IKB + 1
        ZZP = ((PAPH(JL, KLEV + 1) - PAPH(JL, IK)) / (PAPH(JL, KLEV + 1) - PAPH(JL, IKB)))
        IF (KTYPE(JL) == 3) ZZP = ZZP*ZZP
        PMFU(JL, IK) = PMFU(JL, IKB)*ZZP
        IF (YDEPHLI%LPHYLIN) THEN
          ZTARG = PTENH(JL, IKB)
          ZOEALFA = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB))
          ZOELHM = ZOEALFA*YDCST%RLVTT + (1.0_JPRB - ZOEALFA)*YDCST%RLSTT
          PMFUS(JL, IK) = (PMFUS(JL, IKB) - ZOELHM*PMFUL(JL, IKB))*ZZP
        ELSE
          PMFUS(JL, IK) = (PMFUS(JL, IKB) - FOELHMCU(PTENH(JL, IKB))*PMFUL(JL, IKB))*ZZP
        END IF
        PMFUQ(JL, IK) = (PMFUQ(JL, IKB) + PMFUL(JL, IKB))*ZZP
        PMFUL(JL, IK) = 0.0_JPRB
      END IF
!$acc loop seq
      DO JK=KTOPM2,KLEV
        !DIR$ IVDEP
        !OCL NOVREC
        IF (LDCUM(JL) .and. JK > 1 + KCBOT(JL)) THEN
          IKB = KCBOT(JL) + 1
          ZZP = ((PAPH(JL, KLEV + 1) - PAPH(JL, JK)) / (PAPH(JL, KLEV + 1) - PAPH(JL, IKB)))
          IF (KTYPE(JL) == 3) ZZP = ZZP*ZZP
          PMFU(JL, JK) = PMFU(JL, IKB)*ZZP
          PMFUS(JL, JK) = PMFUS(JL, IKB)*ZZP
          PMFUQ(JL, JK) = PMFUQ(JL, IKB)*ZZP
          PMFUL(JL, JK) = 0.0_JPRB
        END IF
        IK = IDBAS
        LLDDRAF = LDDRAF(JL) .and. JK > IK .and. IK < KLEV
        IF (LLDDRAF .and. IK == 1 + KCBOT(JL)) THEN
          ZZP = ((PAPH(JL, KLEV + 1) - PAPH(JL, JK)) / (PAPH(JL, KLEV + 1) - PAPH(JL, IK)))
          IF (KTYPE(JL) == 3) ZZP = ZZP*ZZP
          PMFD(JL, JK) = PMFD(JL, IK)*ZZP
          PMFDS(JL, JK) = PMFDS(JL, IK)*ZZP
          PMFDQ(JL, JK) = PMFDQ(JL, IK)*ZZP
          PMFDDE_RATE(JL, JK) = -(PMFD(JL, JK - 1) - PMFD(JL, JK))
        ELSE IF (LLDDRAF .and. IK /= 1 + KCBOT(JL) .and. JK == 1 + IK) THEN
          PMFDDE_RATE(JL, JK) = -(PMFD(JL, JK - 1) - PMFD(JL, JK))
        END IF
      END DO
      
      !- rescale DD fluxes if total mass flux becomes negative
      ZMFS = 1.0_JPRB
      !DO JK=2,KLEV-1
!$acc loop seq
      DO JK=2,KLEV
        ! change for stability
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LDDRAF(JL) .and. JK >= -1 + KDTOP(JL)) THEN
          ZMFMAX = ABS(PMFU(JL, JK))*0.98_JPRB
          IF (PMFD(JL, JK) + ZMFMAX + 1.E-15_JPRB < 0.0_JPRB) THEN
            ZMFS = MIN(ZMFS, -ZMFMAX / PMFD(JL, JK))
          END IF
        END IF
      END DO
      
!$acc loop seq
      DO JK=2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (ZMFS < 1.0_JPRB .and. JK >= -1 + KDTOP(JL)) THEN
          PMFD(JL, JK) = PMFD(JL, JK)*ZMFS
          PMFDS(JL, JK) = PMFDS(JL, JK)*ZMFS
          PMFDQ(JL, JK) = PMFDQ(JL, JK)*ZMFS
          PMFDDE_RATE(JL, JK) = PMFDDE_RATE(JL, JK)*ZMFS
          PDMFDP(JL, JK) = PDMFDP(JL, JK)*ZMFS
        END IF
      END DO
      
      
      !*    2.            CALCULATE RAIN/SNOW FALL RATES
      !*                  CALCULATE MELTING OF SNOW
      !*                  CALCULATE EVAPORATION OF PRECIP
      !                   -------------------------------
      
!$acc loop seq
      DO JK=KTOPM2,KLEV
        IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
          PRAIN(JL) = PRAIN(JL) + PDMFUP(JL, JK)
          ZTWETB = PTEN(JL, JK) - MAX(0.0_JPRB, PQSEN(JL, JK) - PQEN(JL, JK))*(ZTW1 + ZTW2*(PAP(JL, JK) - ZTW3) - ZTW4*(PTEN(JL,  &
          & JK) - ZTW5))
          ZTEN = ZTWETB*ZWETB + (1.0_JPRB - ZWETB)*PTEN(JL, JK)
          IF (PMFLXS(JL, JK) > 0.0_JPRB .and. ZTEN > YDCST%RTT) THEN
            ZCONS1 = ZCONS1A*(1.0_JPRB + 0.5_JPRB*(ZTEN - YDCST%RTT))
            ZFAC = ZCONS1*(PAPH(JL, JK + 1) - PAPH(JL, JK))
            ZSNMLT = MIN(PMFLXS(JL, JK), ZFAC*(ZTEN - YDCST%RTT))
            PDPMEL(JL, JK) = ZSNMLT
            IF (YDEPHLI%LPHYLIN) THEN
              ZTARG = ZTEN - ZSNMLT / ZFAC
              ZOEALFA = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB))
              ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4LES))
              ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4IES))
              ZOEEWM = ZOEALFA*ZFOEEWL + (1.0_JPRB - ZOEALFA)*ZFOEEWI
              PQSEN(JL, JK) = ZOEEWM / PAP(JL, JK)
            ELSE
              PQSEN(JL, JK) = FOEEWMCU(ZTEN - ZSNMLT / ZFAC) / PAP(JL, JK)
            END IF
          END IF
          IF (YDEPHLI%LPHYLIN) THEN
            ZALFAW = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(ZTEN - YDEPHLI%RLPTRC)) + 1.0_JPRB))
          ELSE
            ZALFAW = FOEALFCU(ZTEN)
          END IF
          !no liquid precipitation above melting level
          !     add heat not yet liberated in updraught precip
          IF (PTEN(JL, JK) <= YDCST%RTT .and. ZALFAW > 0.0_JPRB) THEN
            PLGLAC(JL, JK) = PLGLAC(JL, JK) + ZGLAC*ZALFAW*PDMFUP(JL, JK) + ZALFAW*PDMFDP(JL, JK)
            ZALFAW = 0.0_JPRB
          END IF
          IF (YDECUMF%LMFDSNOW .and. JK <= KCBOT(JL)) THEN
            PSNDE(JL, JK, 2) = PLRAIN(JL, JK + 1)*PMFUDE_RATE(JL, JK)
            PSNDE(JL, JK, 1) = PSNDE(JL, JK, 2)*ZALFAW
            PSNDE(JL, JK, 2) = PSNDE(JL, JK, 2)*(1.0_JPRB - ZALFAW)
            PSNDE(JL, JK, 1) = MIN(PSNDE(JL, JK, 1), ZALFAW*(PDMFUP(JL, JK) + PDMFDP(JL, JK)))
            PSNDE(JL, JK, 2) = MIN(PSNDE(JL, JK, 2), (1.0_JPRB - ZALFAW)*(PDMFUP(JL, JK) + PDMFDP(JL, JK)) - PDPMEL(JL, JK))
            !PSNDE(JL,JK,1)=0.0_JPRB
            PSNDE(JL, JK, 1) = MAX(PSNDE(JL, JK, 1), 0.0_JPRB)
            PSNDE(JL, JK, 2) = MAX(PSNDE(JL, JK, 2), 0.0_JPRB)
          END IF
          PMFLXR(JL, JK + 1) = PMFLXR(JL, JK) + ZALFAW*(PDMFUP(JL, JK) + PDMFDP(JL, JK)) + PDPMEL(JL, JK) - PSNDE(JL, JK, 1)
          PMFLXS(JL, JK + 1) =  &
          & PMFLXS(JL, JK) + (1.0_JPRB - ZALFAW)*(PDMFUP(JL, JK) + PDMFDP(JL, JK)) - PDPMEL(JL, JK) - PSNDE(JL, JK, 2)
          IF (PMFLXR(JL, 1 + JK) + PMFLXS(JL, 1 + JK) < 0.0_JPRB) THEN
            PDMFDP(JL, JK) = -(PMFLXR(JL, JK) + PMFLXS(JL, JK) + PDMFUP(JL, JK))
            PMFLXR(JL, JK + 1) = 0.0_JPRB
            PMFLXS(JL, JK + 1) = 0.0_JPRB
            PDPMEL(JL, JK) = 0.0_JPRB
          ELSE IF (PMFLXR(JL, 1 + JK) < 0.0_JPRB) THEN
            PMFLXS(JL, JK + 1) = PMFLXS(JL, JK + 1) + PMFLXR(JL, JK + 1)
            PMFLXR(JL, JK + 1) = 0.0_JPRB
          ELSE IF (PMFLXS(JL, 1 + JK) < 0.0_JPRB) THEN
            PMFLXR(JL, JK + 1) = PMFLXR(JL, JK + 1) + PMFLXS(JL, JK + 1)
            PMFLXS(JL, JK + 1) = 0.0_JPRB
          END IF
        END IF
      END DO
      
      ! Increase area fraction for evaporation depending on average RH in cloud-layer
      IF (.not.LDTDKMF) THEN
        IF (KTYPE(JL) >= 2) THEN
          IKB = KCBOT(JL)
          IK = KCTOP(JL)
          ZRHM = 0.5*(PQEN(JL, IKB) / PQSEN(JL, IKB) + PQEN(JL, IK) / PQSEN(JL, IK))
          ZRCUCOV = YDECUMF%RCUCOV*(1.0_JPRB + (MAX(0.8_JPRB, ZRHM) - 0.8_JPRB) / 0.025_JPRB)
        ELSE
          ZRCUCOV = YDECUMF%RCUCOV*0.6
        END IF
      ELSE
        ZRCUCOV = YDECUMF%RCUCOV
      END IF
      
!$acc loop seq
      DO JK=KTOPM2,KLEV
        IF (LDCUM(JL) .and. JK >= KCBOT(JL)) THEN
          ZRFL = PMFLXR(JL, JK) + PMFLXS(JL, JK)
          IF (ZRFL > 1.E-12_JPRB) THEN
            ZDRFL1 = YDECUMF%RCPECONS*MAX(0.0_JPRB, PQSEN(JL, JK) - PQEN(JL, JK))*ZRCUCOV*(SQRT(PAPH(JL, JK) / PAPH(JL, KLEV + 1) &
            & ) / YDECUMF%RCVRFACTOR*ZRFL / ZRCUCOV)**0.5777_JPRB*(PAPH(JL, JK + 1) - PAPH(JL, JK))
            ZRNEW = ZRFL - ZDRFL1
            ZRMIN = ZRFL - ZRCUCOV*MAX(0.0_JPRB, ZRHEBC*PQSEN(JL, JK) - PQEN(JL, JK))*ZCONS2*(PAPH(JL, JK + 1) - PAPH(JL, JK))
            ZRNEW = MAX(ZRNEW, ZRMIN)
            ZRFLN = MAX(ZRNEW, 0.0_JPRB)
            ZDRFL = MIN(0.0_JPRB, ZRFLN - ZRFL)
            IF (YDEPHLI%LPHYLIN) THEN
              ZALFAW = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(PTEN(JL, JK) - YDEPHLI%RLPTRC)) + 1.0_JPRB))
            ELSE
              ZALFAW = FOEALFCU(PTEN(JL, JK))
            END IF
            IF (PTEN(JL, JK) < YDCST%RTT) ZALFAW = 0.0_JPRB
            ZPDR = ZALFAW*PDMFDP(JL, JK)
            ZPDS = (1.0_JPRB - ZALFAW)*PDMFDP(JL, JK)
            ZDENOM = 1.0_JPRB / MAX(1.E-12_JPRB, PMFLXR(JL, JK) + PMFLXS(JL, JK))
            PMFLXR(JL, JK + 1) = PMFLXR(JL, JK) + ZPDR + PDPMEL(JL, JK) + ZDRFL*PMFLXR(JL, JK)*ZDENOM
            PMFLXS(JL, JK + 1) = PMFLXS(JL, JK) + ZPDS - PDPMEL(JL, JK) + ZDRFL*PMFLXS(JL, JK)*ZDENOM
            PDMFUP(JL, JK) = PDMFUP(JL, JK) + ZDRFL
            IF (PMFLXR(JL, 1 + JK) + PMFLXS(JL, 1 + JK) < 0.0_JPRB) THEN
              PDMFUP(JL, JK) = PDMFUP(JL, JK) - (PMFLXR(JL, JK + 1) + PMFLXS(JL, JK + 1))
              PMFLXR(JL, JK + 1) = 0.0_JPRB
              PMFLXS(JL, JK + 1) = 0.0_JPRB
              PDPMEL(JL, JK) = 0.0_JPRB
            ELSE IF (PMFLXR(JL, 1 + JK) < 0.0_JPRB) THEN
              PMFLXS(JL, JK + 1) = PMFLXS(JL, JK + 1) + PMFLXR(JL, JK + 1)
              PMFLXR(JL, JK + 1) = 0.0_JPRB
            ELSE IF (PMFLXS(JL, 1 + JK) < 0.0_JPRB) THEN
              PMFLXR(JL, JK + 1) = PMFLXR(JL, JK + 1) + PMFLXS(JL, JK + 1)
              PMFLXS(JL, JK + 1) = 0.0_JPRB
            END IF
          ELSE
            PMFLXR(JL, JK + 1) = 0.0_JPRB
            PMFLXS(JL, JK + 1) = 0.0_JPRB
            PDMFDP(JL, JK) = 0.0_JPRB
            PDPMEL(JL, JK) = 0.0_JPRB
          END IF
        END IF
      END DO
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUFLXN_LOKI
END MODULE CUFLXN_LOKI_MOD
