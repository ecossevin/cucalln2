MODULE CUCCDIA_LOKI_MOD
  CONTAINS
  SUBROUTINE CUCCDIA_LOKI (YDERAD, YDEPHLI, YDEPHY, KIDIA, KFDIA, KLON, KLEV, KSTEP, KCBOT, KCTOP, LDCUM, PQU, PLU, PMFU, PRAIN,  &
  & PARPRC, KTOPC, KBASEC, YDSTACK_L)
    
    !**** *CUCCDIA*- UPDATES PRECIPITAION, CLOUD BASE AND CLOUD TOP
    !                FOR DIAGNOSTIC SCHEME FOR CONVECTIVE CLOUDS
    
    !          M.TIEDTKE         E.C.M.W.F.    12/89
    
    !**   INTERFACE.
    !     ----------
    
    !          *CUCCDIA* IS CALLED FROM *CUCALL*
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KSTEP*        CURRENT TIME STEP INDEX
    !    *KCBOT*        CLOUD BASE LEVEL
    !    *KCTOP*        CLOUD TOP LEVEL
    
    !     INPUT PARAMETERS (LOGICAL)
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    
    !     INPUT PARAMETERS (REAL)
    
    !    *PQU*          SPEC. HUMIDITY IN UPDRAFTS                    KG/KG
    !    *PLU*          LIQUID WATER CONTENT IN UPDRAFTS              KG/KG
    !    *PMFU*         MASSFLUX UPDRAFTS                             KG/(M2*S)
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PARPRC*       ACCUMULATED PRECIPITATION AMMOUNT             KG/(M2*S)
    !                   FOR RADIATION CALCULATION
    !    *KTOPC*        CONVECTIVE CLOUD TOP LEVEL FOR RADIATION
    !    *KBASEC*       CONVECTIVE CLOUD BASE LEVEL FOR RADIATION
    
    !-----------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOEPHY, ONLY: TEPHY
    USE YOERAD, ONLY: TERAD
    USE YOEPHLI, ONLY: TEPHLI
    
    IMPLICIT NONE
    
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    TYPE(TEPHY), INTENT(IN) :: YDEPHY
    TYPE(TERAD), INTENT(IN) :: YDERAD
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KSTEP
    INTEGER(KIND=JPIM), INTENT(IN) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KCTOP(KLON)
    LOGICAL, INTENT(IN) :: LDCUM(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PQU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PLU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PRAIN(KLON)
    REAL(KIND=JPRB), INTENT(INOUT) :: PARPRC(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KTOPC(KLON)
    INTEGER(KIND=JPIM), INTENT(INOUT) :: KBASEC(KLON)
    !     ------------------------------------------------------------------
    
    INTEGER(KIND=JPIM) :: IKB, IKT, JL
    
    REAL(KIND=JPRB) :: ZDMFQ, ZNORMR
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    YLSTACK_L = YDSTACK_L
!$acc data present( KCBOT, KCTOP, LDCUM, PQU, PLU, PMFU, PRAIN, PARPRC, KTOPC, KBASEC, YDERAD, YDEPHLI, YDEPHY )
    
    !---------------------------------------------------------------------
    
    !*    1.0          STORE CLOUD PARAMETERS FOR RADIATION CALCULATION
    !                  -----------------------------------------------
    
    !********************************
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      IF (.not.YDEPHLI%LPHYLIN .and. YDERAD%NRADFR /= 1) THEN
        !********************************
        IF (YDEPHY%LECUMF .and. YDEPHY%LERADI .and. MOD(1 + KSTEP, YDERAD%NRADFR) /= 0) THEN
          ZNORMR = 1.0_JPRB / REAL(MAX(YDERAD%NRADFR - 1, 1), kind=JPRB)
          !DIR$ IVDEP
          !OCL NOVREC
          IF (LDCUM(JL)) THEN
            KBASEC(JL) = MAX(KBASEC(JL), KCBOT(JL))
            KTOPC(JL) = MIN(KTOPC(JL), KCTOP(JL))
            IF (KTOPC(JL) == 1) KTOPC(JL) = KCTOP(JL)
            IKB = KCBOT(JL)
            IKT = KCTOP(JL)
            ZDMFQ = PMFU(JL, IKB)*MAX(PQU(JL, IKB) + PLU(JL, IKB) - PQU(JL, IKT), PQU(JL, IKB)*0.05_JPRB)
            PARPRC(JL) = PARPRC(JL) + MAX(ZDMFQ, PRAIN(JL))*ZNORMR
          END IF
        END IF
        !********************************
      ELSE
        !********************************
        IF (YDEPHY%LECUMF) THEN
          !DIR$ IVDEP
          !OCL NOVREC
          IF (LDCUM(JL)) THEN
            KBASEC(JL) = KCBOT(JL)
            KTOPC(JL) = KCTOP(JL)
            IF (KTOPC(JL) == 1) KTOPC(JL) = KCTOP(JL)
            IKB = KCBOT(JL)
            IKT = KCTOP(JL)
            ZDMFQ = PMFU(JL, IKB)*MAX(PQU(JL, IKB) + PLU(JL, IKB) - PQU(JL, IKT), PQU(JL, IKB)*0.05_JPRB)
            PARPRC(JL) = MAX(ZDMFQ, PRAIN(JL))
          END IF
        END IF
        !********************************
      END IF
    END DO
    
    !********************************
    
    
!$acc end data
  END SUBROUTINE CUCCDIA_LOKI
END MODULE CUCCDIA_LOKI_MOD
