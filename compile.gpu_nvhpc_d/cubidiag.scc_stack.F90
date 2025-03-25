MODULE CUBIDIAG_LOKI_MOD
  CONTAINS
  SUBROUTINE CUBIDIAG_LOKI (KIDIA, KFDIA, KLON, KLEV, KCTOP, LD_LCUMASK, PA, PB, PR, PU, YDSTACK_L)
    
    !          P. Bechtold         E.C.M.W.F.     07/03
    
    !          PURPOSE.
    !          --------
    !          SOLVES BIDIAGONAL SYSTEM
    !          FOR IMPLICIT SOLUTION OF ADVECTION EQUATION
    
    !          INTERFACE
    !          ---------
    
    !          THIS ROUTINE IS CALLED FROM *CUDUDV* AND CUDTDQ.
    !          IT RETURNS UPDATED VALUE OF QUANTITY
    
    !          METHOD.
    !          --------
    !          NUMERICAL RECIPES (Cambridge Press)
    !          DERIVED FROM TRIDIAGONAL ALGORIHM WITH C=0.
    !          (ONLY ONE FORWARD SUBSTITUTION NECESSARY)
    !          M  x  U  = R
    !          ELEMENTS OF MATRIX M ARE STORED IN VECTORS A, B, C
    
    !          (  B(kctop-1)    C(kctop-1)    0          0        )
    !          (  A(kctop)      B(kctop)      C(kctop)   0        )
    !          (  0             A(jk)         B(jk)      C(jk)    )
    !          (  0             0             A(klev)    B(klev)  )
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    
    !    INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KCTOP*        CLOUD TOP LEVELS
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PA, PB*       VECTORS CONTAINING DIAGONAL ELEMENTS
    !    *PR*           RHS VECTOR CONTAINING "CONSTANTS"
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PU*            SOLUTION VECTOR = UPDATED VALUE OF QUANTITY
    
    !          EXTERNALS
    !          ---------
    !          NONE
    
    !----------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    IMPLICIT NONE
    
    !     DUMMY INTEGER
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KCTOP(KLON)
    LOGICAL, INTENT(IN) :: LD_LCUMASK(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PA(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PB(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PR(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PU(KLON, KLEV)
    !     DUMMY REALS
    !     DUMMY LOGICALS
    !     LOCALS
    INTEGER(KIND=JPIM) :: JK, JL
    REAL(KIND=JPRB) :: ZBET
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    YLSTACK_L = YDSTACK_L
!$acc data present( KCTOP, LD_LCUMASK, PA, PB, PR, PU )
    
    !----------------------------------------------------------------------
    
    
    PU(:, :) = 0.0_JPRB
    
    ! Forward Substitution
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
!$acc loop seq
      DO JK=2,KLEV
        IF (LD_LCUMASK(JL, JK)) THEN
          IF (JK == -1 + KCTOP(JL)) THEN
            ZBET = 1.0_JPRB / (PB(JL, JK) + 1.E-35_JPRB)
            PU(JL, JK) = PR(JL, JK)*ZBET
          ELSE IF (JK > -1 + KCTOP(JL)) THEN
            ZBET = 1.0_JPRB / (PB(JL, JK) + 1.E-35_JPRB)
            PU(JL, JK) = (PR(JL, JK) - PA(JL, JK)*PU(JL, JK - 1))*ZBET
          END IF
        END IF
      END DO
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUBIDIAG_LOKI
END MODULE CUBIDIAG_LOKI_MOD
