MODULE CUBASEN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUBASEN_LOKI (PPLDARE, PPLRG, YDTHF, YDCST, YDEPHLI, YDECLDP, YDECUMF, YDSPP_CONFIG, KIDIA, KFDIA, KLON, KLEV,  &
  & KINDEX, LDMIXS, LDTDKMF, PTENH, PQENH, PGEOH, PAPH, PQHFL, PAHFS, PGP2DSPP, PKMFL, PTEN, PQEN, PQSEN, PGEO, PTU, PQU, PLU,  &
  & PWU2H, PWUBASE, KLAB, LDCUM, LDSC, KCBOT, KBOTSC, KCTOP, KDPL, PCAPE, YDSTACK_L)
    
    !          THIS ROUTINE CALCULATES CLOUD BASE FIELDS
    !          CLOUD BASE HEIGHT AND CLOUD TOP HEIGHT
    
    !          PURPOSE.
    !          --------
    !          TO PRODUCE CLOUD BASE AND CLOUD TOP VALUES FOR CU-PARAMETRIZATION
    
    !          INTERFACE
    !          ---------
    !          THIS ROUTINE IS CALLED FROM *CUMASTR*.
    !          INPUT ARE ENVIRONM. VALUES OF T,Q,P,PHI AT HALF LEVELS.
    !          IT RETURNS CLOUD FIELDS VALUES AND FLAGS AS FOLLOWS;
    !                 KLAB=0 FOR STABLE LAYERS
    !                 KLAB=1 FOR SUBCLOUD LEVELS
    !                 KLAB=2 FOR CLOUD LEVELS LEVEL
    
    !          METHOD.
    !          --------
    !          LIFT SURFACE AIR DRY-ADIABATICALLY TO CLOUD TOP
    !          (ENTRAINING PLUME, WITH ENTRAINMENT PROPORTIONAL TO (1/Z))
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KINDEX*       TOP INDEX FOR OUTER VERTICAL LOOP
    
    !    INPUT PARAMETERS (LOGICAL):
    !    *LDMIXS*        WEAK (FALSE) OR STRONG (TRUE) CLOUD MIXING FOR SURFACE PARCEL ONLY
    !    *LDTDKMF*      Arpege tuning (if TRUE)
    
    !    INPUT PARAMETERS (REAL):
    
    ! not used at the moment because we want to use linear intepolation
    ! for fields on the half levels.
    
    !    *PTENH*        ENV. TEMPERATURE (T+1) ON HALF LEVELS           K
    !    *PQENH*        ENV. SPEC. HUMIDITY (T+1) ON HALF LEVELS      KG/KG
    
    !    *PQHFL*        MOISTURE FLUX (EXCEPT FROM SNOW EVAP.)        KG/(SM2)
    !    *PAHFS*        SENSIBLE HEAT FLUX                            W/M2
    !    *PKMFL*        SURFACE KINEMATIC MOMENTUM FLUX              M2/S2
    
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                   M2/S2
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS             PA
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)       K
    !    *PQEN*         PROVISIONAL ENVIRONMENT SPEC. HUMIDITY (T+1)  KG/KG
    !    *PQSEN*        PROVISIONAL ENVIRONMENT SATU. HUMIDITY (T+1)  KG/KG
    !    *PGEO*         GEOPOTENTIAL                                  M2/S2
    !    *PQHFL*        MOISTURE FLUX (EXCEPT FROM SNOW EVAP.)        KG/(SM2)
    !    *PAHFS*        SENSIBLE HEAT FLUX                            W/M2
    !    *PGP2DSPP*     Standard stochastic variable (mean=0, SD=1)
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PTU*          TEMPERATURE IN UPDRAFTS                         K
    !    *PQU*          SPEC. HUMIDITY IN UPDRAFTS                    KG/KG
    !    *PLU*          LIQUID WATER CONTENT IN UPDRAFTS              KG/KG
    !    *PWU2H*        KINETIC ENERGY IN UPDRAFTS  SURFACE PARCEL    M2/S2
    
    !    UPDATED PARAMETERS (INTEGER):
    
    !    *KLAB*         FLAG KLAB=1 FOR SUBCLOUD LEVELS
    !                        KLAB=2 FOR CLOUD LEVELS
    
    !    OUTPUT PARAMETERS (LOGICAL):
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    !    *LDSC*         FLAG: .TRUE. IF BL-CLOUDS EXIST
    
    !    OUTPUT PARAMETERS (INTEGER):
    
    !    *KCBOT*       CLOUD BASE LEVEL !
    !    *KCTOP*       CLOUD TOP LEVEL = HEIGHEST HALF LEVEL
    !                  WITH A NON-ZERO CLOUD UPDRAFT.
    !    *KBOTSC*      CLOUD BASE LEVEL OF BL-CLOUDS
    !    *KDPL*        DEPARTURE LEVEL
    !    *PCAPE*       PSEUDOADIABATIQUE max CAPE (J/KG)
    
    !          EXTERNALS
    !          ---------
    !          *CUADJTQ* FOR ADJUSTING T AND Q DUE TO CONDENSATION IN ASCENT
    
    !     AUTHOR.
    !     -------
    !      A. Pier Siebesma   KNMI ********
    
    !     MODIFICATIONS.
    !     --------------
    !      modified C Jakob (ECMWF) (01/2001)
    !      modified P Bechtold (ECMWF) (08/2002)
    !      02-11-02 : Use fixed last possible departure level and
    !                 last updraft computation level for bit-reproducibility
    !                 D.Salmond &  J. Hague
    !      03-07-03 : Tuning for p690     J. Hague
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      N.Semane+P.Bechtold    04-10-2012 Add RPLRG/RPLDARE factors for small planet
    !      M. Leutbecher & S.-J. Lock (Jan 2016) Introduced SPP scheme (LSPP)
    !      S.-J. Lock (01 Nov 2016) SPP bug fix for ENTRORG perturbations
    !      M. Leutbecher (Oct 2020) SPP abstraction
    !      20210913 : Modifications for Arpege Y.Bouteloup (LDTDKMF)
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !     R. El Khatib 06-Sep-2023 vectorization
    !----------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE YOEPHLI, ONLY: TEPHLI
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    USE YOMCST, ONLY: TCST
    USE PARPHY, ONLY: RKAP
    USE YOECUMF, ONLY: TECUMF
    USE YOECLDP, ONLY: TECLDP
    USE YOETHF, ONLY: TTHF
    USE SPP_MOD, ONLY: TSPP_CONFIG
    USE SPP_GEN_MOD, ONLY: SPP_PERT
    
    IMPLICIT NONE
    
    REAL(KIND=JPRB), INTENT(IN) :: PPLDARE
    REAL(KIND=JPRB), INTENT(IN) :: PPLRG
    TYPE(TECLDP), INTENT(IN) :: YDECLDP
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    TYPE(TSPP_CONFIG), INTENT(IN) :: YDSPP_CONFIG
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KINDEX
    LOGICAL, INTENT(IN) :: LDMIXS
    LOGICAL, INTENT(IN) :: LDTDKMF
    REAL(KIND=JPRB), INTENT(IN) :: PTENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PQHFL(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAHFS(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PGP2DSPP(KLON, YDSPP_CONFIG%SM%NRFTOTAL)
    REAL(KIND=JPRB), INTENT(IN) :: PKMFL(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PLU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PWU2H(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PWUBASE(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KLAB(KLON, KLEV)
    LOGICAL, INTENT(INOUT) :: LDCUM(KLON)
    LOGICAL, INTENT(OUT) :: LDSC(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KBOTSC(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KCTOP(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KDPL(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PCAPE(KLON)
    INTEGER(KIND=JPIM) :: ICTOP, ICBOT, IBOTSC, ILAB(KLON, KLEV), IDPL
    
    LOGICAL :: LL_LDBASE, LLGO_ON, LLDEEP, LLDCUM, LLDSC, LLFIRST
    LOGICAL :: LLRESET, LLRESETJL
    LOGICAL :: LLPERT_ENTRORG, LLPERT_ENTSTPC1    ! SPP perturbation on?
    
    
    
    INTEGER(KIND=JPIM) :: IK, IS, JK, JL, JKK, JKT1, JKT2, JKT, JKB
    INTEGER(KIND=JPIM) :: IPENTRORG, IPENTSTPC1
    
    REAL(KIND=JPRB) :: ZS(KLON, KLEV), ZSENH(KLON, KLEV + 1), ZQENH(KLON, KLEV + 1), ZSUH(KLON, KLEV), ZBUOH(KLON, KLEV),  &
    & ZWU2H(KLON, KLEV)
    REAL(KIND=JPRB) :: ZQOLD, ZPH
    REAL(KIND=JPRB) :: ZMIX
    REAL(KIND=JPRB) :: ZDZ, ZCBASE
    
    REAL(KIND=JPRB) :: ZLU(KLON, KLEV), ZQU(KLON, KLEV), ZTU(KLON, KLEV)
    
    REAL(KIND=JPRB) :: ZCAPE(KLON, KLEV)    ! local for CAPE at every departure level
    
    REAL(KIND=JPRB) :: ZBUOF    ! BUOYANCY
    REAL(KIND=JPRB) :: ZRHO    ! DENSITY AT SURFACE (KG/M^3)
    REAL(KIND=JPRB) :: ZKHVFL    ! SURFACE BUOYANCY FLUX (K M/S)
    REAL(KIND=JPRB) :: ZWS    ! SIGMA_W AT LOWEST MODEL HALFLEVEL (M/S)
    REAL(KIND=JPRB) :: ZUST    ! U*
    REAL(KIND=JPRB) :: ZQEX, ZQEXC    ! HUMIDITY EXCESS AT LOWEST MODEL HALFLEVEL (KG/KG)
    REAL(KIND=JPRB) :: ZTEX, ZTEXC    ! TEMPERATURE EXCESS AT LOWEST MODEL HALFLEVEL (K)
    REAL(KIND=JPRB) :: ZEPS    ! FRACTIONAL ENTRAINMENT RATE   [M^-1]
    REAL(KIND=JPRB) :: ZTVENH    ! ENVIRONMENT VIRTUAL TEMPERATURE AT HALF LEVELS (K)
    REAL(KIND=JPRB) :: ZTVUH    ! UPDRAFT VIRTUAL TEMPERATURE AT HALF LEVELS     (K)
    REAL(KIND=JPRB) :: ZLGLAC    ! UPDRAFT LIQUID WATER FROZEN IN ONE LAYER
    REAL(KIND=JPRB) :: ZQSU, ZCOR, ZDQ, ZALFAW, ZFACW, ZFACI, ZFAC, ZESDP, ZDQSDT, ZDTDP, ZDP, ZPDIFFTOP, ZPDIFFBOT, ZSF, ZQF,  &
    & ZAW, ZBW
    REAL(KIND=JPRB) :: ZWORK1, ZWORK2    ! work arrays for T and w perturbations
    REAL(KIND=JPRB) :: ZRCPD, ZRG, ZTMP
    
    REAL(KIND=JPRB) :: ZXENTRORG, ZXENTSTPC1
    INTEGER(KIND=JPIM) :: IPN    ! SPP perturbation pointer
    TYPE(SPP_PERT) :: PN1, PN2
    
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    
#include "fcttre.func.h"
    REAL(KIND=JPRB) :: Z1S, Z2S, CUADJTQ_ZCOND, ZCOND1, CUADJTQ_ZCOR, ZFOEEWI, ZFOEEWL, CUADJTQ_ZOEALFA, ZQMAX, ZQSAT,  &
    & CUADJTQ_ZTARG, ZQP
    REAL(KIND=JPRB) :: ZL, ZI, ZF
    LOGICAL :: CUADJTQ_LLFLAG
    REAL(KIND=JPHOOK) :: CUADJTQ_ZHOOK_HANDLE
#include "abor1.intfb.h"
#include "cuadjtq.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    POINTER(IP_ILAB, ILAB)
    POINTER(IP_ZS, ZS)
    POINTER(IP_ZSENH, ZSENH)
    POINTER(IP_ZQENH, ZQENH)
    POINTER(IP_ZSUH, ZSUH)
    POINTER(IP_ZBUOH, ZBUOH)
    POINTER(IP_ZWU2H, ZWU2H)
    POINTER(IP_ZLU, ZLU)
    POINTER(IP_ZQU, ZQU)
    POINTER(IP_ZTU, ZTU)
    POINTER(IP_ZCAPE, ZCAPE)
    YLSTACK_L = YDSTACK_L
    IP_ILAB = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(INT(1, kind=JPIM)) + 7, -3), 3)
    IP_ZS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZSENH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*(KLEV + 1)*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQENH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*(KLEV + 1)*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZSUH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZBUOH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZWU2H = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZLU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZTU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZCAPE = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
!$acc data present( PTENH, PQENH, PGEOH, PAPH, PQHFL, PAHFS, PGP2DSPP, PKMFL, PTEN, PQEN, PQSEN, PGEO, PTU, PQU, PLU, PWU2H,  &
!$acc & PWUBASE, KLAB, LDCUM, LDSC, KCBOT, KBOTSC, KCTOP, KDPL, PCAPE, YDTHF, YDCST, YDEPHLI, YDECLDP, YDECUMF, YDSPP_CONFIG )
    
    !----------------------------------------------------------------------
    !     0.           INITIALIZE CONSTANTS AND FIELDS
    !                  -------------------------------
    !----------------------------------------------------------------------
    
    ZAW = 1.0_JPRB
    ZBW = 1.0_JPRB
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      PWUBASE(JL) = 0.0_JPRB
      LLGO_ON = .true.
      LLFIRST = .true.
      KDPL(JL) = KLEV
      
      JKT1 = KINDEX
      JKT2 = YDECUMF%NJKT2
      ZRG = 1.0_JPRB / YDCST%RG
      ZRCPD = 1.0_JPRB / YDCST%RCPD
      
!$acc loop seq
      DO JK=1,KLEV
        ZTU(JL, JK) = PTU(JL, JK)
        ZQU(JL, JK) = PQU(JL, JK)
        ZLU(JL, JK) = PLU(JL, JK)
        ILAB(JL, JK) = KLAB(JL, JK)
        ZCAPE(JL, JK) = 0.0_JPRB
      END DO
      
      ! prepare SPP perturbations
      IF (YDSPP_CONFIG%LSPP) THEN
        IPN = YDSPP_CONFIG%PPTR%ENTRORG
        LLPERT_ENTRORG = IPN > 0
        IF (LLPERT_ENTRORG) THEN
          PN1 = YDSPP_CONFIG%SM%PN(IPN)
          IPENTRORG = PN1%MP
        END IF
        
        IPN = YDSPP_CONFIG%PPTR%ENTSTPC1
        LLPERT_ENTSTPC1 = IPN > 0
        IF (LLPERT_ENTSTPC1) THEN
          PN2 = YDSPP_CONFIG%SM%PN(IPN)
          IPENTSTPC1 = PN2%MP
        END IF
        
      ELSE
        LLPERT_ENTSTPC1 = .false.
        LLPERT_ENTRORG = .false.
      END IF
      
      !----------------------------------------------------------------------
      !       -----------------------------------------------------------
      !       1.1  PREPARE FIELDS ON HALF LEVELS BY LINEAR INTERPOLATION
      !             OF SPECIFIC HUMIDITY AND STATIC ENERGY
      !       -----------------------------------------------------------
      
!$acc loop seq
      DO JK=1,KLEV
        PWU2H(JL, JK) = 0.0_JPRB
        ZWU2H(JL, JK) = 0.0_JPRB
        ZS(JL, JK) = YDCST%RCPD*PTEN(JL, JK) + PGEO(JL, JK)
        ZQENH(JL, JK) = PQENH(JL, JK)
        ZSENH(JL, JK) = YDCST%RCPD*PTENH(JL, JK) + PGEOH(JL, JK)
      END DO
      
!$acc loop seq
      DO JKK=KLEV,JKT1,-1
        ! Big external loop for level testing:
        ! find first departure level that produces deepest cloud top
        ! or take surface level for shallow convection and Sc
        !
        !        ---------------------------------------------------------
        !        1.2    INITIALISE FIELDS AT DEPARTURE HALF MODEL LEVEL
        !        ---------------------------------------------------------
        !
        IS = 0
        IF (LLGO_ON) THEN
          IS = IS + 1
          IDPL = JKK            ! departure level
          ICBOT = JKK            ! cloud base level for convection, (-1 if not found)
          IBOTSC = KLEV - 1            ! sc    base level for sc-clouds , (-1 if not found)
          ICTOP = KLEV - 1            ! cloud top for convection (-1 if not found)
          LLDCUM = .false.            ! on exit: true if cloudbase=found
          LLDSC = .false.            ! on exit: true if cloudbase=found
          LL_LDBASE = .false.            ! on exit: true if cloudbase=found
        END IF
        
        IF (IS /= 0) THEN
          
          IF (JKK == KLEV) THEN
            
            ZTEXC = 0.2_JPRB
            ZQEXC = 1.E-4_JPRB
            IF (LLGO_ON) THEN
              ZRHO = PAPH(JL, JKK + 1) / (YDCST%RD*(PTEN(JL, JKK)*(1.0_JPRB + YDCST%RETV*PQEN(JL, JKK))))
              ZKHVFL = (PAHFS(JL, JKK + 1)*ZRCPD + YDCST%RETV*PTEN(JL, JKK)*PQHFL(JL, JKK + 1)) / (ZRHO*PPLRG*PPLDARE)
              ZUST = MAX(SQRT(PKMFL(JL)), 0.1_JPRB)
              ZWS = ZUST**3._JPRB - 1.5_JPRB*RKAP*ZKHVFL*(PGEOH(JL, KLEV) - PGEOH(JL, KLEV + 1)) / PTEN(JL, KLEV)
              ZTEX = 0.0_JPRB
              ZQEX = 0.0_JPRB
              IF (ZKHVFL < 0.0_JPRB) THEN
                ZWS = 1.2_JPRB*ZWS**.3333_JPRB
                ILAB(JL, JKK) = 1
                ZTEX = MAX(-1.5_JPRB*PAHFS(JL, JKK + 1) / (ZRHO*ZWS*YDCST%RCPD*PPLRG*PPLDARE), ZTEXC)
                ZQEX = MAX(-1.5_JPRB*PQHFL(JL, JKK + 1) / (ZRHO*ZWS*PPLRG*PPLDARE), ZQEXC)
                ZQU(JL, JKK) = ZQENH(JL, JKK) + ZQEX
                ZSUH(JL, JKK) = ZSENH(JL, JKK) + YDCST%RCPD*ZTEX
                ZTU(JL, JKK) = (ZSENH(JL, JKK) - PGEOH(JL, JKK))*ZRCPD + ZTEX
                ZLU(JL, JKK) = 0.0_JPRB
                ZWU2H(JL, JKK) = ZWS**2 + 0.1_JPRB
                PWU2H(JL, JKK) = ZWU2H(JL, JKK)
                !
                !  determine buoyancy at lowest half level
                !
                ZTVENH = (1.0_JPRB + YDCST%RETV*ZQENH(JL, JKK))*(ZSENH(JL, JKK) - PGEOH(JL, JKK))*ZRCPD
                ZTVUH = (1.0_JPRB + YDCST%RETV*ZQU(JL, JKK))*ZTU(JL, JKK)
                ZBUOH(JL, JKK) = (ZTVUH - ZTVENH)*YDCST%RG / ZTVENH
              ELSE
                LLGO_ON = .false.                  ! non-convective point
              END IF
            END IF
            
          ELSE
            
            IF (LLGO_ON) THEN
              ZRHO = PAPH(JL, JKK + 1) / (YDCST%RD*(PTEN(JL, JKK)*(1. + YDCST%RETV*PQEN(JL, JKK))))
              ILAB(JL, JKK) = 1
              ZTEXC = 0.2_JPRB
              ZQEXC = 1.E-4_JPRB
              IF (JKK == -1 + KLEV) THEN
                ZTEXC = MAX(ZTEXC, ZTEX)
                ZQEXC = MAX(ZQEXC, ZQEX)
                IF (LDTDKMF) THEN
                  ZTEXC = MIN(ZTEXC, 3.0_JPRB)
                  ZQEXC = MIN(ZQEXC, 2.E-3_JPRB)
                ELSE
                  ZTEXC = MIN(ZTEXC, 1.0_JPRB)
                  ZQEXC = MIN(ZQEXC, 5.E-4_JPRB)
                END IF
              END IF
              ZQU(JL, JKK) = ZQENH(JL, JKK) + ZQEXC
              ZSUH(JL, JKK) = ZSENH(JL, JKK) + YDCST%RCPD*ZTEXC
              ZTU(JL, JKK) = (ZSENH(JL, JKK) - PGEOH(JL, JKK))*ZRCPD + ZTEXC
              ZLU(JL, JKK) = 0.0_JPRB
              ! construct mixed layer for parcels emanating in lowest 60 hPa
              IF (PAPH(JL, 1 + KLEV) - PAPH(JL, -1 + JKK) < 60.E2_JPRB) THEN
                ZQU(JL, JKK) = 0.0_JPRB
                ZSUH(JL, JKK) = 0.0_JPRB
                ZWORK1 = 0.0_JPRB
!$acc loop seq
                DO JK=JKK + 1,JKK - 1,-1
                  IF (ZWORK1 < 50.E2_JPRB) THEN
                    ZWORK2 = PAPH(JL, JK) - PAPH(JL, JK - 1)
                    ZWORK1 = ZWORK1 + ZWORK2
                    ZQU(JL, JKK) = ZQU(JL, JKK) + ZQENH(JL, JK)*ZWORK2
                    ZSUH(JL, JKK) = ZSUH(JL, JKK) + ZSENH(JL, JK)*ZWORK2
                  END IF
                END DO
                ZQU(JL, JKK) = ZQU(JL, JKK) / ZWORK1 + ZQEXC
                ZSUH(JL, JKK) = ZSUH(JL, JKK) / ZWORK1 + YDCST%RCPD*ZTEXC
                ZTU(JL, JKK) = (ZSUH(JL, JKK) - PGEOH(JL, JKK))*ZRCPD + ZTEXC
              END IF
              ZWU2H(JL, JKK) = 1.0_JPRB
              ! PWU2H(JL,JKK) = ZWU2H(JL,JKK)
              
              !
              !  determine buoyancy at lowest half level
              !
              ZTVENH = (1.0_JPRB + YDCST%RETV*ZQENH(JL, JKK))*(ZSENH(JL, JKK) - PGEOH(JL, JKK))*ZRCPD
              ZTVUH = (1.0_JPRB + YDCST%RETV*ZQU(JL, JKK))*ZTU(JL, JKK)
              ZBUOH(JL, JKK) = (ZTVUH - ZTVENH)*YDCST%RG / ZTVENH
            END IF
            
          END IF
          
        END IF
        
        !----------------------------------------------------------------------
        !     2.0          DO ASCENT IN SUBCLOUD AND LAYER,
        !                  CHECK FOR EXISTENCE OF CONDENSATION LEVEL,
        !                  ADJUST T,Q AND L ACCORDINGLY IN *CUADJTQ*,
        !                  CHECK FOR BUOYANCY AND SET FLAGS
        !                  -------------------------------------
        !       ------------------------------------------------------------
        !        1.2  DO THE VERTICAL ASCENT UNTIL VELOCITY BECOMES NEGATIVE
        !       ------------------------------------------------------------
!$acc loop seq
        DO JK=JKK - 1,JKT2,-1
          IS = 0
          
          IF (JKK == KLEV .or. KINDEX == -1 + KLEV) THEN
            ! 1/z mixing for shallow
            
            
            IF (YDSPP_CONFIG%LSPP .and. LLPERT_ENTSTPC1) THEN
              ZXENTSTPC1 = YDECUMF%ENTSTPC1*EXP(PN2%MU(1) + PN2%XMAG(1)*PGP2DSPP(JL, IPENTSTPC1))
            ELSE
              ZXENTSTPC1 = YDECUMF%ENTSTPC1
            END IF
            
            IF (LLGO_ON) THEN
              IS = IS + 1
              ZDZ = (PGEOH(JL, JK) - PGEOH(JL, JK + 1))*ZRG
              IF (LDTDKMF) THEN
                ZEPS = ZXENTSTPC1 / ((PGEOH(JL, JK) - PGEOH(JL, KLEV + 1))*ZRG*PPLRG) + YDECUMF%ENTSTPC2
              ELSE
                ZEPS = ZXENTSTPC1 / ((PGEO(JL, JK) - PGEOH(JL, KLEV + 1))*ZRG*PPLRG) + YDECUMF%ENTSTPC2
                IF (LDMIXS .and. KINDEX == KLEV .and. ZLU(JL, 1 + JK) > 0.0_JPRB) ZEPS = ZEPS*YDECUMF%ENTSTPC3
              END IF
              ZMIX = 0.5_JPRB*ZDZ*PPLRG*ZEPS
              IF (.not.LDTDKMF) ZMIX = MIN(1.0_JPRB, ZMIX)
              ZQF = (PQENH(JL, JK + 1) + PQENH(JL, JK))*0.5_JPRB
              ZSF = (ZSENH(JL, JK + 1) + ZSENH(JL, JK))*0.5_JPRB
              ZTMP = 1.0_JPRB / (1.0_JPRB + ZMIX)
              ZQU(JL, JK) = (ZQU(JL, JK + 1)*(1.0_JPRB - ZMIX) + 2.0_JPRB*ZMIX*ZQF)*ZTMP
              ZSUH(JL, JK) = (ZSUH(JL, JK + 1)*(1.0_JPRB - ZMIX) + 2.0_JPRB*ZMIX*ZSF)*ZTMP
              ZQOLD = ZQU(JL, JK)
              ZTU(JL, JK) = (ZSUH(JL, JK) - PGEOH(JL, JK))*ZRCPD
              ZPH = PAPH(JL, JK)
            END IF
            
          ELSE
            
            ZXENTRORG = YDECUMF%ENTRORG
            IF (LLGO_ON) THEN
              !SPP: perturb ENTRORG parameter
              IF (YDSPP_CONFIG%LSPP .and. LLPERT_ENTRORG) THEN
                ZXENTRORG = YDECUMF%ENTRORG*EXP(PN1%MU(1) + PN1%XMAG(1)*PGP2DSPP(JL, IPENTRORG))
              END IF
              ZDZ = (PGEOH(JL, JK) - PGEOH(JL, JK + 1))*ZRG
              ZMIX = YDECUMF%ENTRTEST*ZXENTRORG*ZDZ*MIN(1.0_JPRB, (PQSEN(JL, JK) / PQSEN(JL, KLEV))**3)
            END IF
            
            IF (LLGO_ON) THEN
              IS = IS + 1
              ZMIX = MIN(1.0_JPRB, ZMIX)
              ZQF = (PQENH(JL, JK + 1) + PQENH(JL, JK))*0.5_JPRB
              ZSF = (ZSENH(JL, JK + 1) + ZSENH(JL, JK))*0.5_JPRB
              ZQU(JL, JK) = ZQU(JL, JK + 1)*(1.0_JPRB - ZMIX) + ZQF*ZMIX
              ZSUH(JL, JK) = ZSUH(JL, JK + 1)*(1.0_JPRB - ZMIX) + ZSF*ZMIX
              ZQOLD = ZQU(JL, JK)
              ZTU(JL, JK) = (ZSUH(JL, JK) - PGEOH(JL, JK))*ZRCPD
              ZPH = PAPH(JL, JK)
            END IF
            
          END IF
          
          IF (IS == 0) EXIT
          
          IK = JK
          
          ! [Loki] inlined child subroutine: CUADJTQ
          ! =========================================
          
          !----------------------------------------------------------------------
          
          !     1.           DEFINE CONSTANTS
          !                  ----------------
          
          
          !IF (LHOOK) CALL DR_HOOK('CUADJTQ',0,ZHOOK_HANDLE)
          
          
          ZQMAX = 0.5_JPRB
          
          !*********************************************
          IF (.not.YDEPHLI%LPHYLIN) THEN
            !*********************************************
            
            !     2.           CALCULATE CONDENSATION AND ADJUST T AND Q ACCORDINGLY
            !                  -----------------------------------------------------
            
            
            !   mixed phase saturation
            
            CUADJTQ_LLFLAG = LLGO_ON
            
            IF (CUADJTQ_LLFLAG) THEN
              ZQP = 1.0_JPRB / ZPH
              ZL = 1.0_JPRB / (ZTU(JL, IK) - YDTHF%R4LES)
              ZI = 1.0_JPRB / (ZTU(JL, IK) - YDTHF%R4IES)
              !       ZQSAT=FOEEWMCU(PT(JL,KK))*ZQP
              ZQSAT = YDTHF%R2ES*(FOEALFCU(ZTU(JL, IK))*EXP(YDTHF%R3LES*(ZTU(JL, IK) - YDCST%RTT)*ZL) + (1.0_JPRB -  &
              & FOEALFCU(ZTU(JL, IK)))*EXP(YDTHF%R3IES*(ZTU(JL, IK) - YDCST%RTT)*ZI))
              ZQSAT = ZQSAT*ZQP
              ZQSAT = MIN(0.5_JPRB, ZQSAT)
              CUADJTQ_ZCOR = 1.0_JPRB - YDCST%RETV*ZQSAT
              ZF = FOEALFCU(ZTU(JL, IK))*YDTHF%R5ALVCP*ZL**2 + (1.0_JPRB - FOEALFCU(ZTU(JL, IK)))*YDTHF%R5ALSCP*ZI**2
              CUADJTQ_ZCOND = (ZQU(JL, IK)*CUADJTQ_ZCOR**2 - ZQSAT*CUADJTQ_ZCOR) / (CUADJTQ_ZCOR**2 + ZQSAT*ZF)
              CUADJTQ_ZCOND = MAX(CUADJTQ_ZCOND, 0.0_JPRB)
              ZTU(JL, IK) = ZTU(JL, IK) + FOELDCPMCU(ZTU(JL, IK))*CUADJTQ_ZCOND
              ZQU(JL, IK) = ZQU(JL, IK) - CUADJTQ_ZCOND
              ZL = 1.0_JPRB / (ZTU(JL, IK) - YDTHF%R4LES)
              ZI = 1.0_JPRB / (ZTU(JL, IK) - YDTHF%R4IES)
              !       ZQSAT=FOEEWMCU(PT(JL,KK))*ZQP
              ZQSAT = YDTHF%R2ES*(FOEALFCU(ZTU(JL, IK))*EXP(YDTHF%R3LES*(ZTU(JL, IK) - YDCST%RTT)*ZL) + (1.0_JPRB -  &
              & FOEALFCU(ZTU(JL, IK)))*EXP(YDTHF%R3IES*(ZTU(JL, IK) - YDCST%RTT)*ZI))
              ZQSAT = ZQSAT*ZQP
              ZQSAT = FMINJ(0.5_JPRB, ZQSAT)
              CUADJTQ_ZCOR = 1.0_JPRB - YDCST%RETV*ZQSAT
              ZF = FOEALFCU(ZTU(JL, IK))*YDTHF%R5ALVCP*ZL**2 + (1.0_JPRB - FOEALFCU(ZTU(JL, IK)))*YDTHF%R5ALSCP*ZI**2
              ZCOND1 = (ZQU(JL, IK)*CUADJTQ_ZCOR**2 - ZQSAT*CUADJTQ_ZCOR) / (CUADJTQ_ZCOR**2 + ZQSAT*ZF)
              IF (CUADJTQ_ZCOND == 0.0_JPRB) ZCOND1 = 0.0_JPRB
              ZTU(JL, IK) = ZTU(JL, IK) + FOELDCPMCU(ZTU(JL, IK))*ZCOND1
              ZQU(JL, IK) = ZQU(JL, IK) - ZCOND1
            END IF
            
            
            
            
            
            
            
            !*********************************************
          ELSE
            !*********************************************
            
            !     2.           CALCULATE CONDENSATION AND ADJUST T AND Q ACCORDINGLY
            !                  -----------------------------------------------------
            
            
            !DIR$    IVDEP
            !OCL NOVREC
            !DIR$ LOOP_INFO EST_TRIPS(16)
            IF (LLGO_ON) THEN
              ZQP = 1.0_JPRB / ZPH
              CUADJTQ_ZTARG = ZTU(JL, IK)
              CUADJTQ_ZOEALFA = 0.5_JPRB*(TANH(YDEPHLI%RLPAL1*(CUADJTQ_ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB)
              ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4LES))
              ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4IES))
              ZQSAT = ZQP*(CUADJTQ_ZOEALFA*ZFOEEWL + (1.0_JPRB - CUADJTQ_ZOEALFA)*ZFOEEWI)
              Z1S = TANH(YDEPHLI%RLPAL2*(ZQSAT - ZQMAX))
              ZQSAT = 0.5_JPRB*((1.0_JPRB - Z1S)*ZQSAT + (1.0_JPRB + Z1S)*ZQMAX)
              
              CUADJTQ_ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
              ZQSAT = ZQSAT*CUADJTQ_ZCOR
              
              Z2S = CUADJTQ_ZOEALFA*YDTHF%R5ALVCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4LES)**2) + (1.0_JPRB - CUADJTQ_ZOEALFA) &
              & *YDTHF%R5ALSCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4IES)**2)
              CUADJTQ_ZCOND = (ZQU(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*CUADJTQ_ZCOR*Z2S)
              
              CUADJTQ_ZCOND = MAX(CUADJTQ_ZCOND, 0.0_JPRB)
              
              IF (CUADJTQ_ZCOND /= 0.0_JPRB) THEN
                
                ZTU(JL, IK) =  &
                & ZTU(JL, IK) + (CUADJTQ_ZOEALFA*YDTHF%RALVDCP + (1.0_JPRB - CUADJTQ_ZOEALFA)*YDTHF%RALSDCP)*CUADJTQ_ZCOND
                ZQU(JL, IK) = ZQU(JL, IK) - CUADJTQ_ZCOND
                CUADJTQ_ZTARG = ZTU(JL, IK)
                CUADJTQ_ZOEALFA = 0.5_JPRB*(TANH(YDEPHLI%RLPAL1*(CUADJTQ_ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB)
                ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4LES))
                ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4IES))
                ZQSAT = ZQP*(CUADJTQ_ZOEALFA*ZFOEEWL + (1.0_JPRB - CUADJTQ_ZOEALFA)*ZFOEEWI)
                Z1S = TANH(YDEPHLI%RLPAL2*(ZQSAT - ZQMAX))
                ZQSAT = 0.5_JPRB*((1.0_JPRB - Z1S)*ZQSAT + (1.0_JPRB + Z1S)*ZQMAX)
                
                CUADJTQ_ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
                ZQSAT = ZQSAT*CUADJTQ_ZCOR
                
                Z2S = CUADJTQ_ZOEALFA*YDTHF%R5ALVCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4LES)**2) + (1.0_JPRB - CUADJTQ_ZOEALFA) &
                & *YDTHF%R5ALSCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4IES)**2)
                ZCOND1 = (ZQU(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*CUADJTQ_ZCOR*Z2S)
                
                ZTU(JL, IK) = ZTU(JL, IK) + (CUADJTQ_ZOEALFA*YDTHF%RALVDCP + (1.0_JPRB - CUADJTQ_ZOEALFA)*YDTHF%RALSDCP)*ZCOND1
                
                ZQU(JL, IK) = ZQU(JL, IK) - ZCOND1
              END IF
            END IF
            
            
            
            
            
            !*********************************************
          END IF
          !*********************************************
          
          
          !IF (LHOOK) CALL DR_HOOK('CUADJTQ',1,ZHOOK_HANDLE)
          
          ! =========================================
          
          !DIR$ IVDEP
          !OCL NOVREC
          
          IF (LLGO_ON) THEN
            
            ! add condensation to water
            
            ZDQ = MAX(ZQOLD - ZQU(JL, JK), 0.0_JPRB)
            ZLU(JL, JK) = ZLU(JL, JK + 1) + ZDQ
            
            ! freezing
            
            ZLGLAC = ZDQ*((1.0_JPRB - FOEALFCU(ZTU(JL, JK))) - (1.0_JPRB - FOEALFCU(ZTU(JL, JK + 1))))
            
            
            ! pseudo-microphysics
            
            ZLU(JL, JK) = 0.5_JPRB*ZLU(JL, JK)
            
            ! update dry static energy after condensation + freezing
            
            ZTU(JL, JK) = ZTU(JL, JK) + YDTHF%RALFDCP*ZLGLAC
            ZSUH(JL, JK) = YDCST%RCPD*ZTU(JL, JK) + PGEOH(JL, JK)
            
            ! Buoyancy on half and full levels
            
            ZTVUH = (1.0_JPRB + YDCST%RETV*ZQU(JL, JK) - ZLU(JL, JK))*ZTU(JL, JK) + YDTHF%RALFDCP*ZLGLAC
            ZTVENH = (1.0_JPRB + YDCST%RETV*ZQENH(JL, JK))*(ZSENH(JL, JK) - PGEOH(JL, JK))*ZRCPD
            ZBUOH(JL, JK) = (ZTVUH - ZTVENH)*YDCST%RG / ZTVENH
            
            ZBUOF = (ZBUOH(JL, JK) + ZBUOH(JL, JK + 1))*0.5_JPRB
            
            ! solve kinetic energy equation
            
            ZTMP = 1.0_JPRB / (1.0_JPRB + 2.0_JPRB*ZBW*ZMIX)
            ZWU2H(JL, JK) = (ZWU2H(JL, JK + 1)*(1.0_JPRB - 2.0_JPRB*ZBW*ZMIX) + 2.0_JPRB*ZAW*ZBUOF*ZDZ)*ZTMP
            
            IF (JKK == KLEV) THEN
              PWU2H(JL, JK) = ZWU2H(JL, JK)                !save surface parcel KE
            END IF
            
            ! compute CAPE for diagnostics
            
            ZCAPE(JL, JKK) = ZCAPE(JL, JKK) + MAX(0.0_JPRB, ZBUOF*ZDZ)
            
            ! first layer with liquid water - find exact cloud base
            
            IF (ZLU(JL, JK) > 0.0_JPRB .and. ILAB(JL, 1 + JK) == 1) THEN
              
              IK = JK + 1
              ZQSU = FOEEWM(ZTU(JL, IK)) / PAPH(JL, IK)
              ZESDP = ZQSU
              ZQSU = MIN(0.5_JPRB, ZQSU)
              ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSU)
              ZQSU = ZQSU*ZCOR
              ZDQ = MIN(0._JPRB, ZQU(JL, IK) - ZQSU)
              ZALFAW = FOEALFA(ZTU(JL, IK))
              ZFACW = YDTHF%R5LES / ((ZTU(JL, IK) - YDTHF%R4LES)**2)
              ZFACI = YDTHF%R5IES / ((ZTU(JL, IK) - YDTHF%R4IES)**2)
              ZFAC = ZALFAW*ZFACW + (1. - ZALFAW)*ZFACI
              ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZESDP)
              ZDQSDT = ZFAC*ZCOR*ZQSU
              ZDTDP = YDCST%RD*ZTU(JL, IK) / (YDCST%RCPD*PAPH(JL, IK))
              ZDP = ZDQ / (ZDQSDT*ZDTDP)
              ZCBASE = PAPH(JL, IK) + ZDP
              
              ! chose nearest half level as cloud base
              
              ZPDIFFTOP = ZCBASE - PAPH(JL, JK)
              ZPDIFFBOT = PAPH(JL, JK + 1) - ZCBASE
              
              IF (ZPDIFFTOP > ZPDIFFBOT .and. ZWU2H(JL, 1 + JK) > 0.0_JPRB) THEN
                JKB = MIN(KLEV - 1, JK + 1)
                ILAB(JL, JKB) = 2
                ILAB(JL, JK) = 2
                LL_LDBASE = .true.
                LLDSC = .true.
                IBOTSC = JKB
                ICBOT = JKB
                ZLU(JL, JK + 1) = YDECLDP%RLMIN
              ELSE IF (ZPDIFFTOP <= ZPDIFFBOT .and. ZWU2H(JL, JK) > 0.0_JPRB) THEN
                ILAB(JL, JK) = 2
                LL_LDBASE = .true.
                LLDSC = .true.
                IBOTSC = JK
                ICBOT = JK
              END IF
              
            END IF
            
            ! decide on presence of convection, cloud base and cloud top based on
            ! kinetic energy
            
            IF (ZWU2H(JL, JK) < 0.0_JPRB) THEN
              LLGO_ON = .false.
              IF (ZLU(JL, 1 + JK) > 0.0_JPRB) THEN
                ICTOP = JK
                LLDCUM = .true.
              ELSE
                LLDCUM = .false.
              END IF
            ELSE
              IF (ZLU(JL, JK) > 0.0_JPRB) THEN
                ILAB(JL, JK) = 2
              ELSE
                ILAB(JL, JK) = 1
              END IF
            END IF
          END IF
          
          !     IF (IS == 0) EXIT
        END DO
        
        IF (JKK == KLEV .or. JKK == -1 + KLEV .and. KINDEX == -1 + KLEV) THEN
          
          ! set values for departure level for PBL clouds = first model level
          LDSC(JL) = LLDSC
          IF (LDSC(JL)) THEN
            KBOTSC(JL) = IBOTSC
          ELSE
            KBOTSC(JL) = -1
          END IF
          
          JKT = ICTOP
          JKB = ICBOT
          LLDEEP = PAPH(JL, JKB) - PAPH(JL, JKT) > YDECUMF%RDEPTHS
          IF (LLDEEP .and. KINDEX < -1 + KLEV) LLDCUM = .false.
          ! no deep allowed for KLEV
          LLDEEP = .false.            ! for deep convection start only at level KLEV-1
          ! and form mixed layer, so go on
          ! test further for deep convective columns as not yet found
          ! IF ( LLDEEP(JL) ) LLFIRST(JL)=.FALSE.
          LLGO_ON = .not.LLDEEP
          IF (KINDEX == -1 + KLEV) LLGO_ON = .not.LLDCUM
          IF (LLDCUM) THEN
            KCBOT(JL) = ICBOT
            KCTOP(JL) = ICTOP
            KDPL(JL) = IDPL
            LDCUM(JL) = LLDCUM
            PWUBASE(JL) = SQRT(MAX(ZWU2H(JL, JKB), 0.0_JPRB))
          ELSE
            KCTOP(JL) = -1
            KCBOT(JL) = -1
            KDPL(JL) = KLEV - 1
            LDCUM(JL) = .false.
            PWUBASE(JL) = 0.0_JPRB
          END IF
