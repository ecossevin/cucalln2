MODULE CUMASTRN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUMASTRN_LOKI (PPLDARE, PPLRG, YDTHF, YDCST, YDML_PHY_SLIN, YDML_PHY_EC, YGFL, YDCHEM, YDSPP_CONFIG, YDPERTPAR,  &
  & KIDIA, KFDIA, KLON, KLEV, PDX, LDTDKMF, LDMCAPEA, LDLAND, PTSPHY, PTEN, PQEN, PUEN, PVEN, PLITOT, PVERVEL, PQSEN, PQHFL,  &
  & PAHFS, PAP, PAPH, PGEO, PGEOH, PGAW, PCUCONVCA, PGP2DSPP, PTENT, PTENQ, PTENU, PTENV, PTENTA, PTENQA, LDCUM, KTYPE, KCBOT,  &
  & KCTOP, LDCUM_LIG, KCBOT_LIG, KCTOP_LIG, KBOTSC, LDSC, LDSHCV, PLCRIT_AER, PTU, PQU, PLU, PLUDE, PLUDELI, PSNDE, PENTH,  &
  & PMFLXR, PMFLXS, PRAIN, PLRAIN, PRSUD, PMFU, PMFD, PLGLAC, PMFUDE_RATE, PMFDDE_RATE, PCAPE, PWU, PWMEAN, PVDISCU, PDISS,  &
  & KTRAC, PCEN, PTENC, PSCAV, PSCAV0, YDSTACK_L)
    
    !**** *CUMASTR*  MASTER ROUTINE FOR CUMULUS MASSFLUX-SCHEME
    
    !     PURPOSE
    !     -------
    !          THIS ROUTINE COMPUTES THE PHYSICAL TENDENCIES OF THE
    !     PROGNOSTIC VARIABLES T,Q,U, V AND TRACERS DUE TO CONVECTIVE PROCESSES.
    !     PROCESSES CONSIDERED ARE: CONVECTIVE FLUXES, FORMATION OF
    !     PRECIPITATION, EVAPORATION OF FALLING RAIN BELOW CLOUD BASE,
    !     SATURATED CUMULUS DOWNDRAFTS.
    
    !**   INTERFACE.
    !     ----------
    
    !          *CUMASTR* IS CALLED FROM *CUCALL*
    !     THE ROUTINE TAKES ITS INPUT FROM THE LONG-TERM STORAGE
    !     T,Q,U,V,PHI AND P AND MOISTURE TENDENCIES.
    !     IT RETURNS ITS OUTPUT TO THE SAME SPACE
    !      1.MODIFIED TENDENCIES OF MODEL VARIABLES
    !      2.RATES OF CONVECTIVE PRECIPITATION
    !        (USED IN SUBROUTINE SURF)
    !      3.CLOUD BASE, CLOUD TOP AND PRECIP FOR RADIATION
    !        (USED IN SUBROUTINE CLOUD)
    
    !     METHOD
    !     -------
    
    !     PARAMETERIZATION IS DONE USING A MASSFLUX-SCHEME.
    !        (1) DEFINE CONSTANTS AND PARAMETERS
    !        (2) SPECIFY VALUES (T,Q,QS...) AT HALF LEVELS AND
    !            INITIALIZE UPDRAFT- AND DOWNDRAFT-VALUES IN 'CUINI'
    !        (3) CALCULATE CLOUD BASE IN 'CUBASE'
    !            AND SPECIFY CLOUD BASE MASSFLUX FROM PBL MOISTURE BUDGET
    !        (4) DO CLOUD ASCENT IN 'CUASC' IN ABSENCE OF DOWNDRAFTS
    !        (5) DO DOWNDRAFT CALCULATIONS:
    !              (A) DETERMINE VALUES AT LFS IN 'CUDLFS'
    !              (B) DETERMINE MOIST DESCENT IN 'CUDDRAF'
    !              (C) RECALCULATE CLOUD BASE MASSFLUX CONSIDERING THE
    !                  EFFECT OF CU-DOWNDRAFTS
    !        (6) DO FINAL CLOUD ASCENT IN 'CUASC'
    !        (7) DO FINAL ADJUSMENTS TO CONVECTIVE FLUXES IN 'CUFLX',
    !            DO EVAPORATION IN SUBCLOUD LAYER
    !        (8) CALCULATE INCREMENTS OF T AND Q IN 'CUDTDQ'
    !        (9) CALCULATE INCREMENTS OF U AND V IN 'CUDUDV'
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KTRAC*        NUMBER OF CHEMICAL TRACERS
    
    !     INPUT PARAMETERS (LOGICAL)
    
    !    *LDLAND*       LAND SEA MASK (.TRUE. FOR LAND)
    !    *LDTDKMF*      Arpege tuning (if TRUE)
    
    !     INPUT PARAMETERS (REAL)
    
    !    *PTSPHY*       TIME STEP FOR THE PHYSICS                       S
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)       K
    !    *PQEN*         PROVISIONAL ENVIRONMENT SPEC. HUMIDITY (T+1)  KG/KG
    !    *PUEN*         PROVISIONAL ENVIRONMENT U-VELOCITY (T+1)       M/S
    !    *PVEN*         PROVISIONAL ENVIRONMENT V-VELOCITY (T+1)       M/S
    !    *PCEN*         PROVISIONAL ENVIRONMENT TRACER CONCENTRATIONS KG/KG
    !    *PLITOT*       GRID MEAN LIQUID WATER+ICE CONTENT            KG/KG
    !    *PVERVEL*      VERTICAL VELOCITY                             PA/S
    !    *PQSEN*        ENVIRONMENT SPEC. SATURATION HUMIDITY (T+1)   KG/KG
    !    *PQHFL*        MOISTURE FLUX (EXCEPT FROM SNOW EVAP.)        KG/(SM2)
    !    *PAHFS*        SENSIBLE HEAT FLUX                            W/M2
    !    *PAP*          PROVISIONAL PRESSURE ON FULL LEVELS             PA
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS             PA
    !    *PGEO*         GEOPOTENTIAL                                  M2/S2
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                   M2/S2
    !    *PGAW*       NORMALISED GAUSSIAN QUADRATURE WEIGHT / NUMBER OF LONGITUDE POINTS
    !                           LOCAL SUB-AREA == 4*RPI*RA**2 * PGAW
    !    *PLCRIT_AER*   CRITICAL LIQUID MMR FOR AUTOCONVERSION PROCESS KG/KG
    !    *PCUCONVCA*    COUPLING TO CELL AUTOMATON OR 2D ADV FIELD     ( )
    !    *PGP2DSPP*     Standard stochastic variable (mean=0, SD=1)
    !    *PSCAV*        SCAVENGING COEFFICIENTS FOR CHEM TRANSPORT    UNITLESS
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PTENT*        TEMPERATURE TENDENCY                           K/S
    !    *PTENQ*        MOISTURE TENDENCY                             KG/(KG S)
    !    *PTENU*        TENDENCY OF U-COMP. OF WIND                    M/S2
    !    *PTENV*        TENDENCY OF V-COMP. OF WIND                    M/S2
    !    *PTENC*        TENDENCY OF CHEMICAL TRACERS                   1/S
    !    *PTENTA*       TEMPERATURE TENDENCY DYNAMICS=TOT ADVECTION    K/S
    !    *PTENQA*       MOISTURE    TENDENCY DYNAMICS=TOT ADVECTION    1/S
    
    !    OUTPUT PARAMETERS (LOGICAL):
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    !    *LDCUM_LIG*    FLAG: .TRUE. FOR CONVECTIVE POINTS (FOR LIGHTNING PARAM)
    !    *LDSC*         FLAG: .TRUE. FOR SC-POINTS
    
    !    OUTPUT PARAMETERS (INTEGER):
    
    !    *KTYPE*        TYPE OF CONVECTION
    !                       1 = PENETRATIVE CONVECTION
    !                       2 = SHALLOW CONVECTION
    !                       3 = MIDLEVEL CONVECTION
    !    *KCBOT*        CLOUD BASE LEVEL
    !    *KCTOP*        CLOUD TOP LEVEL
    !    *KCBOT_LIG*    CLOUD BASE LEVEL (FOR LIGHTNING PARAM)
    !    *KCTOP_LIG*    CLOUD TOP LEVEL (FOR LIGHTNING PARAM)
    !    *KBOTSC*       CLOUD BASE LEVEL FOR SC-CLOUDS
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PTU*          TEMPERATURE IN UPDRAFTS                         K
    !    *PQU*          SPEC. HUMIDITY IN UPDRAFTS                    KG/KG
    !    *PLU*          LIQUID WATER CONTENT IN UPDRAFTS              KG/KG
    !    *PLUDE*        DETRAINED TOTAL CONDENSATE                    KG/(M2*S)
    !    *PLUDELI*      DETRAINED LIQUID, ICE, VAPOR, T               KG/(M2*S)
    !    *PLGLAC*       FROZEN CLOUD WATER/RAIN CONTENT              KG/KG
    !    *PSNDE*        DETRAINED SNOW/RAIN                           KG/(M2*S)
    !    *PENTH*        INCREMENT OF DRY STATIC ENERGY                 J/(KG*S)
    !    *PMFLXR*       CONVECTIVE RAIN FLUX                          KG/(M2*S)
    !    *PMFLXS*       CONVECTIVE SNOW FLUX                          KG/(M2*S)
    !    *PRAIN*        TOTAL PRECIP. PRODUCED IN CONV. UPDRAFTS      KG/(M2*S)
    !                   (NO EVAPORATION IN DOWNDRAFTS)
    !    *PLRAIN*       RAIN+SNOW CONTENT IN UPDRAFTS                 KG/KG
    !    *PRSUD*        CONVECT MEAN RAIN AND SNOW CONTENT IN COLUMN  KG/KG
    !    *PMFU*         MASSFLUX UPDRAFTS                             KG/(M2*S)
    !    *PMFD*         MASSFLUX DOWNDRAFTS                           KG/(M2*S)
    !    *PMFUDE_RATE*  UPDRAFT DETRAINMENT RATE                      KG/(M3*S)
    !    *PMFDDE_RATE*  DOWNDRAFT DETRAINMENT RATE                    KG/(M3*S)
    !    *PCAPE*        CONVECTVE AVAILABLE POTENTIAL ENERGY           J/KG
    !    *PWMEAN*       VERTICALLY AVERAGED UPDRAUGHT VELOCITY         M/S
    !    *PVDISCU*      VERT INTEGRATED CONVECTIVE DISSIPATION RATE    W/m2
    !    *PDISS*        DISSIPATION BY DEEP CONVECTION ESTIMATE       m2/s3^(1/3)
    
    !     EXTERNALS.
    !     ----------
    
    !       CUINI:  INITIALIZES VALUES AT VERTICAL GRID USED IN CU-PARAMETR.
    !       CUBASE: CLOUD BASE CALCULATION FOR PENETR.AND SHALLOW CONVECTION
    !       CUASC:  CLOUD ASCENT FOR ENTRAINING PLUME
    !       CUDLFS: DETERMINES VALUES AT LFS FOR DOWNDRAFTS
    !       CUDDRAF:DOES MOIST DESCENT FOR CUMULUS DOWNDRAFTS
    !       CUFLX:  FINAL ADJUSTMENTS TO CONVECTIVE FLUXES (ALSO IN PBL)
    !       CUDQDT: UPDATES TENDENCIES FOR T AND Q
    !       CUDUDV: UPDATES TENDENCIES FOR U AND V
    !       CUCTRACER: TRACER TRANSPORT
    
    !     SWITCHES.
    !     --------
    
    !          LMFPEN=.TRUE.   PENETRATIVE CONVECTION IS SWITCHED ON
    !          LMFSCV=.TRUE.   SHALLOW CONVECTION IS SWITCHED ON
    !          LMFMID=.TRUE.   MIDLEVEL CONVECTION IS SWITCHED ON
    !          LMFDD=.TRUE.    CUMULUS DOWNDRAFTS SWITCHED ON
    !          LMFDUDV=.TRUE.  CUMULUS FRICTION SWITCHED ON
    !          LMFTRAC=.false. TRACER TRANSPORT
    
    !     REFERENCE.
    !     ----------
    
    !          PAPER ON MASSFLUX SCHEME (TIEDTKE,1989)
    !          DRAFT PAPER ON MASSFLUX SCHEME (NORDENG, 1995)
    !          Bechtold et al. (2008 QJRMS 134,1337-1351), Rooy et al. (2012 QJRMS)
    !          Bechtold et al. (2013 JAS)
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE      E.C.M.W.F.     1986/1987/1989
    
    !     MODIFICATIONS.
    !     --------------
    !      03-08-29 : Clean-up, deep/shallow switches  P.Bechtold
    !      04-02-11 : Add tracer transport             P.Bechtold
    !      05-02-11 : Positive scaling of total Mflux  P.Bechtold
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      04-12-03 : Turn off shallow convection over stratocu. M.Ko"hler
    !      05-06-27 : Switch off ddraught if idtop<kctop
    !                 correction for detrainment rates P.Bechtold
    !      05-11-22 : Mods for coarser/finer physics D.Salmond + M.Hortal
    !      06-02-11 : Enable TQ implicit               P.Bechtold
    !      07-06-01 : Only single updraught call with  P.Bechtold
    !                 scaling, convective turnover time
    !                 scale, contain momentum computations in cumastrn
    !      07-10-09 : Added KE dissipation and convective scavenging   P. Bechtold
    !      12-03-02 : remove all entrainment stuff     P. Bechtold
    !      04-10-12 : Add RPLRG/RPLDARE for small planet  N.Semane+P.Bechtold
    !      13-02-23 : modif diurnal cycle CAPE closure P. Bechtold
    !      13-10-01 : modified option RCAPDCYCL=1 for diurnal cycle N. Semane
    !      16-01-27 : Introduced SPP scheme (LSPP)     M. Leutbecher & S.-J. Lock
    !      20180303 : Gabor: Just a comment line to force recompilation due to
    !                        compiler wrapper optimation exception liat change
    !      20-08-25 : Additional total moisture advection in CAPE closure P. Bechtold&T. Becker
    !      08-12-20 : Added separate fields for lightning parameterization  P. Lopez.
    !      20-10-12 : SPP abstraction and revision     M. Leutbecher & S. Lang
    !    2021-04-26 : Introduce LNEWTAU switch to compute RTAU depending on grid size  Y. Bouteloup
    !      20210913 : Modifications for Arpege Y.Bouteloup (LDTDKMF)
    !    2020-09-18 : Choose CAPE diagnostic (LMCAPEA) J.M. Piriou
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !      15-11-21 : Added PVDISCU, vert-integrated convective dissipation rate R.Forbes
    !------------------------------------------------------------------------------------------
    
    USE cuctracer_LOKI_MOD, ONLY: cuctracer_LOKI
    USE cuinin_LOKI_MOD, ONLY: cuinin_LOKI
    USE cuflxn_LOKI_MOD, ONLY: cuflxn_LOKI
    USE cududv_LOKI_MOD, ONLY: cududv_LOKI
    USE cudtdqn_LOKI_MOD, ONLY: cudtdqn_LOKI
    USE cudlfsn_LOKI_MOD, ONLY: cudlfsn_LOKI
    USE cuddrafn_LOKI_MOD, ONLY: cuddrafn_LOKI
    USE cubasen_LOKI_MOD, ONLY: cubasen_LOKI
    USE cuascn_LOKI_MOD, ONLY: cuascn_LOKI
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE MODEL_PHYSICS_ECMWF_MOD, ONLY: MODEL_PHYSICS_ECMWF_TYPE
    USE MODEL_PHYSICS_SIMPLINEAR_MOD, ONLY: MODEL_PHYSICS_SIMPLINEAR_TYPE
    USE YOM_YGFL, ONLY: TYPE_GFLD
    USE YOMCHEM, ONLY: TCHEM
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    USE YOMCST, ONLY: TCST
    USE YOETHF, ONLY: TTHF
    USE SPP_MOD, ONLY: TSPP_CONFIG
    USE SPP_GEN_MOD, ONLY: SPP_PERT
    USE YOMPERTPAR, ONLY: TPERTPAR
    
    IMPLICIT NONE
    
    REAL(KIND=JPRB), INTENT(IN) :: PPLDARE
    REAL(KIND=JPRB), INTENT(IN) :: PPLRG
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(MODEL_PHYSICS_ECMWF_TYPE), INTENT(IN) :: YDML_PHY_EC
    TYPE(TCHEM), INTENT(IN) :: YDCHEM
    TYPE(TSPP_CONFIG), INTENT(IN) :: YDSPP_CONFIG
    TYPE(TPERTPAR), INTENT(IN) :: YDPERTPAR
    TYPE(MODEL_PHYSICS_SIMPLINEAR_TYPE), INTENT(IN) :: YDML_PHY_SLIN
    TYPE(TYPE_GFLD), INTENT(IN) :: YGFL
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KTRAC
    LOGICAL, INTENT(IN) :: LDMCAPEA
    LOGICAL, INTENT(IN) :: LDLAND(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PTSPHY
    REAL(KIND=JPRB), INTENT(IN) :: PLCRIT_AER(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PUEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PLITOT(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVERVEL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQHFL(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAHFS(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PGAW(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PCUCONVCA(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PGP2DSPP(KLON, YDSPP_CONFIG%SM%NRFTOTAL)
    REAL(KIND=JPRB), INTENT(IN) :: PCEN(KLON, KLEV, KTRAC)
    REAL(KIND=JPRB), INTENT(IN) :: PSCAV(KTRAC)
    REAL(KIND=JPRB), INTENT(IN) :: PSCAV0(KTRAC)
    REAL(KIND=JPRB), INTENT(IN) :: PDX(KLON)
    LOGICAL, INTENT(IN) :: LDTDKMF
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENT(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENV(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PTENTA(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PTENQA(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENC(KLON, KLEV, KTRAC)
    LOGICAL, INTENT(OUT) :: LDCUM(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KTYPE(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KCTOP(KLON)
    LOGICAL, INTENT(OUT) :: LDCUM_LIG(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KCBOT_LIG(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KCTOP_LIG(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KBOTSC(KLON)
    LOGICAL, INTENT(OUT) :: LDSC(KLON)
    LOGICAL, INTENT(IN) :: LDSHCV(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PTU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PQU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLUDE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLUDELI(KLON, KLEV, 4)
    REAL(KIND=JPRB), INTENT(OUT) :: PSNDE(KLON, KLEV, 2)
    REAL(KIND=JPRB), INTENT(OUT) :: PENTH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFLXR(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFLXS(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(OUT) :: PRAIN(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PLRAIN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PRSUD(KLON, KLEV, 2)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLGLAC(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUDE_RATE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFDDE_RATE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PCAPE(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PWMEAN(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PVDISCU(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PWU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PDISS(KLON, KLEV)
    
    
    REAL(KIND=JPRB) :: ZTENH(KLON, KLEV), ZQENH(KLON, KLEV), ZTENH2(KLON, KLEV), ZQENH2(KLON, KLEV), ZQSENH(KLON, KLEV),  &
    & ZTD(KLON, KLEV), ZQD(KLON, KLEV), ZMFUS(KLON, KLEV), ZMFDS(KLON, KLEV), ZMFUQ(KLON, KLEV), ZMFDQ(KLON, KLEV),  &
    & ZDMFUP(KLON, KLEV), ZDMFDP(KLON, KLEV), ZMFUL(KLON, KLEV), ZRFL(KLON), ZUU(KLON, KLEV), ZVU(KLON, KLEV), ZUD(KLON, KLEV),  &
    & ZVD(KLON, KLEV), ZKINEU(KLON, KLEV), ZKINED(KLON, KLEV)
    REAL(KIND=JPRB) :: ZMFUB(KLON), ZMFUB1, ZKHVFL(KLON), ZKHFL(KLON), ZDQCV, ZFACCA, ZMFCFL, ZSATFR
    REAL(KIND=JPRB) :: ZDPMEL(KLON, KLEV)
    REAL(KIND=JPRB) :: ZDHPBL(KLON), ZWUBASE(KLON)
    
    REAL(KIND=JPRB) :: ZDMFEN(KLON, KLEV), ZDMFDE(KLON, KLEV), ZDX
    
    INTEGER(KIND=JPIM) :: ILAB(KLON, KLEV), IDTOP(KLON), ICTOP0(KLON)
    INTEGER(KIND=JPIM) :: IDPL(KLON)    ! departure level for convection
    REAL(KIND=JPRB) :: ZCAPE, ZCAPE2, ZHEAT, ZCAPPBL(KLON), ZCAPDCYCL, ZCAPDCYCLLD, ZCAPDCYCLSE
    LOGICAL :: LLDDRAF(KLON), LLDDRAF3(KLON), LLDCUM(KLON), LLSCVFLAG(KLON)
    LOGICAL :: LLO1, LLO2(KLON), LLMIXS, LLO3
    
    INTEGER(KIND=JPIM) :: IKB, IKD, ITOPM2, JK, IK, JL
    
    REAL(KIND=JPRB) :: ZCONS2, ZCONS, ZDH, ZDH2, ZDQMIN, ZDZ, ZEPS, ZFAC, ZMFMAX, ZPBMPT, ZQUMQE, ZRO, ZMFA, ZERATE, ZDERATE,  &
    & ZORCPD, ZRDOCPD, ZDUTEN, ZDVTEN, ZTDIS, ZTAURES, ZAR, ZAS, ZBR, ZBS, ZAK, ZRG, ZIND    !, ZALPHA
    
    REAL(KIND=JPRB) :: ZTAU, ZTAUPBL    ! adjustment time
    REAL(KIND=JPRB) :: ZXTAU
    
    ! A bunch of SPP variables
    LOGICAL :: LLPERT_RTAU    ! SPP perturbation on?
    INTEGER(KIND=JPIM) :: IPRTAU    ! SPP random field pointer
    INTEGER(KIND=JPIM) :: IPN    !  SPP perturbation pointer
    TYPE(SPP_PERT) :: PN1    ! SPP pertn. configs. for RTAU
    
    ! scaling factor for momentum and tracer massflux
    REAL(KIND=JPRB) :: ZMFS(KLON), ZMFUUS(KLON, KLEV), ZMFDUS(KLON, KLEV), ZMFUDR(KLON, KLEV), ZMFDDR(KLON, KLEV),  &
    & ZTENU(KLON, KLEV), ZTENV(KLON, KLEV), ZMFUUB, ZMFUVB, ZMF_SHAL(KLON), ZKMFL(KLON), ZDMFUPC(KLON, KLEV),  &
    & ZDMFDPC(KLON, KLEV), ZUV2(KLON, KLEV), ZSUM12, ZSUM22
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    
#include "fcttre.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    POINTER(IP_ZTENH, ZTENH)
    POINTER(IP_ZQENH, ZQENH)
    POINTER(IP_ZTENH2, ZTENH2)
    POINTER(IP_ZQENH2, ZQENH2)
    POINTER(IP_ZQSENH, ZQSENH)
    POINTER(IP_ZTD, ZTD)
    POINTER(IP_ZQD, ZQD)
    POINTER(IP_ZMFUS, ZMFUS)
    POINTER(IP_ZMFDS, ZMFDS)
    POINTER(IP_ZMFUQ, ZMFUQ)
    POINTER(IP_ZMFDQ, ZMFDQ)
    POINTER(IP_ZDMFUP, ZDMFUP)
    POINTER(IP_ZDMFDP, ZDMFDP)
    POINTER(IP_ZMFUL, ZMFUL)
    POINTER(IP_ZRFL, ZRFL)
    POINTER(IP_ZUU, ZUU)
    POINTER(IP_ZVU, ZVU)
    POINTER(IP_ZUD, ZUD)
    POINTER(IP_ZVD, ZVD)
    POINTER(IP_ZKINEU, ZKINEU)
    POINTER(IP_ZKINED, ZKINED)
    POINTER(IP_ZMFUB, ZMFUB)
    POINTER(IP_ZKHVFL, ZKHVFL)
    POINTER(IP_ZKHFL, ZKHFL)
    POINTER(IP_ZDPMEL, ZDPMEL)
    POINTER(IP_ZDHPBL, ZDHPBL)
    POINTER(IP_ZWUBASE, ZWUBASE)
    POINTER(IP_ZDMFEN, ZDMFEN)
    POINTER(IP_ZDMFDE, ZDMFDE)
    POINTER(IP_ILAB, ILAB)
    POINTER(IP_IDTOP, IDTOP)
    POINTER(IP_ICTOP0, ICTOP0)
    POINTER(IP_IDPL, IDPL)
    POINTER(IP_ZCAPPBL, ZCAPPBL)
    POINTER(IP_LLDDRAF, LLDDRAF)
    POINTER(IP_LLDDRAF3, LLDDRAF3)
    POINTER(IP_LLDCUM, LLDCUM)
    POINTER(IP_LLSCVFLAG, LLSCVFLAG)
    POINTER(IP_LLO2, LLO2)
    POINTER(IP_ZMFS, ZMFS)
    POINTER(IP_ZMFUUS, ZMFUUS)
    POINTER(IP_ZMFDUS, ZMFDUS)
    POINTER(IP_ZMFUDR, ZMFUDR)
    POINTER(IP_ZMFDDR, ZMFDDR)
    POINTER(IP_ZTENU, ZTENU)
    POINTER(IP_ZTENV, ZTENV)
    POINTER(IP_ZMF_SHAL, ZMF_SHAL)
    POINTER(IP_ZKMFL, ZKMFL)
    POINTER(IP_ZDMFUPC, ZDMFUPC)
    POINTER(IP_ZDMFDPC, ZDMFDPC)
    POINTER(IP_ZUV2, ZUV2)
    YLSTACK_L = YDSTACK_L
    IP_ZTENH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQENH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZTENH2 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQENH2 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQSENH = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZTD = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQD = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUQ = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDQ = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDMFUP = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDMFDP = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZRFL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZUU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZVU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZUD = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZVD = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZKINEU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZKINED = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUB = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZKHVFL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZKHFL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDPMEL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDHPBL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZWUBASE = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDMFEN = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDMFDE = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ILAB = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(INT(1, kind=JPIM)) + 7, -3), 3)
    IP_IDTOP = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(INT(1, kind=JPIM)) + 7, -3), 3)
    IP_ICTOP0 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(INT(1, kind=JPIM)) + 7, -3), 3)
    IP_IDPL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(INT(1, kind=JPIM)) + 7, -3), 3)
    IP_ZCAPPBL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_LLDDRAF = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
    IP_LLDDRAF3 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
    IP_LLDCUM = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
    IP_LLSCVFLAG = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
    IP_LLO2 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(LOGICAL(.true.)) + 7, -3), 3)
    IP_ZMFS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUUS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDUS = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFUDR = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMFDDR = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZTENU = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZTENV = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZMF_SHAL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZKMFL = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDMFUPC = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZDMFDPC = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZUV2 = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
!$acc data present( PDX, LDLAND, PTEN, PQEN, PUEN, PVEN, PLITOT, PVERVEL, PQSEN, PQHFL, PAHFS, PAP, PAPH, PGEO, PGEOH, PGAW,  &
!$acc & PCUCONVCA, PGP2DSPP, PTENT, PTENQ, PTENU, PTENV, PTENTA, PTENQA, LDCUM, KTYPE, KCBOT, KCTOP, LDCUM_LIG, KCBOT_LIG,  &
!$acc & KCTOP_LIG, KBOTSC, LDSC, LDSHCV, PLCRIT_AER, PTU, PQU, PLU, PLUDE, PLUDELI, PSNDE, PENTH, PMFLXR, PMFLXS, PRAIN, PLRAIN,  &
!$acc & PRSUD, PMFU, PMFD, PLGLAC, PMFUDE_RATE, PMFDDE_RATE, PCAPE, PWU, PWMEAN, PVDISCU, PDISS, PCEN, PTENC, PSCAV, PSCAV0,  &
!$acc & YDTHF, YDCST, YDML_PHY_SLIN, YDML_PHY_EC, YGFL, YDCHEM, YDSPP_CONFIG, YDPERTPAR )
    
    !---------------------------------------------------------------------
    
    !     1.           SPECIFY CONSTANTS AND PARAMETERS
    !                  --------------------------------
    
    
    ZCONS2 = YDML_PHY_EC%YRECUMF%RMFCFL / (YDCST%RG*PTSPHY)
    ZCONS = 1.0_JPRB / (YDCST%RG*PTSPHY)
    ZORCPD = 1.0_JPRB / YDCST%RCPD
    ZRDOCPD = YDCST%RD*ZORCPD
    ZRG = 1.0_JPRB / YDCST%RG
    ZTAU = 0.0
    
    ! prepare SPP PERTURBATIONS
    IF (YDSPP_CONFIG%LSPP) THEN
      IPN = YDSPP_CONFIG%PPTR%RTAU
      LLPERT_RTAU = IPN > 0
      IF (LLPERT_RTAU) THEN
        PN1 = YDSPP_CONFIG%SM%PN(IPN)
        IPRTAU = PN1%MP
      END IF
      
    ELSE
      LLPERT_RTAU = .false.
    END IF
    
    !----------------------------------------------------------------------
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      PCAPE(JL) = 0.0_JPRB
      PVDISCU(JL) = 0.0_JPRB
      LDCUM(JL) = .false.
    END DO
    
    
    !*    2.           INITIALIZE VALUES AT VERTICAL GRID POINTS IN 'CUINI'
    !                  ---------------------------------------------------
    
    CALL CUININ_LOKI(YDCST, YDTHF, YDML_PHY_SLIN%YREPHLI, YDML_PHY_EC%YRECUMF, KIDIA, KFDIA, KLON, KLEV, PTEN, PQEN, PQSEN,  &
    & PUEN, PVEN, PGEO, PAPH, ILAB, ZTENH, ZQENH, ZQSENH, PGEOH, PTU, PQU, ZTD, ZQD, ZUU, ZVU, ZUD, ZVD, PLU, YDSTACK_L=YLSTACK_L &
    & )
    
    !---------------------------------------------------------------------
    
    !*    3.0          CLOUD BASE CALCULATIONS
    !                  -----------------------
    
    !*             (A) DETERMINE CLOUD BASE VALUES IN 'CUBASE'
    !                  ---------------------------------------
    
    ZKMFL(:) = 0.0_JPRB
    LLMIXS = LDTDKMF
    CALL CUBASEN_LOKI(PPLDARE, PPLRG, YDTHF, YDCST, YDML_PHY_SLIN%YREPHLI, YDML_PHY_EC%YRECLDP, YDML_PHY_EC%YRECUMF,  &
    & YDSPP_CONFIG, KIDIA, KFDIA, KLON, KLEV, YDML_PHY_EC%YRECUMF%NJKT1, LLMIXS, LDTDKMF, ZTENH, ZQENH, PGEOH, PAPH, PQHFL,  &
    & PAHFS, PGP2DSPP, ZKMFL, PTEN, PQEN, PQSEN, PGEO, PTU, PQU, PLU, ZKINEU, ZWUBASE, ILAB, LDCUM, LDSC, KCBOT, KBOTSC, ICTOP0,  &
    & IDPL, PCAPE, YDSTACK_L=YLSTACK_L)
    
    
    !*             (B) DETERMINE TOTAL MOISTURE CONVERGENCE AND
    !*                 DECIDE ON TYPE OF CUMULUS CONVECTION
    !*                 ONE THE BASIS OF THE DEPTH OF THE CONVECTION
    !*                 DEEP IF CLOUD DEPTH > 200MB
    !*                 SHALLOW IF CLOUD DEPTH <200MB
    !                  -----------------------------------------
    
    ! CALCULATE COLUMN AND SUB CLOUD LAYER MOISTURE CONVERGENCE
    ! AND SUB CLOUD LAYER MOIST STATIC ENERGY CONVERGENCE
    
    !DIR$ LOOP_INFO EST_TRIPS(16)
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      ZDHPBL(JL) = 0.0_JPRB
      IDTOP(JL) = 0
      ZCAPPBL(JL) = 0.
      ZKHVFL(JL) = (-PAHFS(JL, KLEV + 1)*ZORCPD - YDCST%RETV*PTEN(JL, KLEV)*PQHFL(JL, KLEV + 1)) / (PPLRG*PPLDARE)
      ZKHFL(JL) = (-PAHFS(JL, KLEV + 1) - YDCST%RLVTT*PQHFL(JL, KLEV + 1)) / (PPLRG*PPLDARE)
!$acc loop seq
      DO JK=YDML_PHY_EC%YRECUMF%NJKT2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LDCUM(JL) .and. JK >= KCBOT(JL)) THEN
          ZDZ = (PAPH(JL, JK + 1) - PAPH(JL, JK))
          ZDHPBL(JL) = ZDHPBL(JL) + (YDCST%RLVTT*PTENQ(JL, JK) + YDCST%RCPD*PTENT(JL, JK))*ZDZ
          ZCAPPBL(JL) = ZCAPPBL(JL) + (PTENT(JL, JK) + YDCST%RETV*PTEN(JL, JK)*PTENQ(JL, JK))*ZDZ
        END IF
      END DO
      
      !*                 ESTIMATE CLOUD HEIGHT FOR ENTRAINMENT/DETRAINMENT
      !*                 CALCULATIONS IN CUASC AND INITIAL DETERMINATION OF
      !*                 CLOUD TYPE
      !*                 (MAX.POSSIBLE CLOUD HEIGHT
      !*                 FOR NON-ENTRAINING PLUME, FOLLOWING A.-S.,1974)
      !                  -------------------------------------------------
      
      
      !*                 SPECIFY INITIAL CLOUD TYPE
      !*
      
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (LDCUM(JL)) THEN
        IKB = KCBOT(JL)
        ITOPM2 = ICTOP0(JL)
        ZPBMPT = PAPH(JL, IKB) - PAPH(JL, ITOPM2)
        IF (ZPBMPT >= YDML_PHY_EC%YRECUMF%RDEPTHS) THEN
          KTYPE(JL) = 1
        ELSE
          KTYPE(JL) = 2
        END IF
      ELSE
        KTYPE(JL) = 0
      END IF
      
      !*             (C) calculate initial updraught mass flux
      !*                 and set lateral mixing rates
      !*
      !*                 for deep convection assume it is 10% of
      !*                 maximum value which is determined by the
      !*                 thickness of the layer and timestep
      !*
      !*                 for shallow convection calculated assuming
      !*                 a balance of moist static energy in the
      !*                 sub-cloud layer (ignores present of downdraughts)
      !                  ------------------------------------------
      
      IF (YDML_PHY_EC%YRECUMF%LMFWSTAR) THEN
        !DIR$ IVDEP
        !OCL NOVREC
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LDCUM(JL)) THEN
          IKB = KCBOT(JL)
          ZDZ = MAX(0.0_JPRB, MIN(1.5E3_JPRB, (PGEOH(JL, IKB) - PGEOH(JL, KLEV + 1)) / YDCST%RG))
          ZMF_SHAL(JL) = 0.07_JPRB*(YDCST%RG / PTEN(JL, KLEV)*ZDZ*MAX(0.0_JPRB, ZKHVFL(JL)))**.3333
          ZMFMAX = (PAPH(JL, IKB) - PAPH(JL, IKB - 1))*ZCONS2
          ZMF_SHAL(JL) = MIN(ZMF_SHAL(JL), ZMFMAX)
        END IF
      END IF
      
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (LDCUM(JL)) THEN
        IKB = KCBOT(JL)
        ZMFMAX = (PAPH(JL, IKB) - PAPH(JL, IKB - 1))*ZCONS2
        
        ! deep convection
        
        IF (KTYPE(JL) == 1) THEN
          ZMFUB(JL) = ZMFMAX*0.1_JPRB
          
        ELSE IF (KTYPE(JL) == 2) THEN
          
          ! shallow convection
          
          ZQUMQE = PQU(JL, IKB) + PLU(JL, IKB) - ZQENH(JL, IKB)
          ZDQMIN = MAX(0.01_JPRB*ZQENH(JL, IKB), 1.E-10_JPRB)
          ZDH = YDCST%RCPD*(PTU(JL, IKB) - ZTENH(JL, IKB)) + YDCST%RLVTT*ZQUMQE
          ZDH = YDCST%RG*MAX(ZDH, 1.E5_JPRB*ZDQMIN)
          IF (ZDHPBL(JL) > 0.0_JPRB) THEN
            ZMFUB(JL) = ZDHPBL(JL) / ZDH
            ZMFUB(JL) = MIN(ZMFUB(JL), ZMFMAX)
          ELSE
            ZMFUB(JL) = ZMFMAX*0.1_JPRB
            LDCUM(JL) = .false.
          END IF
          IF (YDML_PHY_EC%YRECUMF%LMFWSTAR) ZMFUB(JL) = ZMF_SHAL(JL)
        END IF
        
      ELSE
        
        ! no buoyancy cloud base from surface
        ! set cloud base mass flux and mixing rate
        ! to default value for safety
        
        ZMFUB(JL) = 0.0_JPRB
      END IF
    END DO
    
    
    !-----------------------------------------------------------------------
    
    !*    4.0          DETERMINE CLOUD ASCENT FOR ENTRAINING PLUME
    !                  -------------------------------------------
    
    !*             (A) ESTIMATE CLOUD HEIGHT FOR ENTRAINMENT/DETRAINMENT
    !*                 CALCULATIONS IN CUASC (MAX.POSSIBLE CLOUD HEIGHT
    !*                 FOR NON-ENTRAINING PLUME, FOLLOWING A.-S.,1974)
    !                  -------------------------------------------------
    
    ! CALCULATIONS NOW DONE IS SECTION 3 ABOVE SO THAT
    ! INITIAL CLOUD DEPTH CAN BE USED TO SPECIFY
    ! THE TYPE OF CONVECTION
    
    !*             (B) DO ASCENT IN 'CUASC'IN ABSENCE OF DOWNDRAFTS
    !                  --------------------------------------------
    
    CALL CUASCN_LOKI(YDTHF, YDCST, YDML_PHY_SLIN%YREPHLI, YDML_PHY_EC%YRECLDP, YDML_PHY_EC%YRECUMF, YDSPP_CONFIG, YGFL, KIDIA,  &
    & KFDIA, KLON, KLEV, LDTDKMF, PTSPHY, ZTENH, ZQENH, PUEN, PVEN, PTEN, PQEN, PQSEN, PLITOT, PGEO, PGEOH, PAP, PAPH, PVERVEL,  &
    & ZWUBASE, PGP2DSPP, LDLAND, LDCUM, KTYPE, ILAB, LLSCVFLAG, PTU, PQU, PLU, PLRAIN, PMFU, ZMFUB, PLGLAC, ZMFUS, ZMFUQ, ZMFUL,  &
    & PLUDE, PLUDELI, ZDMFUP, PLCRIT_AER, ZDMFEN, KCBOT, KCTOP, ICTOP0, IDPL, PMFUDE_RATE, ZKINEU, PWU, PWMEAN,  &
    & YDSTACK_L=YLSTACK_L)
    
    !*         (C) CHECK CLOUD DEPTH AND CHANGE ENTRAINMENT RATE ACCORDINGLY
    !              CALCULATE PRECIPITATION RATE (FOR DOWNDRAFT CALCULATION)
    !              -----------------------------------------------------
    
    !DIR$ IVDEP
    !OCL NOVREC
    !DIR$ LOOP_INFO EST_TRIPS(16)
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      IF (LDCUM(JL)) THEN
        IKB = KCBOT(JL)
        ITOPM2 = KCTOP(JL)
        ZPBMPT = PAPH(JL, IKB) - PAPH(JL, ITOPM2)
        IF (KTYPE(JL) == 1 .and. ZPBMPT < YDML_PHY_EC%YRECUMF%RDEPTHS) KTYPE(JL) = 2
        IF (KTYPE(JL) == 2 .and. ZPBMPT >= YDML_PHY_EC%YRECUMF%RDEPTHS) KTYPE(JL) = 1
        ICTOP0(JL) = KCTOP(JL)
      END IF
      ZRFL(JL) = ZDMFUP(JL, 1)
!$acc loop seq
      DO JK=2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        ZRFL(JL) = ZRFL(JL) + ZDMFUP(JL, JK)
      END DO
!$acc loop seq
      DO JK=1,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        PMFD(JL, JK) = 0.0_JPRB
        ZMFDS(JL, JK) = 0.0_JPRB
        ZMFDQ(JL, JK) = 0.0_JPRB
        ZDMFDP(JL, JK) = 0.0_JPRB
        ZDPMEL(JL, JK) = 0.0_JPRB
      END DO
      
      ! Needed for dissipation rate and if LMFUVDIS=T
!$acc loop seq
      DO JK=1,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        ZTENU(JL, JK) = PTENU(JL, JK)
        ZTENV(JL, JK) = PTENV(JL, JK)
      END DO
    END DO
    
    
    !-----------------------------------------------------------------------
    
    !*    5.0          CUMULUS DOWNDRAFT CALCULATIONS
    !                  ------------------------------
    
    IF (YDML_PHY_EC%YRECUMF%LMFDD) THEN
      
      !*             (A) DETERMINE LFS IN 'CUDLFS'
      !                  -------------------------
      
      CALL CUDLFSN_LOKI(YDTHF, YDCST, YDML_PHY_SLIN%YREPHLI, YDML_PHY_EC%YRECUMF, KIDIA, KFDIA, KLON, KLEV, KCBOT, KCTOP, LDCUM,  &
      & ZTENH, ZQENH, PTEN, PQSEN, PGEO, PGEOH, PAPH, PTU, PQU, ZMFUB, ZRFL, ZTD, ZQD, PMFD, ZMFDS, ZMFDQ, ZDMFDP, IDTOP,  &
      & LLDDRAF, YDSTACK_L=YLSTACK_L)
      
      !*            (B)  DETERMINE DOWNDRAFT T,Q AND FLUXES IN 'CUDDRAF'
      !                  -----------------------------------------------
      
      CALL CUDDRAFN_LOKI(YDCST, YDTHF, YDML_PHY_SLIN%YREPHLI, YDML_PHY_EC%YRECUMF, KIDIA, KFDIA, KLON, KLEV, LLDDRAF, ZTENH,  &
      & ZQENH, PQSEN, PGEO, PGEOH, PAPH, ZRFL, ZTD, ZQD, PMFU, PMFD, ZMFDS, ZMFDQ, ZDMFDP, ZDMFDE, PMFDDE_RATE, ZKINED,  &
      & YDSTACK_L=YLSTACK_L)
      
    END IF
    
    !-----------------------------------------------------------------------
    
    !*    6.0          CLOSURE
    !                  ------
    
    !*                  RECALCULATE CLOUD BASE MASSFLUX FROM A
    !*                 CAPE CLOSURE FOR DEEP CONVECTION (KTYPE=1)
    !*                 AND BY PBL EQUILIBRUM TAKING DOWNDRAFTS INTO
    !*                 ACCOUNT FOR SHALLOW CONVECTION (KTYPE=2)
    !                  --------------------------------------------
    
    !   DEEP CONVECTION
    
    !DIR$ LOOP_INFO EST_TRIPS(16)
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      ZHEAT = 0.0_JPRB
      ZCAPE = 0.0_JPRB
      ZCAPE2 = 0.0_JPRB
      ZMFUB1 = ZMFUB(JL)
      ZDQCV = 0.0_JPRB
      ZSATFR = 0.0_JPRB
      ZDX = 2*YDCST%RA*SQRT(YDCST%RPI*PGAW(JL))
      ZDX = MAX(ZDX, 1.E2_JPRB)
      
!$acc loop seq
      DO JK=YDML_PHY_EC%YRECUMF%NJKT2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        LLO1 = LDCUM(JL) .and. KTYPE(JL) == 1
        LLO3 = LLO1 .and. JK <= KCBOT(JL) .and. JK > KCTOP(JL)
        IF (LLO3) THEN
          ZDZ = (PGEO(JL, JK - 1) - PGEO(JL, JK))
          IF (LDTDKMF) THEN
            ZHEAT = ZHEAT + ((PTEN(JL, JK - 1) - PTEN(JL, JK) + ZDZ*ZORCPD) / ZTENH(JL, JK) + YDCST%RETV*(PQEN(JL, JK - 1) -  &
            & PQEN(JL, JK)))*(YDCST%RG*(PMFU(JL, JK) + PMFD(JL, JK)))
          ELSE
            ZHEAT = ZHEAT + MAX(0.0_JPRB, ((PTEN(JL, JK - 1) - PTEN(JL, JK) + ZDZ*ZORCPD) / ZTENH(JL, JK) + YDCST%RETV*(PQEN(JL,  &
            & JK - 1) - PQEN(JL, JK)))*(YDCST%RG*(PMFU(JL, JK) + PMFD(JL, JK))))
          END IF
          ZDZ = (PAP(JL, JK) - PAP(JL, JK - 1))
          ZCAPE =  &
          & ZCAPE + ((PTU(JL, JK) - ZTENH(JL, JK)) / ZTENH(JL, JK) + YDCST%RETV*(PQU(JL, JK) - ZQENH(JL, JK)) - PLU(JL, JK))*ZDZ            ! -PLRAIN(JL,JK) not added
        END IF
        IF (LLO3 .and. YDML_PHY_EC%YRECUMF%RCAPQADV > 0.0_JPRB) THEN
          ZTENH2(JL, JK) = ZTENH(JL, JK) - 0.5_JPRB*(PTENTA(JL, JK) + PTENTA(JL, JK - 1))*PTSPHY
          ZQENH2(JL, JK) = ZQENH(JL, JK) - 0.5_JPRB*(PTENQA(JL, JK) + PTENQA(JL, JK - 1))*PTSPHY
          ZCAPE2 = ZCAPE2 + ((PTU(JL, JK) - ZTENH2(JL, JK)) / ZTENH2(JL, JK) + YDCST%RETV*(PQU(JL, JK) - ZQENH2(JL, JK)) -  &
          & PLU(JL, JK))*ZDZ            ! -ZLRAIN(JL,JK) not added
        END IF
        ! IF(LLO1.AND.JK > KCTOP(JL)) THEN
        IF (LLO1) THEN
          ZDZ = (PAPH(JL, JK + 1) - PAPH(JL, JK))
          ZDQCV = ZDQCV + PTENQA(JL, JK)*ZDZ*(PQEN(JL, JK) / PQSEN(JL, JK))
          ! ZMFA=2.5_JPRB/MAX(2.5_JPRB,-PVERVEL(JL,JK))*PQSEN(JL,JK)/ZDX(JL)
          ! ZDQCV(JL)=ZDQCV(JL)+MIN(ZMFA,PTENQA(JL,JK))*ZDZ*(PQEN(JL,JK)/PQSEN(JL,JK))
        END IF
        IF (LLO1 .and. JK >= KCTOP(JL)) THEN
          ZDZ = (PAPH(JL, JK + 1) - PAPH(JL, JK))
          ZSATFR = ZSATFR + (PQEN(JL, JK) / PQSEN(JL, JK))*ZDZ
        END IF
      END DO
      ! time scale and subcloud contribution to CAPE to be substracted for better diurnal cycle over land
      !DIR$ LOOP_INFO EST_TRIPS(16)
      ZCAPDCYCL = 0.0_JPRB
      ZTAU = 0.0_JPRB
      IF (LDTDKMF) THEN
        ZDX = PDX(JL)
        ZDX = MAX(ZDX, 1.E2_JPRB)
      END IF
      !! CFL limit as function of resolution used in DWD ICON model
      ! ZMFCFL(JL) = 2._JPRB*MIN(2._JPRB,1._JPRB + 2.5E-5_JPRB*ZDX(JL))
      IF (LDCUM(JL) .and. KTYPE(JL) == 1) THEN
        IF (YDML_PHY_EC%YRECUMF%LNEWTAU) THEN
          ZTAURES = YDML_PHY_EC%YRECUMF%RTAULIM*(1._JPRB + YDML_PHY_EC%YRECUMF%RTAUFAC / ((ZDX / 1000._JPRB -  &
          & YDML_PHY_EC%YRECUMF%RXMIN + 1._JPRB)**2))
        ELSE
          ZTAURES = 1.0_JPRB + 1.60_JPRB*ZDX / 125.E3_JPRB
          ! for the 10-1 km resolution range increase ZTAURES
          IF (ZDX < 8.E3_JPRB) THEN
            ZTAURES = 1.0_JPRB + LOG(8.E3_JPRB / ZDX)**2
          END IF
        END IF
        IF (ZDX > 125.E3_JPRB) ZTAURES = MIN(3.0_JPRB, ZTAURES)
        
        IKD = IDPL(JL)
        IKB = KCBOT(JL)
        IK = KCTOP(JL)
        ZTAU =  &
        & (PGEOH(JL, IK) - PGEOH(JL, IKB)) / ((2.0_JPRB + MIN(15.0_JPRB, PWMEAN(JL)))*YDCST%RG)*ZTAURES*YDML_PHY_EC%YRECUMF%RTAUA
        IF (YDSPP_CONFIG%LSPP .and. LLPERT_RTAU) THEN
          ZXTAU = ZTAU*EXP(PN1%MU(1) + PN1%XMAG(1)*PGP2DSPP(JL, IPRTAU))
        ELSE
          ZXTAU = ZTAU
        END IF
        
        LLO1 = PAPH(JL, KLEV + 1) - PAPH(JL, IKD) < 50.E2_JPRB
        IF (LLO1 .and. LDLAND(JL) .and. YDML_PHY_EC%YRECUMF%RCAPDCYCL == 1.0_JPRB) THEN
          ZDZ = MIN(1.E4_JPRB, PGEOH(JL, IKB) - PGEOH(JL, KLEV + 1)) / YDCST%RG
          ZCAPDCYCL = ZXTAU*MAX(0.0_JPRB, ZKHVFL(JL))*YDCST%RCPD / ZDZ
        END IF
        IF (LLO1 .and. YDML_PHY_EC%YRECUMF%RCAPDCYCL == 2.0_JPRB) THEN
          ZIND = MAX(0._JPRB, MIN(1._JPRB, (YDML_PHY_EC%YRECUMF%RDXMAX - ZDX) / (YDML_PHY_EC%YRECUMF%RDXMAX -  &
          & YDML_PHY_EC%YRECUMF%RDXMIN)))
          IF (LDLAND(JL)) ZIND = 1._JPRB
          ZCAPDCYCLLD = ZCAPPBL(JL)*ZTAU / ZTAURES
          ZDUTEN = 2.0_JPRB + SQRT(0.5*(PUEN(JL, IKB)**2 + PVEN(JL, IKB)**2 + PUEN(JL, YDML_PHY_EC%YRECUMF%NJKT3)**2 + PVEN(JL,  &
          & YDML_PHY_EC%YRECUMF%NJKT3)**2))
          ZTAUPBL = MIN(1.E4_JPRB, PGEOH(JL, IKB) - PGEOH(JL, KLEV + 1)) / (YDCST%RG*ZDUTEN)
          ZCAPDCYCLSE = ZCAPPBL(JL)*ZTAUPBL
          ZCAPDCYCL = ZIND*ZCAPDCYCLLD + (1._JPRB - ZIND)*ZCAPDCYCLSE
        END IF
        
        ZDQCV = ZDQCV*YDCST%RLVTT / PGEOH(JL, IK)*ZXTAU / MAX(1.25_JPRB, ZTAURES)*YDML_PHY_EC%YRECUMF%RCAPQADV
        ZSATFR = ZSATFR / (PAPH(JL, KLEV + 1) - PAPH(JL, IK))
        
      ELSE
        ZTAU = 0.0_JPRB
      END IF
      
      IF (YDML_PHY_EC%YRECUMF%LMFCUCA) THEN
        !only allow cloud base mass flux to vary by certain amount
        !DIR$ LOOP_INFO EST_TRIPS(16)
        ZFACCA = MAX(0.3_JPRB, MIN(1.8_JPRB, PCUCONVCA(JL)))
      ELSE
        ZFACCA = 1.0_JPRB
      END IF
      
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (LDCUM(JL) .and. KTYPE(JL) == 1) THEN
        IKB = KCBOT(JL)
        ZCAPE2 = YDML_PHY_EC%YRECUMF%RCAPQADV*ZCAPE2 + (1.0_JPRB - YDML_PHY_EC%YRECUMF%RCAPQADV)*ZCAPE
        ZCAPDCYCL = MAX(ZCAPDCYCL, -2*ZCAPE2)
        IF (ZSATFR <= 0.94 .or. PVERVEL(JL, YDML_PHY_EC%YRECUMF%NJKT5) < -100._JPRB) THEN
          ZCAPE = MAX(YDML_PHY_EC%YRECUMF%RMINCAPE*ZCAPE, ZCAPE2 - ZCAPDCYCL + ZDQCV)
        ELSE
          ZCAPE = MAX(YDML_PHY_EC%YRECUMF%RMINCAPE*ZCAPE, ZCAPE - ZCAPDCYCL)
        END IF
        ZCAPE = MIN(ZCAPE, 5000.0_JPRB)
        ZHEAT = MAX(1.E-4_JPRB, ZHEAT)
        !    ZXTAU(JL)=MAX(720._JPRB,ZXTAU(JL))
        ZXTAU = MAX(3.6E3_JPRB / (5.0_JPRB*PPLRG*PPLDARE), MIN(3.0_JPRB*3.6E3_JPRB / (PPLRG*PPLDARE), ZXTAU))
        ZMFUB1 = (ZCAPE*ZMFUB(JL)) / (ZHEAT*ZXTAU)
        ZMFUB1 = MAX(ZMFUB1, 0.001_JPRB)*ZFACCA
        ZMFMAX = (PAPH(JL, IKB) - PAPH(JL, IKB - 1))*ZCONS2
        ZMFUB1 = MIN(ZMFUB1, ZMFMAX)
      END IF
      
      IF (LDMCAPEA) THEN
        ! Prefer ZCAPE computed from real CUASCN updraft rather than PCAPE estimated from CUBASEN.
        PCAPE(JL) = YDCST%RG*ZCAPE
      END IF
      
      !  SHALLOW CONVECTION AND MID_LEVEL
      
      !DIR$ IVDEP
      !OCL NOVREC
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (LDCUM(JL) .and. KTYPE(JL) >= 2) THEN
        IKB = KCBOT(JL)
        IF (PMFD(JL, IKB) < 0.0_JPRB) THEN
          ZEPS = -PMFD(JL, IKB) / MAX(ZMFUB(JL), 1.E-10_JPRB)
        ELSE
          ZEPS = 0.0_JPRB
        END IF
        ! maximum permissible value of ud base mass flux
        ZMFMAX = (PAPH(JL, IKB) - PAPH(JL, IKB - 1))*ZCONS2
        
        ! shallow convection
        
        IF (KTYPE(JL) == 2) THEN
          IF (ZDHPBL(JL) > 0.0_JPRB) THEN
            ZQUMQE = PQU(JL, IKB) + PLU(JL, IKB) - ZEPS*ZQD(JL, IKB) - (1.0_JPRB - ZEPS)*ZQENH(JL, IKB)
            ZDH = YDCST%RCPD*(PTU(JL, IKB) - ZEPS*ZTD(JL, IKB) - (1.0_JPRB - ZEPS)*ZTENH(JL, IKB)) + YDCST%RLVTT*ZQUMQE
            ZDH2 =  &
            & YDCST%RCPD*(PTU(JL, IKB - 1) - ZEPS*ZTD(JL, IKB - 1) - (1.0_JPRB - ZEPS)*ZTENH(JL, IKB - 1)) + YDCST%RLVTT*ZQUMQE
            ZDH = 0.5_JPRB*(ZDH + ZDH2)
            ZDH = YDCST%RG*MAX(ZDH, 0.1_JPRB*YDCST%RCPD)
            ZMFUB1 = ZDHPBL(JL) / ZDH
            IF (.not.LDTDKMF) THEN
              IF (ZMFUB1 > 0.9_JPRB*ZMFMAX / YDML_PHY_EC%YRECUMF%RMFCFL .and. ZDH < 0.5_JPRB*YDCST%RG*YDCST%RCPD) THEN
                ZDH = 0.75_JPRB*YDCST%RCPD*YDCST%RG
                ZMFUB1 = ZDHPBL(JL) / ZDH
              END IF
            END IF
          ELSE
            ZMFUB1 = ZMFUB(JL)
          END IF
          IF (YDML_PHY_EC%YRECUMF%LMFWSTAR) ZMFUB1 = ZMF_SHAL(JL)
          ZMFUB1 = MIN(ZMFUB1, ZMFMAX)
        END IF
        
        ! mid-level convection
        
        IF (KTYPE(JL) == 3) THEN
          IF (LDTDKMF) THEN
            ZMFUB1 = MAX(ZMFUB(JL), ZKHFL(JL) / PGEOH(JL, IKB))*(1.0_JPRB + ZEPS)
          ELSE
            ZMFUB1 = MAX(ZMFUB(JL), 5*ZKHFL(JL) / PGEOH(JL, IKB))*(1.0_JPRB + ZEPS)
          END IF
          IF (PGEOH(JL, IKB) < 1.5E3_JPRB) THEN
            ZMFUB1 = MIN(ZMFUB1, ZMFMAX / (1.05_JPRB*YDML_PHY_EC%YRECUMF%RMFCFL))
          ELSE
            ZMFUB1 = MIN(ZMFUB1, ZMFMAX)
          END IF
        END IF
        
      END IF
      
      ! rescale DD fluxes if deep and shallow convection
      
!$acc loop seq
      DO JK=1,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LLDDRAF(JL) .and. (KTYPE(JL) == 1 .or. KTYPE(JL) == 2)) THEN
          ZFAC = ZMFUB1 / MAX(ZMFUB(JL), 1.E-10_JPRB)
          PMFD(JL, JK) = PMFD(JL, JK)*ZFAC
          ZMFDS(JL, JK) = ZMFDS(JL, JK)*ZFAC
          ZMFDQ(JL, JK) = ZMFDQ(JL, JK)*ZFAC
          ZDMFDP(JL, JK) = ZDMFDP(JL, JK)*ZFAC
          !  also rescale detrainment flux for ERA pp
          PMFDDE_RATE(JL, JK) = PMFDDE_RATE(JL, JK)*ZFAC
        END IF
      END DO
      
      !-----------------------------------------------------------------------
      
      !*    6.2          FINAL CLOSURE=SCALING
      !                  ---------------------
      
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (LDCUM(JL)) THEN
        ZMFS(JL) = ZMFUB1 / MAX(YDML_PHY_EC%YRECUMF%RMFCMIN, ZMFUB(JL))
      END IF
!$acc loop seq
      DO JK=2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
          IKB = KCBOT(JL)
          IF (JK > IKB) THEN
            ZDZ = ((PAPH(JL, KLEV + 1) - PAPH(JL, JK)) / (PAPH(JL, KLEV + 1) - PAPH(JL, IKB)))
            PMFU(JL, JK) = PMFU(JL, IKB)*ZDZ
          END IF
          ZMFMAX = (PAPH(JL, JK) - PAPH(JL, JK - 1))*ZCONS2            !*zmfcfl(jl)/rmfcfl
          IF (.not.LDTDKMF) ZMFMAX = MIN(ZMFMAX, YDML_PHY_EC%YRECUMF%RMFLIA)
          IF (PMFU(JL, JK)*ZMFS(JL) > ZMFMAX) THEN
            ZMFS(JL) = MIN(ZMFS(JL), ZMFMAX / PMFU(JL, JK))
            ZMFS(JL) = MAX(ZMFS(JL), 1.E-10_JPRB)
          END IF
        END IF
      END DO
      
      !test additionally on divergence limit in case of direct Dynamics coupling
      IF (YDML_PHY_EC%YRECUMF%RMFADVW > 0.0_JPRB) THEN
!$acc loop seq
        DO JK=2,KLEV - 1
          IF (KTYPE(JL) == 1 .and. JK >= -1 + KCTOP(JL)) THEN
            ZFAC = ZMFS(JL)*YDCST%RG*YDML_PHY_EC%YRECUMF%RMFADVW*(PMFU(JL, JK) - PMFU(JL, JK + 1) +  &
            & YDML_PHY_EC%YRECUMF%RMFADVWDD*(PMFD(JL, JK) - PMFD(JL, JK + 1))) / (PAPH(JL, JK) - PAPH(JL, JK + 1))*PTSPHY
            IF (ABS(ZFAC) > 0.98_JPRB) ZMFS(JL) = ZMFS(JL) / MAX(1.02_JPRB, ABS(ZFAC))
          END IF
        END DO
        JK = KLEV
        IF (KTYPE(JL) == 1) THEN
          ZFAC = ZMFS(JL)*YDCST%RG*YDML_PHY_EC%YRECUMF%RMFADVW*(PMFU(JL, JK) + YDML_PHY_EC%YRECUMF%RMFADVWDD*PMFD(JL, JK)) /  &
          & (PAPH(JL, JK) - PAPH(JL, JK + 1))*PTSPHY
          IF (ABS(ZFAC) > 0.98_JPRB) ZMFS(JL) = ZMFS(JL) / MAX(1.02_JPRB, ABS(ZFAC))
        END IF
      END IF
      
!$acc loop seq
      DO JK=2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LDCUM(JL) .and. JK <= KCBOT(JL) .and. JK >= -1 + KCTOP(JL)) THEN
          PMFU(JL, JK) = PMFU(JL, JK)*ZMFS(JL)
          ZMFUS(JL, JK) = ZMFUS(JL, JK)*ZMFS(JL)
          ZMFUQ(JL, JK) = ZMFUQ(JL, JK)*ZMFS(JL)
          ZMFUL(JL, JK) = ZMFUL(JL, JK)*ZMFS(JL)
          ZDMFUP(JL, JK) = ZDMFUP(JL, JK)*ZMFS(JL)
          ZDMFEN(JL, JK) = ZDMFEN(JL, JK)*ZMFS(JL)
          PLUDE(JL, JK) = PLUDE(JL, JK)*ZMFS(JL)
          PLUDELI(JL, JK, 1) = PLUDELI(JL, JK, 1)*ZMFS(JL)
          PLUDELI(JL, JK, 2) = PLUDELI(JL, JK, 2)*ZMFS(JL)
          PMFUDE_RATE(JL, JK) = PMFUDE_RATE(JL, JK)*ZMFS(JL)
        END IF
      END DO
      
      !-----------------------------------------------------------------------
      
      !*    6.5          IN CASE THAT EITHER DEEP OR SHALLOW IS SWITCHED OFF
      !                  RESET LDCUM TO FALSE-> FLUXES SET TO ZERO IN CUFLXN
      !                  ---------------------------------------------------
      
      !                 exclude pathological KTYPE=2 KCBOT=KCTOP=KLEV-1
      
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (KTYPE(JL) == 2 .and. KCBOT(JL) == KCTOP(JL) .and. KCBOT(JL) >= -1 + KLEV) THEN
        LDCUM(JL) = .false.
        KTYPE(JL) = 0
      END IF
      
      !                  turn off shallow convection if stratocumulus PBL type
      !DIR$ LOOP_INFO EST_TRIPS(16)
      LLO2(JL) = .false.
      IF (.not.LDSHCV(JL) .and. KTYPE(JL) == 2) THEN
        LLO2(JL) = .true.
        LDCUM(JL) = .false.
      END IF
      
      
      !DIR$ LOOP_INFO EST_TRIPS(16)
      ! The following is needed to allow lightning calculations in case deep convection
      ! is treated explicitly (i.e. when LMFPEN=false).
      ! Store convection flag.
      LDCUM_LIG(JL) = LDCUM(JL)
      ! Store convective cloud top and bottom levels.
      KCTOP_LIG(JL) = KCTOP(JL)
      KCBOT_LIG(JL) = KCBOT(JL)
      
      IF (.not.YDML_PHY_EC%YRECUMF%LMFSCV .or. .not.YDML_PHY_EC%YRECUMF%LMFPEN) THEN
        !DIR$ LOOP_INFO EST_TRIPS(16)
        ! LLO2(JL)=.FALSE.
        IF (.not.YDML_PHY_EC%YRECUMF%LMFSCV .and. KTYPE(JL) == 2 .or. .not.YDML_PHY_EC%YRECUMF%LMFPEN .and. KTYPE(JL) == 1) THEN
          LLO2(JL) = .true.
          LDCUM(JL) = .false.
        END IF
      END IF
      
      !-----------------------------------------------------------------------
      
      !*    7.0          DETERMINE FINAL CONVECTIVE FLUXES IN 'CUFLX'
      !                  ------------------------------------------
      
      !- set DD mass fluxes to zero above cloud top
      !  (because of inconsistency with second updraught)
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (LLDDRAF(JL) .and. IDTOP(JL) <= KCTOP(JL)) THEN
        IDTOP(JL) = KCTOP(JL) + 1
      END IF
      
!$acc loop seq
      DO JK=2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LLDDRAF(JL)) THEN
          IF (JK < IDTOP(JL)) THEN
            PMFD(JL, JK) = 0.0_JPRB
            ZMFDS(JL, JK) = 0.0_JPRB
            ZMFDQ(JL, JK) = 0.0_JPRB
            PMFDDE_RATE(JL, JK) = 0.0_JPRB
            ZDMFDP(JL, JK) = 0.0_JPRB
          ELSE IF (JK == IDTOP(JL)) THEN
            PMFDDE_RATE(JL, JK) = 0.0_JPRB
          END IF
        END IF
      END DO
    END DO
    
    CALL CUFLXN_LOKI(YDTHF, YDCST, YDML_PHY_SLIN%YREPHLI, YDML_PHY_EC%YRECUMF, KIDIA, KFDIA, KLON, KLEV, PTSPHY, PTEN, PQEN,  &
    & PQSEN, ZTENH, ZQENH, PAPH, PAP, PGEOH, LDLAND, LDCUM, LDTDKMF, KCBOT, KCTOP, IDTOP, ITOPM2, KTYPE, LLDDRAF, PMFU, PMFD,  &
    & ZMFUS, ZMFDS, ZMFUQ, ZMFDQ, ZMFUL, PLUDE, PLUDELI, PLRAIN, PSNDE, ZDMFUP, ZDMFDP, ZDPMEL, PLGLAC, PMFLXR, PMFLXS, PRAIN,  &
    & PMFUDE_RATE, PMFDDE_RATE, YDSTACK_L=YLSTACK_L)
    
    !- correct DD detrainment rates if entrainment becomes negative
    !- correct UD detrainment rates if entrainment becomes negative
    !- conservation correction for precip
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
!$acc loop seq
      DO JK=2,KLEV - 1
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LLDDRAF(JL) .and. JK >= -1 + IDTOP(JL)) THEN
          ZERATE = -PMFD(JL, JK) + PMFD(JL, JK - 1) + PMFDDE_RATE(JL, JK)
          IF (ZERATE < 0.0_JPRB) THEN
            PMFDDE_RATE(JL, JK) = PMFDDE_RATE(JL, JK) - ZERATE
          END IF
        END IF
        IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
          ZERATE = PMFU(JL, JK) - PMFU(JL, JK + 1) + PMFUDE_RATE(JL, JK)
          IF (ZERATE < 0.0_JPRB) THEN
            PMFUDE_RATE(JL, JK) = PMFUDE_RATE(JL, JK) - ZERATE
          END IF
          ! ZDMFUP(JL,JK)=ZDMFUP(JL,JK)+ZDMFDP(JL,JK)
          ZDMFUP(JL, JK) = PMFLXR(JL, JK + 1) + PMFLXS(JL, JK + 1) - PMFLXR(JL, JK) - PMFLXS(JL, JK)
          ZDMFDP(JL, JK) = 0.0_JPRB
        END IF
      END DO
      
      ! avoid negative humidities at ddraught top
      !DIR$ LOOP_INFO EST_TRIPS(16)
      IF (LLDDRAF(JL)) THEN
        JK = IDTOP(JL)
        IK = MIN(JK + 1, KLEV)
        IF (ZMFDQ(JL, JK) < 0.3_JPRB*ZMFDQ(JL, IK)) THEN
          IF (YDML_PHY_EC%YRECUMF%RMFSOLTQ == 0.0_JPRB) THEN
            ZMFDQ(JL, JK) = 0.3_JPRB*ZMFDQ(JL, IK)
          ELSE
            PMFD(JL, JK) = 0.3_JPRB*PMFD(JL, IK)
          END IF
        END IF
      END IF
      
      ! avoid negative humidities near cloud top because gradient of precip flux
      ! and detrainment / liquid water flux too large
!$acc loop seq
      DO JK=2,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL) .and. JK < KCBOT(JL)) THEN
          ZDZ = PTSPHY*YDCST%RG / (PAPH(JL, JK + 1) - PAPH(JL, JK))
          ZMFA = ZMFUQ(JL, JK + 1) + ZMFDQ(JL, JK + 1) - ZMFUQ(JL, JK) - ZMFDQ(JL, JK) + ZMFUL(JL, JK + 1) - ZMFUL(JL, JK) +  &
          & ZDMFUP(JL, JK) - PSNDE(JL, JK, 1) - PSNDE(JL, JK, 2)
          ZMFA = (ZMFA - PLUDE(JL, JK))*ZDZ
          IF (PQEN(JL, JK) + ZMFA < 0.0_JPRB .and. PLUDE(JL, JK) > 0.0_JPRB) THEN
            ZFAC = MIN(-(PQEN(JL, JK) + ZMFA) / ZDZ, PLUDE(JL, JK))
            PLUDE(JL, JK) = PLUDE(JL, JK) + ZFAC
            PLUDELI(JL, JK, 1) = PLUDELI(JL, JK, 1) + ZFAC*PLUDELI(JL, JK, 1) / PLUDE(JL, JK)
            PLUDELI(JL, JK, 2) = PLUDELI(JL, JK, 2) + ZFAC*PLUDELI(JL, JK, 2) / PLUDE(JL, JK)
          END IF
          IF (PLUDE(JL, JK) < 0.0_JPRB) THEN
            PLUDE(JL, JK) = 0.0_JPRB
            PLUDELI(JL, JK, 1) = 0.0_JPRB
            PLUDELI(JL, JK, 2) = 0.0_JPRB
          END IF
        END IF
        IF (.not.LDCUM(JL)) THEN
          PMFUDE_RATE(JL, JK) = 0.0_JPRB
        END IF
        IF (PMFD(JL, -1 + JK) == 0.0_JPRB) THEN
          PMFDDE_RATE(JL, JK) = 0.0_JPRB
        END IF
      END DO
      !----------------------------------------------------------------------
      
      !*    8.0          UPDATE TENDENCIES FOR T AND Q IN SUBROUTINE CUDTDQ
      !                  --------------------------------------------------
      
      IF (YDML_PHY_EC%YRECUMF%RMFSOLTQ > 0.0_JPRB) THEN
        ! derive draught properties for implicit
        
!$acc loop seq
        DO JK=KLEV,2,-1
          !DIR$ LOOP_INFO EST_TRIPS(16)
          IF (LDCUM(JL)) THEN
            IF (JK > KCBOT(JL)) THEN
              ZMFA = 1.0_JPRB / MAX(1.E-15_JPRB, PMFU(JL, JK))
              PQU(JL, JK) = ZQENH(JL, JK) + ZMFUQ(JL, JK)*ZMFA
              PTU(JL, JK) = ZTENH(JL, JK) + ZMFUS(JL, JK)*ZMFA*ZORCPD
              ZMFUS(JL, JK) = PMFU(JL, JK)*(YDCST%RCPD*PTU(JL, JK) + PGEOH(JL, JK))
              ZMFUQ(JL, JK) = PMFU(JL, JK)*PQU(JL, JK)
              IF (LLDDRAF(JL)) THEN
                ZMFA = 1.0_JPRB / MIN(-1.E-15_JPRB, PMFD(JL, JK))
                ZQD(JL, JK) = ZQENH(JL, JK) + ZMFDQ(JL, JK)*ZMFA
                ZTD(JL, JK) = ZTENH(JL, JK) + ZMFDS(JL, JK)*ZMFA*ZORCPD
                ZMFDQ(JL, JK) = PMFD(JL, JK)*ZQD(JL, JK)
                ZMFDS(JL, JK) = PMFD(JL, JK)*(YDCST%RCPD*ZTD(JL, JK) + PGEOH(JL, JK))
              END IF
            ELSE IF (JK <= KCBOT(JL) .and. JK >= KCTOP(JL)) THEN
              ZMFUS(JL, JK) = PMFU(JL, JK)*(YDCST%RCPD*PTU(JL, JK) + PGEOH(JL, JK))
              ZMFUQ(JL, JK) = PMFU(JL, JK)*PQU(JL, JK)
              ZMFDS(JL, JK) = PMFD(JL, JK)*(YDCST%RCPD*ZTD(JL, JK) + PGEOH(JL, JK))
              ZMFDQ(JL, JK) = PMFD(JL, JK)*ZQD(JL, JK)
            END IF
          END IF
        END DO
        
      END IF
    END DO
    
    
    CALL CUDTDQN_LOKI(YDTHF, YDCST, YDML_PHY_SLIN%YREPHLI, YDML_PHY_SLIN%YRPHNC, YDML_PHY_EC%YRECUMF, YDML_PHY_EC%YREPHY, KIDIA,  &
    & KFDIA, KLON, KLEV, ITOPM2, KTYPE, KCTOP, KCBOT, IDTOP, LDTDKMF, LDCUM, LLDDRAF, LLSCVFLAG, PTSPHY, PAPH, PAP, PGEOH, PGEO,  &
    & PTEN, ZTENH, PQEN, ZQENH, PQSEN, PLGLAC, PLUDE, PLUDELI, PSNDE, PMFU, PMFD, ZMFUS, ZMFDS, ZMFUQ, ZMFDQ, ZMFUL, ZDMFUP,  &
    & ZDPMEL, PMFLXR, PMFLXS, PTENT, PTENQ, PENTH, YDSTACK_L=YLSTACK_L)
    
    !----------------------------------------------------------------------
    
    !*    9.0          COMPUTE MOMENTUM IN UPDRAUGHT AND DOWNDRAUGHT
    !                  ---------------------------------------------
    
    IF (YDML_PHY_EC%YRECUMF%LMFDUDV) THEN
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
!$acc loop seq
        DO JK=KLEV - 1,2,-1
          IK = JK + 1
          !DIR$ LOOP_INFO EST_TRIPS(16)
          IF (LDCUM(JL)) THEN
            IF (JK == KCBOT(JL) .and. KTYPE(JL) < 3) THEN
              IKB = IDPL(JL)
              ZUU(JL, JK) = PUEN(JL, IKB - 1)
              ZVU(JL, JK) = PVEN(JL, IKB - 1)
            ELSE IF (JK == KCBOT(JL) .and. KTYPE(JL) == 3) THEN
              ZUU(JL, JK) = PUEN(JL, JK - 1)
              ZVU(JL, JK) = PVEN(JL, JK - 1)
            END IF
            IF (JK < KCBOT(JL) .and. JK >= KCTOP(JL)) THEN
              ZFAC = 0.0_JPRB
              IF (LDTDKMF .and. (KTYPE(JL) == 1 .or. KTYPE(JL) == 3)) ZFAC = 2.0_JPRB
              ! IF(KTYPE(JL)==2) ZFAC=1.0_JPRB
              ZERATE = PMFU(JL, JK) - PMFU(JL, IK) + (1.0_JPRB + ZFAC)*PMFUDE_RATE(JL, JK)
              ZDERATE = (1.0_JPRB + ZFAC)*PMFUDE_RATE(JL, JK)
              ZMFA = 1.0_JPRB / MAX(YDML_PHY_EC%YRECUMF%RMFCMIN, PMFU(JL, JK))
              ZUU(JL, JK) = (ZUU(JL, IK)*PMFU(JL, IK) + ZERATE*PUEN(JL, JK) - ZDERATE*ZUU(JL, IK))*ZMFA
              ZVU(JL, JK) = (ZVU(JL, IK)*PMFU(JL, IK) + ZERATE*PVEN(JL, JK) - ZDERATE*ZVU(JL, IK))*ZMFA
            END IF
          END IF
        END DO
!$acc loop seq
        DO JK=3,KLEV
          IK = JK - 1
          !DIR$ LOOP_INFO EST_TRIPS(16)
          IF (LDCUM(JL)) THEN
            IF (JK == IDTOP(JL)) THEN
              ZUD(JL, JK) = 0.5_JPRB*(ZUU(JL, JK) + PUEN(JL, IK))
              ZVD(JL, JK) = 0.5_JPRB*(ZVU(JL, JK) + PVEN(JL, IK))
            ELSE IF (JK > IDTOP(JL)) THEN
              ZERATE = -PMFD(JL, JK) + PMFD(JL, IK) + PMFDDE_RATE(JL, JK)
              ZMFA = 1.0_JPRB / MIN(-YDML_PHY_EC%YRECUMF%RMFCMIN, PMFD(JL, JK))
              ZUD(JL, JK) = (ZUD(JL, IK)*PMFD(JL, IK) - ZERATE*PUEN(JL, IK) + PMFDDE_RATE(JL, JK)*ZUD(JL, IK))*ZMFA
              ZVD(JL, JK) = (ZVD(JL, IK)*PMFD(JL, IK) - ZERATE*PVEN(JL, IK) + PMFDDE_RATE(JL, JK)*ZVD(JL, IK))*ZMFA
            END IF
          END IF
        END DO
        
        !*    9.1          UPDATE TENDENCIES FOR U AND V IN SUBROUTINE CUDUDV
        !                  --------------------------------------------------
        
        ! for explicit/semi-implicit rescale massfluxes for stability in Momentum
        !------------------------------------------------------------------------
        
        ZMFS(:) = 1.0_JPRB
        ! IF(RMFSOLUV<=0.5_JPRB) THEN
        IF (YDML_PHY_EC%YRECUMF%RMFSOLUV <= 1.0_JPRB) THEN
!$acc loop seq
          DO JK=2,KLEV
            !DIR$ LOOP_INFO EST_TRIPS(16)
            IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
              ZMFMAX = (PAPH(JL, JK) - PAPH(JL, JK - 1))*ZCONS
              IF (PMFU(JL, JK) > ZMFMAX .and. JK >= KCTOP(JL)) ZMFS(JL) = MIN(ZMFS(JL), ZMFMAX / PMFU(JL, JK))
            END IF
          END DO
        END IF
!$acc loop seq
        DO JK=1,KLEV
          !DIR$ LOOP_INFO EST_TRIPS(16)
          ZMFUUS(JL, JK) = PMFU(JL, JK)
          ZMFDUS(JL, JK) = PMFD(JL, JK)
          IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
            ZMFUUS(JL, JK) = PMFU(JL, JK)*ZMFS(JL)
            ZMFDUS(JL, JK) = PMFD(JL, JK)*ZMFS(JL)
          END IF
        END DO
        
        ! recompute Draught properties below for Implicit
        ! based on linear flux profiles
        
        IF (YDML_PHY_EC%YRECUMF%RMFSOLUV > 0.0_JPRB) THEN
          
          !DIR$ LOOP_INFO EST_TRIPS(16)
          IF (LDCUM(JL)) THEN
            JK = KCBOT(JL)
            IK = JK - 1
            ZMFUUB = ZMFUUS(JL, JK)*(ZUU(JL, JK) - PUEN(JL, IK))
            ZMFUVB = ZMFUUS(JL, JK)*(ZVU(JL, JK) - PVEN(JL, IK))
          END IF
          
!$acc loop seq
          DO JK=2,KLEV
            IK = JK - 1
            !DIR$ LOOP_INFO EST_TRIPS(16)
            IF (LDCUM(JL) .and. JK > KCBOT(JL)) THEN
              IKB = KCBOT(JL)
              ZDZ = ((PAPH(JL, KLEV + 1) - PAPH(JL, JK)) / (PAPH(JL, KLEV + 1) - PAPH(JL, IKB)))
              IF (KTYPE(JL) == 3) THEN
                ZDZ = ZDZ*ZDZ
              END IF
              ZMFA = 1.0_JPRB / MAX(YDML_PHY_EC%YRECUMF%RMFCMIN, ZMFUUS(JL, JK))
              ZUU(JL, JK) = PUEN(JL, IK) + ZMFUUB*ZDZ*ZMFA
              ZVU(JL, JK) = PVEN(JL, IK) + ZMFUVB*ZDZ*ZMFA
              
              ZMFDUS(JL, JK) = ZMFDUS(JL, IKB)*ZDZ
              ZUD(JL, JK) = PUEN(JL, IK) + ZUD(JL, IKB) - PUEN(JL, IKB - 1)
              ZVD(JL, JK) = PVEN(JL, IK) + ZVD(JL, IKB) - PVEN(JL, IKB - 1)
            END IF
            ! add UV perturb to correct wind bias
            IF (LDCUM(JL) .and. JK >= KCTOP(JL)) THEN
              IF (LDTDKMF) THEN
                ZUU(JL, JK) = ZUU(JL, JK) - YDML_PHY_EC%YRECUMF%RUVPER*SIGN(1.0_JPRB, ZUU(JL, JK))
                ZVU(JL, JK) = ZVU(JL, JK) - YDML_PHY_EC%YRECUMF%RUVPER*SIGN(1.0_JPRB, ZVU(JL, JK))
              ELSE
                ZUU(JL, JK) = ZUU(JL, JK) - MIN(ABS(ZUU(JL, JK)), YDML_PHY_EC%YRECUMF%RUVPER)*SIGN(1.0_JPRB, ZUU(JL, JK))
                ZVU(JL, JK) = ZVU(JL, JK) - MIN(ABS(ZVU(JL, JK)), YDML_PHY_EC%YRECUMF%RUVPER)*SIGN(1.0_JPRB, ZVU(JL, JK))
              END IF
            END IF
          END DO
          
        END IF
      END DO
      
      
      !-------------------------------------------------------------------
      ! End
      ! Intermediate Solution for stability in EPS:
      ! For original code replace line
      !  &, PUEN,     PVEN,     ZMFUUS,   ZMFDUS &
      !by
      !  &, PUEN,     PVEN,     PMFU,     PMFD
      
      CALL CUDUDV_LOKI(YDCST, YDML_PHY_EC%YRECUMF, YDSPP_CONFIG, YDPERTPAR, KIDIA, KFDIA, KLON, KLEV, ITOPM2, KTYPE, KCBOT,  &
      & KCTOP, LDCUM, PTSPHY, PAPH, PAP, PUEN, PVEN, ZMFUUS, ZMFDUS, PMFU, PMFD, ZUU, ZUD, ZVU, ZVD, PGP2DSPP, PTENU, PTENV,  &
      & YDSTACK_L=YLSTACK_L)
      
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
        IF (YDML_PHY_EC%YRECUMF%LMFUVDIS) THEN
          ! add KE dissipation
          !DIR$ LOOP_INFO EST_TRIPS(16)
          ZSUM12 = 0.0_JPRB
          ZSUM22 = 0.0_JPRB
!$acc loop seq
          DO JK=1,KLEV
            !DIR$ LOOP_INFO EST_TRIPS(16)
            ZUV2(JL, JK) = 0.0_JPRB
            IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
              ZDZ = (PAPH(JL, JK + 1) - PAPH(JL, JK))
              ZDUTEN = PTENU(JL, JK) - ZTENU(JL, JK)
              ZDVTEN = PTENV(JL, JK) - ZTENV(JL, JK)
              ZUV2(JL, JK) = SQRT(ZDUTEN**2 + ZDVTEN**2)
              ZSUM22 = ZSUM22 + ZUV2(JL, JK)*ZDZ
              ZSUM12 = ZSUM12 - (PUEN(JL, JK)*ZDUTEN + PVEN(JL, JK)*ZDVTEN)*ZDZ
            END IF
          END DO
          ! Store vertically integrated dissipation rate (W m-2)
          !DIR$ LOOP_INFO EST_TRIPS(16)
          PVDISCU(JL) = ZSUM12*ZRG
          ! Calculate local temperature tendency (K) due to dissipation
!$acc loop seq
          DO JK=1,KLEV
            !DIR$ LOOP_INFO EST_TRIPS(16)
            IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
              ZTDIS = ZORCPD*ZSUM12*ZUV2(JL, JK) / MAX(1.E-15_JPRB, ZSUM22)
              PTENT(JL, JK) = PTENT(JL, JK) + ZTDIS
            END IF
          END DO
        END IF
      END DO
      
      
    END IF
    
    !----------------------------------------------------------------------
    
    !*   10.           IN CASE THAT EITHER DEEP OR SHALLOW IS SWITCHED OFF
    !                  NEED TO SET SOME VARIABLES A POSTERIORI TO ZERO
    !                  ---------------------------------------------------
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      IF (.not.YDML_PHY_EC%YRECUMF%LMFSCV .or. .not.YDML_PHY_EC%YRECUMF%LMFPEN) THEN
!$acc loop seq
        DO JK=2,KLEV
          !DIR$ LOOP_INFO EST_TRIPS(16)
          IF (LLO2(JL) .and. JK >= -1 + KCTOP(JL)) THEN
            PMFUDE_RATE(JL, JK) = 0.0_JPRB
            PMFDDE_RATE(JL, JK) = 0.0_JPRB
          END IF
        END DO
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IF (LLO2(JL)) THEN
          KCTOP(JL) = KLEV - 1
          KCBOT(JL) = KLEV - 1
        END IF
      END IF
    END DO
    
    
    !----------------------------------------------------------------------
    
    !*   11.0          CHEMICAL TRACER TRANSPORT
    !                  -------------------------
    
    IF (YDML_PHY_EC%YREPHY%LMFTRAC .and. KTRAC > 0) THEN
      
      ! transport switched off for mid-level convection
      !DIR$ LOOP_INFO EST_TRIPS(16)
      !IF( LDCUM(JL).AND.KTYPE(JL)/=3 ) THEN
      
!$acc loop vector
      DO JL=KIDIA,KFDIA
        IF (LDCUM(JL) .and. KTYPE(JL) /= 3 .and. KCBOT(JL) - KCTOP(JL) >= 1) THEN
          LLDCUM(JL) = .true.
          LLDDRAF3(JL) = LLDDRAF(JL)
        ELSE
          LLDCUM(JL) = .false.
          LLDDRAF3(JL) = .false.
        END IF
        
        ! check and correct mass fluxes for CFL criterium
        
        ZMFS(:) = 1.0_JPRB
        IF (YDML_PHY_EC%YRECUMF%RMFSOLCT <= 3.0_JPRB) THEN
!$acc loop seq
          DO JK=2,KLEV
            !DIR$ LOOP_INFO EST_TRIPS(16)
            IF (LLDCUM(JL) .and. JK >= KCTOP(JL)) THEN
              ZMFMAX = (PAPH(JL, JK) - PAPH(JL, JK - 1))*0.8_JPRB*ZCONS
              IF (PMFU(JL, JK) > ZMFMAX) ZMFS(JL) = MIN(ZMFS(JL), ZMFMAX / PMFU(JL, JK))
            END IF
          END DO
        END IF
!$acc loop seq
        DO JK=1,KLEV
          !DIR$ LOOP_INFO EST_TRIPS(16)
          IF (LLDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
            ZMFUUS(JL, JK) = PMFU(JL, JK)*ZMFS(JL)
            ZMFUDR(JL, JK) = PMFUDE_RATE(JL, JK)*ZMFS(JL)
            ZDMFUPC(JL, JK) = (PMFLXR(JL, JK) + PMFLXS(JL, JK))*ZMFS(JL)
            IKB = KCBOT(JL)
            IF (JK > IKB) THEN
              ZDMFUPC(JL, JK) = ZDMFUPC(JL, IKB)
            END IF
          ELSE
            ZMFUUS(JL, JK) = 0._JPRB
            ZMFUDR(JL, JK) = 0._JPRB
          END IF
          IF (LLDDRAF3(JL) .and. JK >= -1 + IDTOP(JL)) THEN
            ZMFDUS(JL, JK) = PMFD(JL, JK)*ZMFS(JL)
            ZMFDDR(JL, JK) = PMFDDE_RATE(JL, JK)*ZMFS(JL)
            !     ZDMFDPC(JL,JK)=ZDMFDPC(JL,JK)*ZMFS(JL)
            ZDMFDPC(JL, JK) = 0.0_JPRB
          ELSE
            ZMFDUS(JL, JK) = 0._JPRB
            ZMFDDR(JL, JK) = 0._JPRB
          END IF
        END DO
        
        IF (YDML_PHY_EC%YRECUMF%LMFSMOOTH) THEN
          ! smmoothing of mass fluxes (gradients) at top and bottom of draughts
!$acc loop seq
          DO JK=2,KLEV - 1
            !DIR$ LOOP_INFO EST_TRIPS(16)
            IF (LLDDRAF3(JL) .and. ZMFDUS(JL, JK) < 0.0_JPRB .and. ZMFDUS(JL, 1 + JK) == 0.0_JPRB) THEN
              ZERATE = MIN(0._JPRB, ZMFDUS(JL, JK) - 0.5*ZMFDUS(JL, JK - 1))
              ZMFDUS(JL, JK) = ZMFDUS(JL, JK) - ZERATE
              ZMFDDR(JL, JK) = ZMFDDR(JL, JK) - ZERATE
              ZMFDDR(JL, JK + 1) = -ZMFDUS(JL, JK)
            END IF
            IF (LLDCUM(JL) .and. JK == KCTOP(JL)) THEN
              ZERATE = MAX(0.0_JPRB, ZMFUUS(JL, JK) - 0.5_JPRB*ZMFUUS(JL, JK + 1))
              ZMFUUS(JL, JK) = ZMFUUS(JL, JK) - ZERATE
              ZMFUDR(JL, JK) = ZMFUDR(JL, JK) + ZERATE
              ZMFUDR(JL, JK - 1) = ZMFUUS(JL, JK)
            END IF
          END DO
!$acc loop seq
          DO JK=KLEV - 1,2,-1
            !DIR$ LOOP_INFO EST_TRIPS(16)
            IF (LLDCUM(JL)) THEN
              IF (ZMFUDR(JL, JK) == 0.0_JPRB .and. ZMFUDR(JL, -1 + JK) > 0.0_JPRB) THEN
                ZMFUDR(JL, JK) = 0.5_JPRB*ZMFUDR(JL, JK - 1)
              END IF
            END IF
          END DO
        END IF
      END DO
      
      
      IF (YDML_PHY_EC%YREPHY%LMFSCAV) THEN
        CALL CUCTRACER_LOKI(YDCST, YDML_PHY_SLIN%YRCUMFS, YDML_PHY_SLIN%YRECUMF2, YDML_PHY_EC%YRECUMF, KIDIA, KFDIA, KLON, KLEV,  &
        & KTRAC, KCTOP, IDTOP, KTYPE, LLDCUM, LLDDRAF3, PTSPHY, PAPH, PAP, ZMFUUS, ZMFDUS, PMFU, PMFD, ZMFUDR, ZMFDDR, ZDMFUPC,  &
        & ZDMFDPC, PCEN, PTENC, PSCAV, YDSTACK_L=YLSTACK_L)
      ELSE
        ZDMFUPC(:, :) = 0.0_JPRB
        CALL CUCTRACER_LOKI(YDCST, YDML_PHY_SLIN%YRCUMFS, YDML_PHY_SLIN%YRECUMF2, YDML_PHY_EC%YRECUMF, KIDIA, KFDIA, KLON, KLEV,  &
        & KTRAC, KCTOP, IDTOP, KTYPE, LLDCUM, LLDDRAF3, PTSPHY, PAPH, PAP, ZMFUUS, ZMFDUS, PMFU, PMFD, ZMFUDR, ZMFDDR, ZDMFUPC,  &
        & ZDMFDPC, PCEN, PTENC, PSCAV0, YDSTACK_L=YLSTACK_L)
      END IF
      
    END IF
    
    !----------------------------------------------------------------------
    
    !*   12.           PUT DETRAINMENT RATES FROM MFLX UNITS IN UNITS MFLX/M
    !                  FOR ERA40, ESTIMATE VOLUME MEAN RAIN AND SNOW CONTENT
    !                  ---------------------------------------------------
    
    PDISS(:, 1) = 0.0_JPRB
    ZAR = 1.0_JPRB / 20.89_JPRB
    ZAS = 1.0_JPRB / 29.51_JPRB
    ZBR = 1.0_JPRB / 1.15_JPRB
    ZBS = 1.0_JPRB / 1.10_JPRB
    ZAK = 1.0_JPRB / 5.09E-3_JPRB
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
!$acc loop seq
      DO JK=1,KLEV
        !DIR$ LOOP_INFO EST_TRIPS(16)
        IK = MIN(JK + 1, KLEV)
        IKD = MAX(JK - 1, 1)
        PDISS(JL, JK) = 0.0_JPRB
        PRSUD(JL, JK, 1) = 0.0_JPRB
        PRSUD(JL, JK, 2) = 0.0_JPRB
        IF (LDCUM(JL) .and. JK >= -1 + KCTOP(JL)) THEN
          PLUDELI(JL, JK, 3) =  &
          & PMFUDE_RATE(JL, JK)*(PQU(JL, IK) - ZQENH(JL, IK)) + PMFDDE_RATE(JL, JK)*(ZQD(JL, IKD) - ZQENH(JL, IKD))
          PLUDELI(JL, JK, 4) =  &
          & PMFUDE_RATE(JL, JK)*(PTU(JL, IK) - ZTENH(JL, IK)) + PMFDDE_RATE(JL, JK)*(ZTD(JL, IKD) - ZTENH(JL, IKD))
          ! Change units for detrainment as for ERA
          ZRO = YDCST%RG / (PGEOH(JL, JK) - PGEOH(JL, JK + 1))            ! 1/dz
          PMFUDE_RATE(JL, JK) = PMFUDE_RATE(JL, JK)*ZRO
          PMFDDE_RATE(JL, JK) = PMFDDE_RATE(JL, JK)*ZRO
          ZRO = YDCST%RD*PTEN(JL, JK)*(1.0_JPRB + YDCST%RETV*PQEN(JL, JK)) / PAP(JL, JK)
          ! Dissipation definition used in stoch Backscatter
          ! PDISS(JL,JK)=MIN(PWMEAN(JL),17._JPRB)**2*PMFUDE_RATE(JL,JK)*ZRO*ZTAU(JL)
          ZDUTEN = PTENU(JL, JK) - ZTENU(JL, JK)
          ZDVTEN = PTENV(JL, JK) - ZTENV(JL, JK)
          ! Dissipation used in eddy dissipation(EDR) turbulence diagnostic
          PDISS(JL, JK) = ABS(PUEN(JL, JK)*ZDUTEN + PVEN(JL, JK)*ZDVTEN)**0.3333
          
          ! grid-mean convective rain/snow parametrization (Geer et al. 2009) with factor 0.5 for snow
          PRSUD(JL, JK, 1) = 1.E-3_JPRB*ZRO*(PMFLXR(JL, JK)*3600._JPRB*ZAR)**ZBR
          PRSUD(JL, JK, 2) = 0.5*1.E-3_JPRB*ZRO*(10.0_JPRB*PMFLXS(JL, JK)*3600._JPRB*ZAS)**ZBS
          ! possible updraught fraction for incloud values
          ! ZFAC=PAPH(JL,NJKT5)/MIN(PAPH(JL,NJKT5),MAX(200.E2_JPRB,PAPH(JL,JK)))
          ! ZFAC=RCUCOV*ZFAC**2
          ! grid-mean convective rain/snow parametrization similar to that used in evaporation
          ! i.e. Kessler but without pressure factor and factor for snow
          ! PRSUD(JL,JK,1)=1.E-3_JPRB*ZRO*(PMFLXR(JL,JK)*ZAK)**0.888_JPRB
          ! PRSUD(JL,JK,2)=1.E-3_JPRB*ZRO*(PMFLXS(JL,JK)*2.5*ZAK)**0.888_JPRB
        ELSE
          PMFU(JL, JK) = 0.0_JPRB
          PMFD(JL, JK) = 0.0_JPRB
          PLUDE(JL, JK) = 0.0_JPRB
          PLUDELI(JL, JK, 1) = 0.0_JPRB
          PLUDELI(JL, JK, 2) = 0.0_JPRB
          PLUDELI(JL, JK, 3) = 0.0_JPRB
          PLUDELI(JL, JK, 4) = 0.0_JPRB
          PSNDE(JL, JK, 1) = 0.0_JPRB
          PSNDE(JL, JK, 2) = 0.0_JPRB
          PTU(JL, JK) = PTEN(JL, JK)
          PQU(JL, JK) = PQEN(JL, JK)
          PLU(JL, JK) = 0.0_JPRB
          PENTH(JL, JK) = 0.0_JPRB
          PMFUDE_RATE(JL, JK) = 0.0_JPRB
          PMFDDE_RATE(JL, JK) = 0.0_JPRB
        END IF
      END DO
    END DO
    
    
    !----------------------------------------------------------------------
    
    
!$acc end data
  END SUBROUTINE CUMASTRN_LOKI
END MODULE CUMASTRN_LOKI_MOD
