MODULE CUININ_LOKI_MOD
  CONTAINS
  SUBROUTINE CUININ_LOKI (YDCST, YDTHF, YDEPHLI, YDECUMF, KIDIA, KFDIA, KLON, KLEV, PTEN, PQEN, PQSEN, PUEN, PVEN, PGEO, PAPH,  &
  & KLAB, PTENH, PQENH, PQSENH, PGEOH, PTU, PQU, PTD, PQD, PUU, PVU, PUD, PVD, PLU, YDSTACK_L)
    
    !          PURPOSE
    !          -------
    
    !          THIS ROUTINE INTERPOLATES LARGE-SCALE FIELDS OF T,Q ETC.
    !          TO HALF LEVELS (I.E. GRID FOR MASSFLUX SCHEME),
    !          DETERMINES LEVEL OF MAXIMUM VERTICAL VELOCITY
    !          AND INITIALIZES VALUES FOR UPDRAFTS AND DOWNDRAFTS
    
    !          INTERFACE
    !          ---------
    !          THIS ROUTINE IS CALLED FROM *CUMASTR*.
    
    !          METHOD.
    !          --------
    !          FOR EXTRAPOLATION TO HALF LEVELS SEE TIEDTKE(1989)
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)       K
    !    *PQEN*         PROVISIONAL ENVIRONMENT SPEC. HUMIDITY (T+1)  KG/KG
    !    *PQSEN*        ENVIRONMENT SPEC. SATURATION HUMIDITY (T+1)   KG/KG
    !    *PUEN*         PROVISIONAL ENVIRONMENT U-VELOCITY (T+1)       M/S
    !    *PVEN*         PROVISIONAL ENVIRONMENT V-VELOCITY (T+1)       M/S
    !    *PGEO*         GEOPOTENTIAL                                  M2/S2
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                   M2/S2
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS             PA
    
    !    OUTPUT PARAMETERS (INTEGER):
    
    !    *KLAB*         FLAG KLAB=1 FOR SUBCLOUD LEVELS
    !                        KLAB=2 FOR CONDENSATION LEVEL
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PTENH*        ENV. TEMPERATURE (T+1) ON HALF LEVELS         K
    !    *PQENH*        ENV. SPEC. HUMIDITY (T+1) ON HALF LEVELS    KG/KG
    !    *PQSENH*       ENV. SPEC. SATURATION HUMIDITY (T+1)
    !                   ON HALF LEVELS                              KG/KG
    !    *PTU*          TEMPERATURE IN UPDRAFTS                       K
    !    *PQU*          SPEC. HUMIDITY IN UPDRAFTS                  KG/KG
    !    *PTD*          TEMPERATURE IN DOWNDRAFTS                     K
    !    *PQU*          SPEC. HUMIDITY IN DOWNDRAFTS                KG/KG
    !    *PUU*          U-VELOCITY IN UPDRAFTS                       M/S
    !    *PVU*          V-VELOCITY IN UPDRAFTS                       M/S
    !    *PUD*          U-VELOCITY IN DOWNDRAFTS                     M/S
    !    *PVD*          V-VELOCITY IN DOWNDRAFTS                     M/S
    !    *PLU*          LIQUID WATER CONTENT IN UPDRAFTS            KG/KG
    
    !          EXTERNALS
    !          ---------
    !          *CUADJTQ* TO SPECIFY QS AT HALF LEVELS
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE         E.C.M.W.F.     12/89
    
    !     MODIFICATIONS.
    !     --------------
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      05-02-11 : Optimisation (NJKT2) P. BECHTOLD
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !----------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOETHF, ONLY: TTHF
    USE YOECUMF, ONLY: TECUMF
    USE YOEPHLI, ONLY: TEPHLI
    
    IMPLICIT NONE
    
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    REAL(KIND=JPRB), INTENT(IN) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PUEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PVEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KLAB(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PQENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQSENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(OUT) :: PTU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PQU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PTD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PQD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PUU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PVU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PUD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PVD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PLU(KLON, KLEV)
    REAL(KIND=JPRB) :: ZPH
    LOGICAL :: LLFLAG
    
    INTEGER(KIND=JPIM) :: IK, JK, JL
    
    REAL(KIND=JPRB) :: ZORCPD    !, ZZS
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    REAL(KIND=JPRB) :: Z3ES, Z4ES, Z5ALCP, ZALDCP
    REAL(KIND=JPRB) :: ZQMAX, ZQP, ZCOND, ZCOND1, ZTARG, ZCOR, ZQSAT, ZFOEEW, Z2S
    REAL(KIND=JPHOOK) :: CUADJTQS_ZHOOK_HANDLE
#include "fcttre.func.h"
    REAL(KIND=JPRB) :: Z1S, CUADJTQ_Z2S, CUADJTQ_ZCOND, CUADJTQ_ZCOND1, CUADJTQ_ZCOR, ZFOEEWI, ZFOEEWL, CUADJTQ_ZOEALFA,  &
    & CUADJTQ_ZQMAX, CUADJTQ_ZQSAT, CUADJTQ_ZTARG, CUADJTQ_ZQP
    REAL(KIND=JPRB) :: ZL, ZI, ZF
    LOGICAL :: CUADJTQ_LLFLAG
    REAL(KIND=JPHOOK) :: CUADJTQ_ZHOOK_HANDLE
#include "abor1.intfb.h"
#include "cuadjtq.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    YLSTACK_L = YDSTACK_L
!$acc data present( PTEN, PQEN, PQSEN, PUEN, PVEN, PGEO, PAPH, KLAB, PTENH, PQENH, PQSENH, PGEOH, PTU, PQU, PTD, PQD, PUU, PVU,  &
!$acc & PUD, PVD, PLU, YDCST, YDTHF, YDEPHLI, YDECUMF )
    
    !----------------------------------------------------------------------
    
    !*    1.           SPECIFY LARGE SCALE PARAMETERS AT HALF LEVELS
    !*                 ADJUST TEMPERATURE FIELDS IF STATICLY UNSTABLE
    !*                 FIND LEVEL OF MAXIMUM VERTICAL VELOCITY
    !                  ----------------------------------------------
    
    ZORCPD = 1._JPRB / YDCST%RCPD
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
!$acc loop seq
      DO JK=2,KLEV
        PTENH(JL, JK) =  &
        & (MAX(YDCST%RCPD*PTEN(JL, JK - 1) + PGEO(JL, JK - 1), YDCST%RCPD*PTEN(JL, JK) + PGEO(JL, JK)) - PGEOH(JL, JK))*ZORCPD
        PQENH(JL, JK) = PQEN(JL, JK - 1)
        PQSENH(JL, JK) = PQSEN(JL, JK - 1)
        ZPH = PAPH(JL, JK)
        LLFLAG = .true.
        
        !orig   IF(JK.GE.KLEV-1) GO TO 130
        IF (JK >= -1 + KLEV .or. JK < YDECUMF%NJKT2) CYCLE
        IK = JK
        IF (YDEPHLI%LPHYLIN) THEN
          ! [Loki] inlined child subroutine: CUADJTQS
          ! =========================================
          !----------------------------------------------------------------------
          
          !     1.           DEFINE CONSTANTS
          !                  ----------------
          
          
          ZQMAX = 0.5_JPRB
          
          !     2.           CALCULATE CONDENSATION AND ADJUST T AND Q ACCORDINGLY
          !                  -----------------------------------------------------
          
          !*    ICE-WATER THERMODYNAMICAL FUNCTIONS
          
          IF (PTENH(JL, IK) > YDCST%RTT) THEN
            Z3ES = YDTHF%R3LES
            Z4ES = YDTHF%R4LES
            Z5ALCP = YDTHF%R5ALVCP
            ZALDCP = YDTHF%RALVDCP
          ELSE
            Z3ES = YDTHF%R3IES
            Z4ES = YDTHF%R4IES
            Z5ALCP = YDTHF%R5ALSCP
            ZALDCP = YDTHF%RALSDCP
          END IF
          
          
          
          
          !DIR$    IVDEP
          !OCL NOVREC
          ZQP = 1.0_JPRB / ZPH
          ZTARG = PTENH(JL, IK)
          ZFOEEW = YDTHF%R2ES*EXP(Z3ES*(ZTARG - YDCST%RTT) / (ZTARG - Z4ES))
          ZQSAT = ZQP*ZFOEEW
          IF (ZQSAT > ZQMAX) THEN
            ZQSAT = ZQMAX
          END IF
          ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
          ZQSAT = ZQSAT*ZCOR
          Z2S = Z5ALCP / (ZTARG - Z4ES)**2
          ZCOND1 = (PQSENH(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*Z2S)
          PTENH(JL, IK) = PTENH(JL, IK) + ZALDCP*ZCOND1
          PQSENH(JL, IK) = PQSENH(JL, IK) - ZCOND1
          ZTARG = PTENH(JL, IK)
          ZFOEEW = YDTHF%R2ES*EXP(Z3ES*(ZTARG - YDCST%RTT) / (ZTARG - Z4ES))
          ZQSAT = ZQP*ZFOEEW
          IF (ZQSAT > ZQMAX) THEN
            ZQSAT = ZQMAX
          END IF
          ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
          ZQSAT = ZQSAT*ZCOR
          Z2S = Z5ALCP / (ZTARG - Z4ES)**2
          ZCOND1 = (PQSENH(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*Z2S)
          PTENH(JL, IK) = PTENH(JL, IK) + ZALDCP*ZCOND1
          PQSENH(JL, IK) = PQSENH(JL, IK) - ZCOND1
          
          
          
          ! =========================================
        ELSE
          ! [Loki] inlined child subroutine: CUADJTQ
          ! =========================================
          
          !----------------------------------------------------------------------
          
          !     1.           DEFINE CONSTANTS
          !                  ----------------
          
          
          !IF (LHOOK) CALL DR_HOOK('CUADJTQ',0,ZHOOK_HANDLE)
          
          
          CUADJTQ_ZQMAX = 0.5_JPRB
          
          !*********************************************
          IF (.not.YDEPHLI%LPHYLIN) THEN
            !*********************************************
            
            !     2.           CALCULATE CONDENSATION AND ADJUST T AND Q ACCORDINGLY
            !                  -----------------------------------------------------
            
            
            
            
            
            
            !DIR$ LOOP_INFO EST_TRIPS(16)
            CUADJTQ_ZQP = 1.0_JPRB / ZPH
            CUADJTQ_ZQSAT = FOEEWMCU(PTENH(JL, IK))*CUADJTQ_ZQP
            CUADJTQ_ZQSAT = MIN(0.5_JPRB, CUADJTQ_ZQSAT)
            CUADJTQ_ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*CUADJTQ_ZQSAT)
            CUADJTQ_ZQSAT = CUADJTQ_ZQSAT*CUADJTQ_ZCOR
            CUADJTQ_ZCOND1 = (PQSENH(JL, IK) - CUADJTQ_ZQSAT) / (1.0_JPRB + CUADJTQ_ZQSAT*CUADJTQ_ZCOR*FOEDEMCU(PTENH(JL, IK)))
            PTENH(JL, IK) = PTENH(JL, IK) + FOELDCPMCU(PTENH(JL, IK))*CUADJTQ_ZCOND1
            PQSENH(JL, IK) = PQSENH(JL, IK) - CUADJTQ_ZCOND1
            CUADJTQ_ZQSAT = FOEEWMCU(PTENH(JL, IK))*CUADJTQ_ZQP
            CUADJTQ_ZQSAT = MIN(0.5_JPRB, CUADJTQ_ZQSAT)
            CUADJTQ_ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*CUADJTQ_ZQSAT)
            CUADJTQ_ZQSAT = CUADJTQ_ZQSAT*CUADJTQ_ZCOR
            CUADJTQ_ZCOND1 = (PQSENH(JL, IK) - CUADJTQ_ZQSAT) / (1.0_JPRB + CUADJTQ_ZQSAT*CUADJTQ_ZCOR*FOEDEMCU(PTENH(JL, IK)))
            PTENH(JL, IK) = PTENH(JL, IK) + FOELDCPMCU(PTENH(JL, IK))*CUADJTQ_ZCOND1
            PQSENH(JL, IK) = PQSENH(JL, IK) - CUADJTQ_ZCOND1
            
            !*********************************************
          ELSE
            !*********************************************
            
            !     2.           CALCULATE CONDENSATION AND ADJUST T AND Q ACCORDINGLY
            !                  -----------------------------------------------------
            
            
            
            
            
            !*********************************************
          END IF
          !*********************************************
          
          
          !IF (LHOOK) CALL DR_HOOK('CUADJTQ',1,ZHOOK_HANDLE)
          
          ! =========================================
        END IF
        
        PQENH(JL, JK) = MIN(PQEN(JL, JK - 1), PQSEN(JL, JK - 1)) + (PQSENH(JL, JK) - PQSEN(JL, JK - 1))
        PQENH(JL, JK) = MAX(PQENH(JL, JK), 0.0_JPRB)
        !orig  130   continue
      END DO
      
      PTENH(JL, KLEV) = (YDCST%RCPD*PTEN(JL, KLEV) + PGEO(JL, KLEV) - PGEOH(JL, KLEV))*ZORCPD
      PQENH(JL, KLEV) = PQEN(JL, KLEV)
      PTENH(JL, 1) = PTEN(JL, 1)
      PQENH(JL, 1) = PQEN(JL, 1)
      
      !DO JK=KLEV-1,2,-1
      !  DO JL=KIDIA,KFDIA
      !    ZZS=MAX(RCPD*PTENH(JL,JK)+PGEOH(JL,JK),&
      !     & RCPD*PTENH(JL,JK+1)+PGEOH(JL,JK+1))
      !   PTENH(JL,JK)=(ZZS-PGEOH(JL,JK))*ZORCPD
      !  ENDDO
      !ENDDO
      
      !-----------------------------------------------------------------------
      
      !*    2.0          INITIALIZE VALUES FOR UPDRAFTS AND DOWNDRAFTS
      !*                 ---------------------------------------------
      
!$acc loop seq
      DO JK=1,KLEV
        IK = JK - 1
        IF (JK == 1) IK = 1
        PTU(JL, JK) = PTENH(JL, JK)
        PTD(JL, JK) = PTENH(JL, JK)
        PQU(JL, JK) = PQENH(JL, JK)
        PQD(JL, JK) = PQENH(JL, JK)
        PLU(JL, JK) = 0.0_JPRB
        PUU(JL, JK) = PUEN(JL, IK)
        PUD(JL, JK) = PUEN(JL, IK)
        PVU(JL, JK) = PVEN(JL, IK)
        PVD(JL, JK) = PVEN(JL, IK)
        KLAB(JL, JK) = 0
      END DO
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUININ_LOKI
END MODULE CUININ_LOKI_MOD