!$acc loop seq
          DO JK=KLEV,1,-1
            JKT = ICTOP
            IF (JK >= JKT .or. KINDEX >= -1 + KLEV .and. JKK == KLEV) THEN
              KLAB(JL, JK) = ILAB(JL, JK)
              PTU(JL, JK) = ZTU(JL, JK)
              PQU(JL, JK) = ZQU(JL, JK)
              PLU(JL, JK) = ZLU(JL, JK)
            END IF
          END DO
        END IF
        
        IF (JKK < KLEV) THEN
          LLRESET = .false.
          IF (.not.LLDEEP) THEN
            JKT = ICTOP
            JKB = ICBOT
            ! test on cloud thickness and buoyancy
            LLDEEP = PAPH(JL, JKB) - PAPH(JL, JKT) >= YDECUMF%RDEPTHS
          END IF
          LLRESETJL = LLDEEP .and. LLFIRST
          LLRESET = LLRESET .or. LLRESETJL
          
          
          IF (LLRESET) THEN
!$acc loop seq
            DO JK=KLEV,1,-1
              IF (LLRESETJL) THEN
                JKT = ICTOP
                JKB = IDPL
                IF (JK <= JKB .and. JK >= JKT) THEN
                  KLAB(JL, JK) = ILAB(JL, JK)
                  PTU(JL, JK) = ZTU(JL, JK)
                  PQU(JL, JK) = ZQU(JL, JK)
                  PLU(JL, JK) = ZLU(JL, JK)
                ELSE
                  KLAB(JL, JK) = 1
                  PTU(JL, JK) = PTENH(JL, JK)
                  PQU(JL, JK) = PQENH(JL, JK)
                  PLU(JL, JK) = 0.0_JPRB
                END IF
                IF (JK < JKT) KLAB(JL, JK) = 0
              END IF
            END DO
          END IF
          
          IF (LLDEEP .and. LLFIRST) THEN
            KDPL(JL) = IDPL
            KCTOP(JL) = ICTOP
            KCBOT(JL) = ICBOT
            LDCUM(JL) = LLDCUM
            LDSC(JL) = .false.
            KBOTSC(JL) = -1
            JKB = KCBOT(JL)
            PWUBASE(JL) = SQRT(MAX(ZWU2H(JL, JKB), 0.0_JPRB))
            !  no initialization of wind for deep here, this is done in
            !  CUINI and CUASCN
            LLFIRST = .false.
          END IF
          LLGO_ON = .not.LLDEEP
        END IF
        
      END DO
      ! end of big loop for search of departure level
      
      ! chose maximum CAPE value
      PCAPE(JL) = ZCAPE(JL, 1)
!$acc loop seq
      DO JK=2,KLEV
        PCAPE(JL) = MAX(PCAPE(JL), ZCAPE(JL, JK))
      END DO
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUBASEN_LOKI
END MODULE CUBASEN_LOKI_MOD
