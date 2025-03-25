!OPTIONS XOPT(HSFUN)
MODULE CUASCN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUASCN_LOKI (YDTHF, YDCST, YDEPHLI, YDECLDP, YDECUMF, YDSPP_CONFIG, YGFL, KIDIA, KFDIA, KLON, KLEV, LDTDKMF,  &
  & PTSPHY, PTENH, PQENH, PUEN, PVEN, PTEN, PQEN, PQSEN, PLITOT, PGEO, PGEOH, PAP, PAPH, PVERVEL, PWUBASE, PGP2DSPP, LDLAND,  &
  & LDCUM, KTYPE, KLAB, LSCVFLAG, PTU, PQU, PLU, PLRAIN, PMFU, PMFUB, PLGLAC, PMFUS, PMFUQ, PMFUL, PLUDE, PLUDELI, PDMFUP,  &
  & PLCRIT_AER, PDMFEN, KCBOT, KCTOP, KCTOP0, KDPL, PMFUDE_RATE, PKINEU, PWU, PWMEAN, YDSTACK_L)
    
    !          THIS ROUTINE DOES THE CALCULATIONS FOR CLOUD ASCENTS
    !          FOR CUMULUS PARAMETERIZATION
    
    !          PURPOSE.
    !          --------
    !          TO PRODUCE CLOUD ASCENTS FOR CU-PARAMETRIZATION
    !          (VERTICAL PROFILES OF T,Q,L,U AND V AND CORRESPONDING
    !           FLUXES AS WELL AS PRECIPITATION RATES)
    
    !          INTERFACE
    !          ---------
    
    !          THIS ROUTINE IS CALLED FROM *CUMASTR*.
    
    !          METHOD.
    !          --------
    !          LIFT SURFACE AIR DRY-ADIABATICALLY TO CLOUD BASE
    !          AND THEN CALCULATE MOIST ASCENT FOR
    !          ENTRAINING/DETRAINING PLUME.
    !          ENTRAINMENT AND DETRAINMENT RATES DIFFER FOR
    !          SHALLOW AND DEEP CUMULUS CONVECTION.
    !          IN CASE THERE IS NO PENETRATIVE OR SHALLOW CONVECTION
    !          CHECK FOR POSSIBILITY OF MID LEVEL CONVECTION
    !          (CLOUD BASE VALUES CALCULATED IN *CUBASMC*)
    
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
    !    *KDPL*         DEPARTURE LEVEL FOR CONVECTION
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTSPHY*       TIME STEP FOR THE PHYSICS                      S
    !    *PTENH*        ENV. TEMPERATURE (T+1) ON HALF LEVELS          K
    !    *PQENH*        ENV. SPEC. HUMIDITY (T+1) ON HALF LEVELS     KG/KG
    !    *PUEN*         PROVISIONAL ENVIRONMENT U-VELOCITY (T+1)      M/S
    !    *PVEN*         PROVISIONAL ENVIRONMENT V-VELOCITY (T+1)      M/S
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)      K
    !    *PQEN*         PROVISIONAL ENVIRONMENT SPEC. HUMIDITY (T+1) KG/KG
    !    *PQSEN*        ENVIRONMENT SPEC. SATURATION HUMIDITY (T+1)  KG/KG
    !    *PGEO*         GEOPOTENTIAL                                 M2/S2
    !    *PLITOT*       GRID MEAN LIQUID WATER+ICE CONTENT           KG/KG
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                  M2/S2
    !    *PAP*          PROVISIONAL PRESSURE ON FULL LEVELS           PA
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS           PA
    !    *PVERVEL*      VERTICAL VELOCITY                            PA/S
    !    *PGP2DSPP*     Standard stochastic variable (mean=0, SD=1)
    !    *PLCRIT_AER*   CRITICAL LIQUID MMR FOR AUTOCONVERSION PROCESS KG/KG
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDLAND*       LAND SEA MASK (.TRUE. FOR LAND)
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    !    *LDTDKMF*      Arpege tuning (if TRUE)
    
    !    UPDATED PARAMETERS (INTEGER):
    
    !    *KLAB*         FLAG KLAB=1 FOR SUBCLOUD LEVELS
    !                        KLAB=2 FOR CLOUD LEVELS
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PTU*          TEMPERATURE IN UPDRAFTS                        K
    !    *PQU*          SPEC. HUMIDITY IN UPDRAFTS                   KG/KG
    !    *PLU*          LIQUID WATER CONTENT IN UPDRAFTS             KG/KG
    !    *PLRAIN*       RAIN   WATER CONTENT IN UPDRAFTS             KG/KG
    
    !    OUTPUT PARAMETERS (INTEGER):
    
    !    *KCTOP*        CLOUD TOP LEVEL
    !    *KCTOP0*       FIRST GUESS OF CLOUD TOP LEVEL
    !    *LSCVFLAG*     MASK FOR LIQUID ONLY SHALLOW
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PMFU*         MASSFLUX IN UPDRAFTS                         KG/(M2*S)
    !    *PMFUB*        MASSFLUX IN UPDRAFTS AT CLOUD BASE           KG/(M2*S)
    !    *PMFUS*        FLUX OF DRY STATIC ENERGY IN UPDRAFTS         J/(M2*S)
    !    *PMFUQ*        FLUX OF SPEC. HUMIDITY IN UPDRAFTS           KG/(M2*S)
    !    *PMFUL*        FLUX OF LIQUID WATER IN UPDRAFTS             KG/(M2*S)
    !    *PLUDE*        DETRAINED TOTAL CONDENSATE                   KG/(M2*S)
    !    *PLUDELI*      DETRAINED LIQUID, ICE                        KG/(M2*S)
    !    *PLGLAC*       FROZEN CLOUD WATER/RAIN CONTENT              KG/KG
    !    *PDMFUP*       FLUX DIFFERENCE OF PRECIP. IN UPDRAFTS       KG/(M2*S)
    !    *PMFUDE_RATE*  UPDRAFT DETRAINMENT RATE                     KG/(M2*S)
    !    *PKINEU*       UPDRAFT KINETIC ENERGY                       M2/S2
    !    *PWMEAN*       MEAN UPDRAUGHT VELOCITY                      M/S
    
    !          EXTERNALS
    !          ---------
    !          *CUADJTQ* ADJUST T AND Q DUE TO CONDENSATION IN ASCENT
    !          *CUENTR*  CALCULATE ENTRAINMENT/DETRAINMENT RATES
    !          *CUBASMC* CALCULATE CLOUD BASE VALUES FOR MIDLEVEL CONVECTION
    
    !          REFERENCE
    !          ---------
    !          (TIEDTKE,1989)
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE         E.C.M.W.F.     7/86 MODIF. 12/89
    
    !     MODIFICATIONS.
    !     --------------
    !      01-05-22 : Modified flux limiter M.CULLEN
    !      02-08-14 : Allow for departure level =/ KLEV  P.BECHTOLD
    !      03-08-28 : Clean-up detrainment rates         P.BECHTOLD
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      J.Hague       08-Dec-2005 Tuning: LLFLAG indexing
    !      07-06-01 : Organized entrainment based on RH  P.BECHTOLD
    !      08-02-11 : Simplify entrainment to org no turb P.BECHTOLD
    !      11-03-26 : Detrainment dependent on       RH  P.BECHTOLD
    !      11-09-19 : JJMorcrette effect of prognostic aerosols on autoconversion
    !      16-01-27 : Introduced SPP scheme (LSPP)   M. Leutbecher & S.-J. Lock
    !      30-Jan-20: Single precision fix    F. Vana
    !      20-10-12 : SPP abstraction                M. Leutbecher
    !      21-09-13 : Introduced LDTDKMF and ENTR_RH parameter for Arpege
    !    2021-09-24 : Fix bug on PKINEU, this bug is active only in simple precision mode.
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !     R. El Khatib 06-Sep-2023 vectorization
    !----------------------------------------------------------------------
    
    USE cuentr_LOKI_MOD, ONLY: cuentr_LOKI
    USE cubasmcn_LOKI_MOD, ONLY: cubasmcn_LOKI
    USE cuadjtq_LOKI_MOD, ONLY: cuadjtq_LOKI
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    USE YOMCST, ONLY: TCST
    USE YOETHF, ONLY: TTHF
    USE YOECUMF, ONLY: TECUMF
    USE YOEPHLI, ONLY: TEPHLI
    USE YOECLDP, ONLY: TECLDP
    USE YOM_YGFL, ONLY: TYPE_GFLD
    USE SPP_MOD, ONLY: TSPP_CONFIG
    USE SPP_GEN_MOD, ONLY: SPP_PERT
    
    IMPLICIT NONE
    
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TECLDP), INTENT(IN) :: YDECLDP
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    TYPE(TSPP_CONFIG), INTENT(IN) :: YDSPP_CONFIG
    TYPE(TYPE_GFLD), INTENT(IN) :: YGFL
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    REAL(KIND=JPRB), INTENT(IN) :: PTSPHY
    REAL(KIND=JPRB), INTENT(IN) :: PLCRIT_AER(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PUEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PLITOT(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PVERVEL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PWUBASE(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PGP2DSPP(KLON, YDSPP_CONFIG%SM%NRFTOTAL)
    LOGICAL, INTENT(IN) :: LDLAND(KLON)
    LOGICAL, INTENT(INOUT) :: LDCUM(KLON)
    LOGICAL, INTENT(IN) :: LDTDKMF
    LOGICAL, INTENT(OUT) :: LSCVFLAG(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KTYPE(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KLAB(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PLU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PLRAIN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFUB(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PLGLAC(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLUDE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLUDELI(KLON, KLEV, 2)
    REAL(KIND=JPRB), INTENT(OUT) :: PDMFUP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PDMFEN(KLON, KLEV)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KCTOP(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KCTOP0(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KDPL(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUDE_RATE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PKINEU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PWU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PWMEAN(KLON)
    
    REAL(KIND=JPRB) :: ZDMFEN(KLON), ZDMFDE(KLON), ZQOLD(KLON), ZPRECIP(KLON), ZBUO(KLON, KLEV), ZLUOLD(KLON)
    REAL(KIND=JPRB) :: ZDPMEAN(KLON)
    REAL(KIND=JPRB) :: ZOENTR(KLON), ZPH(KLON)
    LOGICAL :: LLFLAG(KLON), LLFLAGUV, LLO1(KLON), LLO3
    
    INTEGER(KIND=JPIM) :: IK, IS, JK, JL, IKB
    INTEGER(KIND=JPIM) :: JLL, JLM, JLX
    
    REAL(KIND=JPRB) :: Z_CLDMAX, Z_CPRC2, Z_CWDRAG, Z_CWIFRAC, ZALFAW, ZBC, ZBE, ZBUOC, ZC, ZCBF, ZCONS2, ZD, ZDFI, ZDKBUO,  &
    & ZDKEN, ZDNOPRC, ZRG, ZORCPD, ZDT, ZFAC, ZFACBUO, ZINT, ZKEDKE, ZLCRIT, ZLEEN, ZLNEW, ZMFMAX, ZMFTEST, ZMFULK, ZMFUN,  &
    & ZMFUQK, ZMFUSK, ZOEALFA, ZOEALFAP, ZPRCDGW, ZPRCON, ZQEEN, ZQUDE, ZRNEW, ZROLD, ZSCDE, ZSEEN, ZVI, ZVV, ZVW, ZZCO,  &
    & ZOCUDET, ZGLAC
    REAL(KIND=JPRB) :: ZXENTRORG, ZXENTSHALP, ZXPRCDGW
    
    ! A bunch of SPP variables
    LOGICAL :: LLPERT_ENTRORG, LLPERT_ENTSHALP, LLPERT_RPRCON    ! SPP perturbation on?
    INTEGER(KIND=JPIM) :: IPENTRORG, IPENTSHALP, IPRPRCON    ! SPP random field pointer
    INTEGER(KIND=JPIM) :: IPN    ! SPP perturbation pointer
    TYPE(SPP_PERT) :: PN1ENTRORG, PN1ENTSHALP, PN1RPRCON    ! SPP pertn. configs. for ENTRORG, ENTSHALP and RPRCON, respectively
    
    REAL(KIND=JPRB) :: ZCHANGE, ZXS, ZXE
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    LOGICAL :: LLKLAB
    
    
    !DIR$ VFUNCTION EXPHF
#include "fcttre.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    POINTER(IP_ZDMFEN, ZDMFEN)
    POINTER(IP_ZDMFDE, ZDMFDE)
    POINTER(IP_ZQOLD, ZQOLD)
    POINTER(IP_ZPRECIP, ZPRECIP)
    POINTER(IP_ZBUO, ZBUO)
    POINTER(IP_ZLUOLD, ZLUOLD)
    POINTER(IP_ZDPMEAN, ZDPMEAN)
    POINTER(IP_ZOENTR, ZOENTR)
    POINTER(IP_ZPH, ZPH)
    POINTER(IP_LLFLAG, LLFLAG)
    POINTER(IP_LLO1, LLO1)
    YLSTACK_L = YDSTACK_L
    IP_ZDMFEN = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDMFDE = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQOLD = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZPRECIP = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZBUO = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZLUOLD = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDPMEAN = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZOENTR = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZPH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_LLFLAG = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
    IP_LLO1 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
!$acc data present( PTENH, PQENH, PUEN, PVEN, PTEN, PQEN, PQSEN, PLITOT, PGEO, PGEOH, PAP, PAPH, PVERVEL, PWUBASE, PGP2DSPP,  &
!$acc & LDLAND, LDCUM, KTYPE, KLAB, LSCVFLAG, PTU, PQU, PLU, PLRAIN, PMFU, PMFUB, PLGLAC, PMFUS, PMFUQ, PMFUL, PLUDE, PLUDELI,  &
!$acc & PDMFUP, PLCRIT_AER, PDMFEN, KCBOT, KCTOP, KCTOP0, KDPL, PMFUDE_RATE, PKINEU, PWU, PWMEAN, YDTHF, YDCST, YDEPHLI,  &
!$acc & YDECLDP, YDECUMF, YDSPP_CONFIG, YGFL )
    !----------------------------------------------------------------------
    
    !*    1.           SPECIFY PARAMETERS
    !                  ------------------
    
    
    ZCONS2 = YDECUMF%RMFCFL / (YDCST%RG*PTSPHY)
    ZRG = 1.0_JPRB / YDCST%RG
    ZORCPD = 1.0_JPRB / YDCST%RCPD
    ZFACBUO = 0.5_JPRB / (1.0_JPRB + 0.5_JPRB)
    ZPRCDGW = YDECUMF%RPRCON / YDCST%RG
    ZDNOPRC = 3.E-4_JPRB      !condensate threshold for precip
    Z_CLDMAX = 5.E-3_JPRB
    Z_CWIFRAC = 0.5_JPRB
    Z_CPRC2 = 0.5_JPRB
    Z_CWDRAG = (3._JPRB / 8._JPRB)*0.506_JPRB / 0.2_JPRB
    
    IF (YDECUMF%LMFGLAC) THEN
      ZGLAC = 1.0_JPRB
    ELSE
      ZGLAC = 0.0_JPRB
    END IF
    
    !----------------------------------------------------------------------
    
    !     2.           SET DEFAULT VALUES
    !                  ------------------
    
    LLO3 = .false.
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      ZLUOLD(JL) = 0.0_JPRB
      IF (.not.LDCUM(JL)) THEN
        KCBOT(JL) = -1
        PMFUB(JL) = 0.0_JPRB
        PQU(JL, KLEV) = 0.0_JPRB
        KTYPE(JL) = 0
      END IF
      PWMEAN(JL) = 0.0_JPRB
      ZDPMEAN(JL) = 0.0_JPRB
      ZOENTR(JL) = 0.0_JPRB
      LSCVFLAG(JL) = .false.
      IF (KTYPE(JL) > 1 .and. YDECUMF%LSCVLIQ) LSCVFLAG(JL) = .true.
      
      !  Prepare SPP
      IF (YDSPP_CONFIG%LSPP) THEN
        
        IPN = YDSPP_CONFIG%PPTR%ENTRORG
        LLPERT_ENTRORG = IPN > 0
        IF (LLPERT_ENTRORG) THEN
          PN1ENTRORG = YDSPP_CONFIG%SM%PN(IPN)
          IPENTRORG = PN1ENTRORG%MP
        END IF
        
        IPN = YDSPP_CONFIG%PPTR%ENTSHALP
        LLPERT_ENTSHALP = IPN > 0
        IF (LLPERT_ENTSHALP) THEN
          PN1ENTSHALP = YDSPP_CONFIG%SM%PN(IPN)
          IPENTSHALP = PN1ENTSHALP%MP
        END IF
        
        IPN = YDSPP_CONFIG%PPTR%RPRCON
        LLPERT_RPRCON = IPN > 0
        IF (LLPERT_RPRCON) THEN
          PN1RPRCON = YDSPP_CONFIG%SM%PN(IPN)
          IPRPRCON = PN1RPRCON%MP
        END IF
        
      ELSE
        LLPERT_ENTRORG = .false.
        LLPERT_ENTSHALP = .false.
        LLPERT_RPRCON = .false.
      END IF
      
      
      ! initalize various quantities
      ! note that liquid water and kinetic energy at cloud base is
      ! preserved from cubase
      
      LLKLAB = .false.
      IF (.not.LDCUM(JL) .or. KTYPE(JL) == 3) LLKLAB = .true.
      
!$acc loop seq
      DO JK=1,KLEV
        IF (JK /= KCBOT(JL)) THEN
          PLU(JL, JK) = 0.0_JPRB
        END IF
        PKINEU(JL, JK) = 0.0_JPRB
        PMFU(JL, JK) = 0.0_JPRB
        PMFUS(JL, JK) = 0.0_JPRB
        PMFUQ(JL, JK) = 0.0_JPRB
        PMFUL(JL, JK) = 0.0_JPRB
        PWU(JL, JK) = 0.0_JPRB
        PLUDE(JL, JK) = 0.0_JPRB
        PLUDELI(JL, JK, 1) = 0.0_JPRB
        PLUDELI(JL, JK, 2) = 0.0_JPRB
        PLGLAC(JL, JK) = 0.0_JPRB
        PDMFUP(JL, JK) = 0.0_JPRB
        PLRAIN(JL, JK) = 0.0_JPRB
        ZBUO(JL, JK) = 0.0_JPRB
        IF (LLKLAB) KLAB(JL, JK) = 0
        IF (.not.LDCUM(JL) .and. PAPH(JL, JK) < 4.E4_JPRB) KCTOP0(JL) = JK
        PDMFEN(JL, JK) = 0.0_JPRB
        PMFUDE_RATE(JL, JK) = 0.0_JPRB
      END DO
      !DIR$ IVDEP
      !NEC$ IVDEP
      !OCL NOVREC
      IF (KTYPE(JL) == 3) LDCUM(JL) = .false.
      
      !----------------------------------------------------------------------
      
      !     3.0          INITIALIZE VALUES AT cloud base LEVEL
      !                  -------------------------------------
      
      KCTOP(JL) = KCBOT(JL)
      IF (LDCUM(JL)) THEN
        IKB = KCBOT(JL)
        PKINEU(JL, IKB) = 0.5*PWUBASE(JL)**2
        PMFU(JL, IKB) = PMFUB(JL)
        PMFUS(JL, IKB) = PMFUB(JL)*(YDCST%RCPD*PTU(JL, IKB) + PGEOH(JL, IKB))
        PMFUQ(JL, IKB) = PMFUB(JL)*PQU(JL, IKB)
        PMFUL(JL, IKB) = PMFUB(JL)*PLU(JL, IKB)
      END IF
    END DO
    
    
    !----------------------------------------------------------------------
    
    !     4.           DO ASCENT: SUBCLOUD LAYER (KLAB=1) ,CLOUDS (KLAB=2)
    !                  BY DOING FIRST DRY-ADIABATIC ASCENT AND THEN
    !                  BY ADJUSTING T,Q AND L ACCORDINGLY IN *CUADJTQ*,
    !                  THEN CHECK FOR BUOYANCY AND SET FLAGS ACCORDINGLY
    !                  -------------------------------------------------
    
!$acc loop seq
    DO JK=KLEV - 1,3,-1
      
      !                  SPECIFY CLOUD BASE VALUES FOR MIDLEVEL CONVECTION
      !                  IN *CUBASMC* IN CASE THERE IS NOT ALREADY CONVECTION
      !                  ----------------------------------------------------
      
      IK = JK
      CALL CUBASMCN_LOKI(YDCST, YDECUMF, KIDIA, KFDIA, KLON, KLEV, IK, PTEN, PQEN, PQSEN, PVERVEL, PGEO, PGEOH, LDCUM, KTYPE,  &
      & KLAB, KCBOT, PMFU, PMFUB, PLRAIN, PTU, PQU, PLU, PMFUS, PMFUQ, PMFUL, PDMFUP, YDSTACK_L=YLSTACK_L)
      
      IS = 0
      JLM = 0
      ! also liquid only for ktype=3
      ! IF(KTYPE(JL)>1.AND.LSCVLIQ) LSCVFLAG(JL)=.TRUE.
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
        LLFLAG(JL) = .false.
        ZPRECIP(JL) = 0.0_JPRB
        LLO1(JL) = .false.
        IS = IS + KLAB(JL, JK + 1)
        IF (KLAB(JL, 1 + JK) == 0) KLAB(JL, JK) = 0
        IF (LDCUM(JL) .and. KLAB(JL, 1 + JK) == 2 .or. KTYPE(JL) == 3 .and. KLAB(JL, 1 + JK) == 1) THEN
          LLFLAG(JL) = .true.
          JLM = JLM + 1
          JLX = JL
        END IF
        IF (KLAB(JL, 1 + JK) > 0) THEN
          LLFLAGUV = .true.
        ELSE
          LLFLAGUV = .false.
        END IF
        ZPH(JL) = PAPH(JL, JK)
        IF (KTYPE(JL) == 3 .and. JK == KCBOT(JL)) THEN
          ZMFMAX = (PAPH(JL, JK) - PAPH(JL, JK - 1))*ZCONS2
          IF (PMFUB(JL) > ZMFMAX) THEN
            ZFAC = ZMFMAX / PMFUB(JL)
            PMFU(JL, JK + 1) = PMFU(JL, JK + 1)*ZFAC
            PMFUS(JL, JK + 1) = PMFUS(JL, JK + 1)*ZFAC
            PMFUQ(JL, JK + 1) = PMFUQ(JL, JK + 1)*ZFAC
            PMFUB(JL) = ZMFMAX
          END IF
        END IF
      END DO
      
      
      IF (IS > 0) LLO3 = .true.
      
      !*                  SPECIFY ENTRAINMENT RATES IN *CUENTR*
      !                   -------------------------------------
      
      IK = JK
      CALL CUENTR_LOKI(YDCST, YDECUMF, YDSPP_CONFIG, KIDIA, KFDIA, KLON, KLEV, IK, KCBOT, KTYPE, LDCUM, LLO3, PQSEN, PAPH,  &
      & PGEOH, PMFU, PGP2DSPP, ZDMFEN, ZDMFDE, YDSTACK_L=YLSTACK_L)
      
      !                  DO ADIABATIC ASCENT FOR ENTRAINING/DETRAINING PLUME
      !                  ---------------------------------------------------
      
      IF (LLO3) THEN
        
        
!$acc loop vector
        DO JL=KIDIA,KFDIA
          ZQOLD(JL) = 0.0_JPRB
          !JL=JLX(JLL)
          IF (LLFLAG(JL)) THEN
            ZDMFDE(JL) = MIN(ZDMFDE(JL), 0.75_JPRB*PMFU(JL, JK + 1))
            IF (JK == KCBOT(JL)) THEN
              IF (YDSPP_CONFIG%LSPP .and. LLPERT_ENTRORG) THEN
                ZXENTRORG = YDECUMF%ENTRORG*EXP(PN1ENTRORG%MU(1) + PN1ENTRORG%XMAG(1)*PGP2DSPP(JL, IPENTRORG))
              ELSE
                ZXENTRORG = YDECUMF%ENTRORG
              END IF
              ZOENTR(JL) = -ZXENTRORG*(MIN(1.0_JPRB, PQEN(JL, JK) / PQSEN(JL, JK)) - YDECUMF%ENTR_RH)*(PGEOH(JL, JK) - PGEOH(JL,  &
              & JK + 1))*ZRG
              ZOENTR(JL) = MIN(0.4_JPRB, ZOENTR(JL))*PMFU(JL, JK + 1)
            END IF
            IF (JK < KCBOT(JL)) THEN
              ZMFMAX = (PAPH(JL, JK) - PAPH(JL, JK - 1))*ZCONS2
              ZXS = MAX(PMFU(JL, JK + 1) - ZMFMAX, 0.0_JPRB)
              PWMEAN(JL) = PWMEAN(JL) + PKINEU(JL, JK + 1)*(PAP(JL, JK + 1) - PAP(JL, JK))
              ZDPMEAN(JL) = ZDPMEAN(JL) + PAP(JL, JK + 1) - PAP(JL, JK)
              ZDMFEN(JL) = ZOENTR(JL)
              IF (KTYPE(JL) >= 2) THEN
                IF (YDSPP_CONFIG%LSPP .and. LLPERT_ENTSHALP) THEN
                  ZXENTSHALP = YDECUMF%ENTSHALP*EXP(PN1ENTSHALP%MU(1) + PN1ENTSHALP%XMAG(1)*PGP2DSPP(JL, IPENTSHALP))
                ELSE
                  ZXENTSHALP = YDECUMF%ENTSHALP
                END IF
                ZDMFEN(JL) = ZXENTSHALP*ZDMFEN(JL)
                ZDMFDE(JL) = ZDMFEN(JL)
                ! ZDMFDE(JL)=MAX(ZDMFDE(JL),ZDMFEN(JL))
              END IF
              ZDMFDE(JL) = ZDMFDE(JL)*(1.6_JPRB - MIN(1.0_JPRB, PQEN(JL, JK) / PQSEN(JL, JK)))
              ZMFTEST = PMFU(JL, JK + 1) + ZDMFEN(JL) - ZDMFDE(JL)
              ZCHANGE = MAX(ZMFTEST - ZMFMAX, 0.0_JPRB)
              ZXE = MAX(ZCHANGE - ZXS, 0.0_JPRB)
              ZDMFEN(JL) = ZDMFEN(JL) - ZXE
              ZCHANGE = ZCHANGE - ZXE
              ZDMFDE(JL) = ZDMFDE(JL) + ZCHANGE
            END IF
            
            PDMFEN(JL, JK) = ZDMFEN(JL) - ZDMFDE(JL)
            
            PMFU(JL, JK) = PMFU(JL, JK + 1) + ZDMFEN(JL) - ZDMFDE(JL)
            ZQEEN = PQENH(JL, JK + 1)*ZDMFEN(JL)
            ZSEEN = (YDCST%RCPD*PTENH(JL, JK + 1) + PGEOH(JL, JK + 1))*ZDMFEN(JL)
            IF (PLITOT(JL, JK) > YDECLDP%RLMIN) THEN
              ZLEEN = PLITOT(JL, JK)*ZDMFEN(JL)
            ELSE
              ZLEEN = 0.0_JPRB
            END IF
            ZSCDE = (YDCST%RCPD*PTU(JL, JK + 1) + PGEOH(JL, JK + 1))*ZDMFDE(JL)
            ZQUDE = PQU(JL, JK + 1)*ZDMFDE(JL)
            PLUDE(JL, JK) = PLU(JL, JK + 1)*ZDMFDE(JL)
            ZMFUSK = PMFUS(JL, JK + 1) + ZSEEN - ZSCDE
            ZMFUQK = PMFUQ(JL, JK + 1) + ZQEEN - ZQUDE
            ZMFULK = PMFUL(JL, JK + 1) + ZLEEN - PLUDE(JL, JK)
            ZFAC = 1.0_JPRB / MAX(YDECUMF%RMFCMIN, PMFU(JL, JK))
            PLU(JL, JK) = ZMFULK*ZFAC
            PQU(JL, JK) = ZMFUQK*ZFAC
            PTU(JL, JK) = (ZMFUSK*ZFAC - PGEOH(JL, JK))*ZORCPD
            PTU(JL, JK) = MAX(100._JPRB, PTU(JL, JK))
            PTU(JL, JK) = MIN(400._JPRB, PTU(JL, JK))
            ZQOLD(JL) = PQU(JL, JK)
            PLRAIN(JL, JK) = PLRAIN(JL, JK + 1)*MAX(0.0_JPRB, PMFU(JL, JK + 1) - ZDMFDE(JL))*ZFAC
            ZLUOLD(JL) = PLU(JL, JK)
          END IF
          ! reset to environmental values if below departure level
          IF (JK > KDPL(JL)) THEN
            PTU(JL, JK) = PTENH(JL, JK)
            PQU(JL, JK) = PQENH(JL, JK)
            PLU(JL, JK) = 0.0_JPRB
            ZLUOLD(JL) = PLU(JL, JK)
          END IF
        END DO
        
        
        !                  DO CORRECTIONS FOR MOIST ASCENT
        !                  BY ADJUSTING T,Q AND L IN *CUADJTQ*
        !                  -----------------------------------
        
        IK = JK
        IF (JLM > 0) THEN
          IF (YDECUMF%LSCVLIQ) THEN
            CALL CUADJTQ_LOKI(YDTHF, YDCST, YDEPHLI, KIDIA, KFDIA, KLON, KLEV, IK, ZPH, PTU, PQU, LLFLAG, 6, LSCVFLAG,  &
            & YDSTACK_L=YLSTACK_L)
          ELSE
            CALL CUADJTQ_LOKI(YDTHF, YDCST, YDEPHLI, KIDIA, KFDIA, KLON, KLEV, IK, ZPH, PTU, PQU, LLFLAG, 1, LSCVFLAG,  &
            & YDSTACK_L=YLSTACK_L)
          END IF
        END IF
        
        
!$acc loop vector
        DO JL=KIDIA,KFDIA
          IF (YDEPHLI%LPHYLIN) THEN
            
            !DIR$ IVDEP
            !NEC$ IVDEP
            !OCL NOVREC
            !JL=JLX(JLL)
            IF (LLFLAG(JL)) THEN
              IF (PQU(JL, JK) /= ZQOLD(JL)) THEN
                ZOEALFA = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(PTU(JL, JK) - YDEPHLI%RLPTRC)) + 1.0_JPRB))
                ZOEALFAP = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(PTU(JL, JK + 1) - YDEPHLI%RLPTRC)) + 1.0_JPRB))
                PLGLAC(JL, JK) = PLU(JL, JK)*((1.0_JPRB - ZOEALFA) - (1.0_JPRB - ZOEALFAP))
                ! add glaciation of rain
                ZFAC = 0.545_JPRB*(TANH(0.17_JPRB*(PTEN(JL, JK) - YDEPHLI%RLPTRC)) + 1.0_JPRB)
                PLGLAC(JL, JK) = PLGLAC(JL, JK) + ZFAC*PDMFUP(JL, JK + 1) / MAX(YDECUMF%RMFCMIN, PMFU(JL, JK + 1))*(0.5_JPRB +  &
                & SIGN(0.5_JPRB, YDCST%RTT - PTEN(JL, JK)))*ZGLAC
                PTU(JL, JK) = PTU(JL, JK) + YDTHF%RALFDCP*PLGLAC(JL, JK)
              END IF
            END IF
            
          ELSE
            
            !DIR$ IVDEP
            !NEC$ IVDEP
            !OCL NOVREC
            !JL=JLX(JLL)
            IF (LLFLAG(JL)) THEN
              IF (PQU(JL, JK) /= ZQOLD(JL)) THEN
                PLGLAC(JL, JK) = PLU(JL, JK)*((1.0_JPRB - FOEALFCU(PTU(JL, JK))) - (1.0_JPRB - FOEALFCU(PTU(JL, JK + 1))))
                IF (LSCVFLAG(JL)) PLGLAC(JL, JK) = 0.0_JPRB
                ! add glaciation of rain, only fraction added to updraught heat
                ZFAC = FOEALFCU(PTEN(JL, JK))
                PLGLAC(JL, JK) = PLGLAC(JL, JK) + ZFAC*PDMFUP(JL, JK + 1) / MAX(YDECUMF%RMFCMIN, PMFU(JL, JK + 1))*(0.5_JPRB +  &
                & SIGN(0.5_JPRB, YDCST%RTT - PTEN(JL, JK)))*ZGLAC
                PTU(JL, JK) = PTU(JL, JK) + YDTHF%RALFDCP*PLGLAC(JL, JK)
              END IF
            END IF
            
          END IF
          
          !JL=JLX(JLL)
          IF (LLFLAG(JL)) THEN
            IF (PQU(JL, JK) /= ZQOLD(JL)) THEN
              KLAB(JL, JK) = 2
              PLU(JL, JK) = PLU(JL, JK) + ZQOLD(JL) - PQU(JL, JK)
              ZBC = PTU(JL, JK)*(1.0_JPRB + YDCST%RETV*PQU(JL, JK) - PLU(JL, JK + 1) - PLRAIN(JL, JK + 1))
              ZBE = PTENH(JL, JK)*(1.0_JPRB + YDCST%RETV*PQENH(JL, JK))
              ZBUO(JL, JK) = ZBC - ZBE
              
              ! set   flags in case of midlevel convection
              
              IF (KTYPE(JL) == 3 .and. KLAB(JL, 1 + JK) == 1) THEN
                IF (ZBUO(JL, JK) > -0.5_JPRB) THEN
                  LDCUM(JL) = .true.
                  KCTOP(JL) = JK
                  PKINEU(JL, JK) = 0.5_JPRB
                ELSE
                  KLAB(JL, JK) = 0
                  PMFU(JL, JK) = 0.0_JPRB
                  PLUDE(JL, JK) = 0.0_JPRB
                  PLU(JL, JK) = 0.0_JPRB
                END IF
              END IF
              
              IF (KLAB(JL, 1 + JK) == 2) THEN
                
                !IF(ZBUO(JL,JK) < 0.0_JPRB.AND.KTYPE(JL)==1) THEN
                IF (ZBUO(JL, JK) < -0.1_JPRB) THEN
                  PTENH(JL, JK) = 0.5_JPRB*(PTEN(JL, JK) + PTEN(JL, JK - 1))
                  PQENH(JL, JK) = 0.5_JPRB*(PQEN(JL, JK) + PQEN(JL, JK - 1))
                  ZBUO(JL, JK) = ZBC - PTENH(JL, JK)*(1.0_JPRB + YDCST%RETV*PQENH(JL, JK))
                END IF
                ZBUOC = 0.5*(ZBUO(JL, JK) + ZBUO(JL, JK + 1)) / (PTENH(JL, JK)*(1.0_JPRB + YDCST%RETV*PQENH(JL, JK)))
                ZDKBUO = (PGEOH(JL, JK) - PGEOH(JL, JK + 1))*ZFACBUO*ZBUOC
                
                ! eith  er use entrainment rate or if zero
                ! use   detrainmnet rate as a substitute for
                ! mixi  ng and "pressure" gradient term in upper
                ! trop  osphere
                
                IF (ZDMFEN(JL) > 0.0_JPRB) THEN
                  ZDKEN = MIN(1.0_JPRB, (1 + Z_CWDRAG)*ZDMFEN(JL) / MAX(YDECUMF%RMFCMIN, PMFU(JL, JK + 1)))
                ELSE
                  ZDKEN = MIN(1.0_JPRB, (1 + Z_CWDRAG)*ZDMFDE(JL) / MAX(YDECUMF%RMFCMIN, PMFU(JL, JK + 1)))
                END IF
                
                IF (LDTDKMF) THEN
                  PKINEU(JL, JK) = (PKINEU(JL, JK + 1)*(1 - ZDKEN) + ZDKBUO) / (1 + ZDKEN)
                  ZBUOC = ZBUO(JL, JK)
                ELSE
                  PKINEU(JL, JK) = MAX(-1.E3_JPRB, (PKINEU(JL, JK + 1)*(1 - ZDKEN) + ZDKBUO) / (1 + ZDKEN))
                END IF
                IF (ZBUOC < 0.0_JPRB) THEN
                  ZKEDKE = PKINEU(JL, JK) / MAX(1.E-3_JPRB, PKINEU(JL, JK + 1))
                  ZKEDKE = MAX(0.0_JPRB, MIN(1.0_JPRB, ZKEDKE))
                  ZOCUDET = (1.6_JPRB - MIN(1.0_JPRB, PQEN(JL, JK) / PQSEN(JL, JK)))
                  ZMFUN = ZOCUDET*SQRT(ZKEDKE)
                  ZDMFDE(JL) = MAX(ZDMFDE(JL), PMFU(JL, JK + 1)*(1.0_JPRB - ZMFUN))
                  PLUDE(JL, JK) = PLU(JL, JK + 1)*ZDMFDE(JL)
                  PMFU(JL, JK) = PMFU(JL, JK + 1) + ZDMFEN(JL) - ZDMFDE(JL)
                END IF
                
                IF (ZBUO(JL, JK) > -0.2_JPRB) THEN
                  IKB = KCBOT(JL)
                  IF (YDSPP_CONFIG%LSPP .and. LLPERT_ENTRORG) THEN
                    ZXENTRORG = YDECUMF%ENTRORG*EXP(PN1ENTRORG%MU(1) + PN1ENTRORG%XMAG(1)*PGP2DSPP(JL, IPENTRORG))
                  ELSE
                    ZXENTRORG = YDECUMF%ENTRORG
                  END IF
                  ZOENTR(JL) = ZXENTRORG*(0.3_JPRB - (MIN(1.0_JPRB, PQEN(JL, JK - 1) / PQSEN(JL, JK - 1)) - YDECUMF%ENTR_RH)) &
                  & *(PGEOH(JL, JK - 1) - PGEOH(JL, JK))*ZRG*MIN(1.0_JPRB, PQSEN(JL, JK) / PQSEN(JL, IKB))**3
                  ZOENTR(JL) = MIN(0.4_JPRB, ZOENTR(JL))*PMFU(JL, JK)
                ELSE
                  ZOENTR(JL) = 0.0_JPRB
                END IF
                
                ! Erase values if below departure level
                IF (JK > KDPL(JL)) THEN
                  PMFU(JL, JK) = PMFU(JL, JK + 1)
                  PKINEU(JL, JK) = 0.5_JPRB
                END IF
                IF (PKINEU(JL, JK) > 0.0_JPRB .and. PMFU(JL, JK) > 0.0_JPRB .and. (ZBUO(JL, JK) > -2._JPRB .or. PTEN(JL, -1 + JK) &
                &  / (PGEO(JL, -1 + JK)*ZRG - PGEO(JL, JK)*ZRG) - PTEN(JL, JK) / (PGEO(JL, -1 + JK)*ZRG - PGEO(JL, JK)*ZRG) <  &
                & -3.E-3_JPRB)) THEN
                  ! add overshoot limiter for convective top evaluation
                  KCTOP(JL) = JK
                  LLO1(JL) = .true.
                ELSE
                  KLAB(JL, JK) = 0
                  PMFU(JL, JK) = 0.0_JPRB
                  PKINEU(JL, JK) = 0.0_JPRB
                  ZDMFDE(JL) = PMFU(JL, JK + 1)
                  PLUDE(JL, JK) = PLU(JL, JK + 1)*ZDMFDE(JL)
                END IF
                
                ! stor  e detrainment rates for updraught
                
                IF (PMFU(JL, 1 + JK) > 0.0_JPRB) THEN
                  PMFUDE_RATE(JL, JK) = ZDMFDE(JL)
                END IF
                
              END IF
              
              !       ELSEIF(LLFLAG(JL).AND.KTYPE(JL)==2.AND.PQU(JL,JK) == ZQOLD(JL)) THEN
            ELSE IF (KTYPE(JL) == 2 .and. PQU(JL, JK) == ZQOLD(JL)) THEN
              KLAB(JL, JK) = 0
              PMFU(JL, JK) = 0.0_JPRB
              PKINEU(JL, JK) = 0.0_JPRB
              ZDMFDE(JL) = PMFU(JL, JK + 1)
              PLUDE(JL, JK) = PLU(JL, JK + 1)*ZDMFDE(JL)
              PMFUDE_RATE(JL, JK) = ZDMFDE(JL)
              
            END IF
          END IF
          
          !              CALCULATE PRECIPITATION RATE BY
          !              ANALYTIC INTEGRATION OF EQUATION FOR L
          
          IF (LLO1(JL)) THEN
            IF (PLU(JL, JK) > ZDNOPRC) THEN
              PWU(JL, JK) = MIN(15._JPRB, SQRT(2.0_JPRB*MAX(0.5_JPRB, PKINEU(JL, JK + 1))))
              !       increase conversion for liquid phase only
              IF (LDTDKMF) THEN
                ZZCO = FOEALFCU(PTU(JL, JK))*1.3_JPRB + (1.0_JPRB - FOEALFCU(PTU(JL, JK)))
              ELSE
                ZZCO = 1.0_JPRB + 0.3_JPRB*FOEALFCU(PTU(JL, JK))
              END IF
              ! IF(LSCVFLAG(JL)) ZZCO=1.3_JPRB
              
              IF (YDSPP_CONFIG%LSPP .and. LLPERT_RPRCON) THEN
                ZXPRCDGW = ZPRCDGW*EXP(PN1RPRCON%MU(1) + PN1RPRCON%XMAG(1)*PGP2DSPP(JL, IPRPRCON))
              ELSE
                ZXPRCDGW = ZPRCDGW
              END IF
              ZPRCON = ZXPRCDGW / (0.75_JPRB*PWU(JL, JK))*ZZCO
              
              !           PARAMETERS FOR BERGERON-FINDEISEN PROCESS (T < -5C)
              
              ZDT = MIN(YDTHF%RTBERCU - YDTHF%RTICECU, MAX(YDTHF%RTBERCU - PTU(JL, JK), 0.0_JPRB))
              ZCBF = 1 + Z_CPRC2*SQRT(ZDT)
              ZZCO = ZPRCON*ZCBF
              
              IF (YGFL%NACTAERO > 0) THEN
                !         (Prognostic) aerosols in clouds, CCN effect only in pure warm phase
                !         then phases out in mixed phase - ***NOT*** linear physics
                ! CCN number taken at each height from environment
                IF (YDECLDP%LAERLIQAUTOCP) THEN
                  ZALFAW = FOEALFCU(PTU(JL, JK))
                  ZLCRIT = ZALFAW*PLCRIT_AER(JL, JK) + (1.0_JPRB - ZALFAW)*ZDNOPRC
                  ! CCN number determined at cloud base (entrainment ignored)
                ELSE IF (YDECLDP%LAERLIQAUTOCPB) THEN
                  ZALFAW = FOEALFCU(PTU(JL, JK))
                  ZLCRIT = ZALFAW*PLCRIT_AER(JL, KCBOT(JL)) + (1.0_JPRB - ZALFAW)*ZDNOPRC
                ELSE
                  ZLCRIT = ZDNOPRC / ZCBF
                END IF
              ELSE
                ZLCRIT = ZDNOPRC / ZCBF
              END IF
              
              ZDFI = PGEOH(JL, JK) - PGEOH(JL, JK + 1)
              ZC = (PLU(JL, JK) - ZLUOLD(JL))
              ZD = ZZCO*(1.0_JPRB - EXP(-(PLU(JL, JK) / ZLCRIT)**2))*ZDFI
              ZINT = EXP(-ZD)
              ZLNEW = ZLUOLD(JL)*ZINT + ZC / ZD*(1.0_JPRB - ZINT)
              ZLNEW = MAX(0.0_JPRB, MIN(PLU(JL, JK), ZLNEW))
              ZLNEW = MIN(Z_CLDMAX, ZLNEW)
              ZPRECIP(JL) = MAX(0.0_JPRB, ZLUOLD(JL) + ZC - ZLNEW)
              PDMFUP(JL, JK) = ZPRECIP(JL)*PMFU(JL, JK)
              PLRAIN(JL, JK) = PLRAIN(JL, JK) + ZPRECIP(JL)
              PLU(JL, JK) = ZLNEW
            END IF
          END IF
          
          IF (YDEPHLI%LPHYLIN) THEN
            
            !DEC$ IVDEP
            !NEC$ IVDEP
            IF (LLO1(JL)) THEN
              IF (PLRAIN(JL, JK) > 0.0_JPRB) THEN
                ZVW = 21.18_JPRB*PLRAIN(JL, JK)**0.2_JPRB
                ZVI = Z_CWIFRAC*ZVW
                ZALFAW = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(PTU(JL, JK) - YDEPHLI%RLPTRC)) + 1.0_JPRB))
                ZVV = ZALFAW*ZVW + (1.0_JPRB - ZALFAW)*ZVI
                ZROLD = PLRAIN(JL, JK) - ZPRECIP(JL)
                ZC = ZPRECIP(JL)
                PWU(JL, JK) = MIN(15._JPRB, SQRT(2.0_JPRB*MAX(0.1_JPRB, PKINEU(JL, JK))))
                ZD = ZVV / PWU(JL, JK)
                ZINT = EXP(-ZD)
                ZRNEW = ZROLD*ZINT + ZC / ZD*(1.0_JPRB - ZINT)
                ZRNEW = MAX(0.0_JPRB, MIN(PLRAIN(JL, JK), ZRNEW))
                PLRAIN(JL, JK) = ZRNEW
              END IF
            END IF
            
          ELSE
            
            IF (LLO1(JL)) THEN
              IF (PLRAIN(JL, JK) > 0.0_JPRB) THEN
                ZVW = 21.18_JPRB*PLRAIN(JL, JK)**0.2_JPRB
                ZVI = Z_CWIFRAC*ZVW
                ZALFAW = FOEALFCU(PTU(JL, JK))
                IF (LSCVFLAG(JL)) ZALFAW = 1.0_JPRB
                ZVV = ZALFAW*ZVW + (1.0_JPRB - ZALFAW)*ZVI
                ZROLD = PLRAIN(JL, JK) - ZPRECIP(JL)
                ZC = ZPRECIP(JL)
                PWU(JL, JK) = MIN(15._JPRB, SQRT(2.0_JPRB*MAX(0.1_JPRB, PKINEU(JL, JK))))
                ZD = ZVV / PWU(JL, JK)
                ZINT = EXP(-ZD)
                ZRNEW = ZROLD*ZINT + ZC / ZD*(1.0_JPRB - ZINT)
                ZRNEW = MAX(0.0_JPRB, MIN(PLRAIN(JL, JK), ZRNEW))
                PLRAIN(JL, JK) = ZRNEW
              END IF
            END IF
            
          END IF
          
          !JL=JLX(JLL)
          IF (LLFLAG(JL)) THEN
            PMFUL(JL, JK) = PLU(JL, JK)*PMFU(JL, JK)
            PMFUS(JL, JK) = (YDCST%RCPD*PTU(JL, JK) + PGEOH(JL, JK))*PMFU(JL, JK)
            PMFUQ(JL, JK) = PQU(JL, JK)*PMFU(JL, JK)
            ZALFAW = FOEALFCU(PTU(JL, JK))
            IF (LSCVFLAG(JL)) ZALFAW = 1.0_JPRB
            PLUDELI(JL, JK, 1) = ZALFAW*PLUDE(JL, JK)
            PLUDELI(JL, JK, 2) = (1.0_JPRB - ZALFAW)*PLUDE(JL, JK)
          END IF
        END DO
        
        
      END IF
    END DO
    
    !----------------------------------------------------------------------
    
    !     5.           FINAL CALCULATIONS
    !                  ------------------
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      IF (KCTOP(JL) == -1) LDCUM(JL) = .false.
      KCBOT(JL) = MAX(KCBOT(JL), KCTOP(JL))
      IF (LDCUM(JL)) THEN
        PWMEAN(JL) = MAX(1.E-2_JPRB, PWMEAN(JL) / MAX(1.0_JPRB, ZDPMEAN(JL)))
        PWMEAN(JL) = SQRT(2.0_JPRB*PWMEAN(JL))
      END IF
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUASCN_LOKI
END MODULE CUASCN_LOKI_MOD
