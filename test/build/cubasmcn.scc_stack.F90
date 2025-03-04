MODULE CUBASMCN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUBASMCN_LOKI (YDCST, YDECUMF, KIDIA, KFDIA, KLON, KLEV, KK, PTEN, PQEN, PQSEN, PVERVEL, PGEO, PGEOH, LDCUM, KTYPE,  &
  & KLAB, KCBOT, PMFU, PMFUB, PLRAIN, PTU, PQU, PLU, PMFUS, PMFUQ, PMFUL, PDMFUP, YDSTACK_L)
    
    !          M.TIEDTKE         E.C.M.W.F.     12/89
    
    !          PURPOSE.
    !          --------
    !          THIS ROUTINE CALCULATES CLOUD BASE VALUES
    !          FOR MIDLEVEL CONVECTION
    
    !          INTERFACE
    !          ---------
    
    !          THIS ROUTINE IS CALLED FROM *CUASC*.
    !          INPUT ARE ENVIRONMENTAL VALUES T,Q ETC
    !          IT RETURNS CLOUDBASE VALUES FOR MIDLEVEL CONVECTION
    
    !          METHOD.
    !          --------
    !          S. TIEDTKE (1989)
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KK*           ACTUAL LEVEL
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)       K
    !    *PQEN*         PROVISIONAL ENVIRONMENT SPEC. HUMIDITY (T+1)  KG/KG
    !    *PQSEN*        ENVIRONMENT SPEC. SATURATION HUMIDITY (T+1)   KG/KG
    !    *PVERVEL*      VERTICAL VELOCITY                             PA/S
    !    *PGEO*         GEOPOTENTIAL                                  M2/S2
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                   M2/S2
    !    *PLRAIN*       RAIN WATER CONTENT IN UPDRAFTS                KG/KG
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    
    !    UPDATED PARAMETERS (INTEGER):
    
    !    *KTYPE*        TYPE OF CONVECTION
    !                       1 = PENETRATIVE CONVECTION
    !                       2 = SHALLOW CONVECTION
    !                       3 = MIDLEVEL CONVECTION
    !    *KLAB*         FLAG KLAB=1 FOR SUBCLOUD LEVELS
    !                        KLAB=2 FOR CLOUD LEVELS
    !    *KCBOT*        CLOUD BASE LEVEL
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PMFU*         MASSFLUX IN UPDRAFTS                          KG/(M2*S)
    !    *PMFUB*        MASSFLUX IN UPDRAFTS AT CLOUD BASE            KG/(M2*S)
    !    *PTU*          TEMPERATURE IN UPDRAFTS                         K
    !    *PQU*          SPEC. HUMIDITY IN UPDRAFTS                    KG/KG
    !    *PLU*          LIQUID WATER CONTENT IN UPDRAFTS              KG/KG
    !    *PMFUS*        FLUX OF DRY STATIC ENERGY IN UPDRAFTS          J/(M2*S)
    !    *PMFUQ*        FLUX OF SPEC. HUMIDITY IN UPDRAFTS            KG/(M2*S)
    !    *PMFUL*        FLUX OF LIQUID WATER IN UPDRAFTS              KG/(M2*S)
    !    *PDMFUP*       FLUX DIFFERENCE OF PRECIP. IN UPDRAFTS        KG/(M2*S)
    
    !          EXTERNALS
    !          ---------
    !          NONE
    
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !     R. El Khatib 06-Sep-2023 vectorization
    !----------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOECUMF, ONLY: TECUMF
    
    IMPLICIT NONE
    
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KK
    REAL(KIND=JPRB), INTENT(IN) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVERVEL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    LOGICAL, INTENT(IN) :: LDCUM(KLON)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KTYPE(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KLAB(KLON, KLEV)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KCBOT(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUB(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PLRAIN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PTU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PQU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFUL(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PDMFUP(KLON, KLEV)
    INTEGER(KIND=JPIM) :: JL
    
    REAL(KIND=JPRB) :: ZZZMB, CUBASMCN_ZRG, CUBASMCN_ZORCPD
    REAL(KIND=JPHOOK) :: CUBASMCN_ZHOOK_HANDLE
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    YLSTACK_L = YDSTACK_L
!$acc data present( PTEN, PQEN, PQSEN, PVERVEL, PGEO, PGEOH, LDCUM, KTYPE, KLAB, KCBOT, PMFU, PMFUB, PLRAIN, PTU, PQU, PLU,  &
!$acc & PMFUS, PMFUQ, PMFUL, PDMFUP, YDCST, YDECUMF )
    
    !----------------------------------------------------------------------
    
    
    !*    1.           CALCULATE ENTRAINMENT AND DETRAINMENT RATES
    !                  -------------------------------------------
    
    
    CUBASMCN_ZRG = 1.0_JPRB / YDCST%RG
    CUBASMCN_ZORCPD = 1.0_JPRB / YDCST%RCPD
    !DIR$ IVDEP
    !OCL NOVREC
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      IF (.not.LDCUM(JL) .and. KLAB(JL, 1 + KK) == 0) THEN
        IF (YDECUMF%LMFMID .and. KK > YDECUMF%NJKT7 .and. PQEN(JL, KK) > 0.80_JPRB*PQSEN(JL, KK)) THEN
          PTU(JL, KK + 1) = (YDCST%RCPD*PTEN(JL, KK) + PGEO(JL, KK) - PGEOH(JL, KK + 1))*CUBASMCN_ZORCPD
          PQU(JL, KK + 1) = PQEN(JL, KK)
          PLU(JL, KK + 1) = 0.0_JPRB
          ! ZZZMB=MAX(RMFCMIN,-PVERVEL(JL,KK)/RG)
          ZZZMB = MAX(1.E-6_JPRB, -PVERVEL(JL, KK)*CUBASMCN_ZRG)
          ZZZMB = MIN(ZZZMB, YDECUMF%RMFLIA)
          PMFUB(JL) = ZZZMB
          PMFU(JL, KK + 1) = PMFUB(JL)
          PMFUS(JL, KK + 1) = PMFUB(JL)*(YDCST%RCPD*PTU(JL, KK + 1) + PGEOH(JL, KK + 1))
          PMFUQ(JL, KK + 1) = PMFUB(JL)*PQU(JL, KK + 1)
          PMFUL(JL, KK + 1) = 0.0_JPRB
          PDMFUP(JL, KK + 1) = 0.0_JPRB
          PLRAIN(JL, KK + 1) = 0.0_JPRB
          KCBOT(JL) = KK
          KLAB(JL, KK + 1) = 1
          KTYPE(JL) = 3
        END IF
      END IF
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUBASMCN_LOKI
END MODULE CUBASMCN_LOKI_MOD
