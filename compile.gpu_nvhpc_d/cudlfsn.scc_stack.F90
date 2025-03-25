MODULE CUDLFSN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUDLFSN_LOKI (YDTHF, YDCST, YDEPHLI, YDECUMF, KIDIA, KFDIA, KLON, KLEV, KCBOT, KCTOP, LDCUM, PTENH, PQENH, PTEN,  &
  & PQSEN, PGEO, PGEOH, PAPH, PTU, PQU, PMFUB, PRFL, PTD, PQD, PMFD, PMFDS, PMFDQ, PDMFDP, KDTOP, LDDRAF, YDSTACK_L)
    
    !          THIS ROUTINE CALCULATES LEVEL OF FREE SINKING FOR
    !          CUMULUS DOWNDRAFTS AND SPECIFIES T,Q,U AND V VALUES
    
    !          PURPOSE.
    !          --------
    !          TO PRODUCE LFS-VALUES FOR CUMULUS DOWNDRAFTS
    !          FOR MASSFLUX CUMULUS PARAMETERIZATION
    
    !          INTERFACE
    !          ---------
    !          THIS ROUTINE IS CALLED FROM *CUMASTR*.
    !          INPUT ARE ENVIRONMENTAL VALUES OF T,Q,U,V,P,PHI
    !          AND UPDRAFT VALUES T,Q,U AND V AND ALSO
    !          CLOUD BASE MASSFLUX AND CU-PRECIPITATION RATE.
    !          IT RETURNS T,Q,U AND V VALUES AND MASSFLUX AT LFS.
    
    !          METHOD.
    
    !          CHECK FOR NEGATIVE BUOYANCY OF AIR OF EQUAL PARTS OF
    !          MOIST ENVIRONMENTAL AIR AND CLOUD AIR.
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    !    *KCBOT*        CLOUD BASE LEVEL
    !    *KCTOP*        CLOUD TOP LEVEL
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDCUM*        FLAG: .TRUE. FOR CONVECTIVE POINTS
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTENH*        ENV. TEMPERATURE (T+1) ON HALF LEVELS          K
    !    *PQENH*        ENV. SPEC. HUMIDITY (T+1) ON HALF LEVELS     KG/KG
    !    *PTEN*         PROVISIONAL ENVIRONMENT TEMPERATURE (T+1)       K
    !    *PQSEN*        ENVIRONMENT SPEC. SATURATION HUMIDITY (T+1)   KG/KG
    !    *PGEO*         GEOPOTENTIAL                                  M2/S2
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                  M2/S2
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS           PA
    !    *PTU*          TEMPERATURE IN UPDRAFTS                        K
    !    *PQU*          SPEC. HUMIDITY IN UPDRAFTS                   KG/KG
    !    *PMFUB*        MASSFLUX IN UPDRAFTS AT CLOUD BASE           KG/(M2*S)
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PRFL*         PRECIPITATION RATE                           KG/(M2*S)
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PTD*          TEMPERATURE IN DOWNDRAFTS                      K
    !    *PQD*          SPEC. HUMIDITY IN DOWNDRAFTS                 KG/KG
    !    *PMFD*         MASSFLUX IN DOWNDRAFTS                       KG/(M2*S)
    !    *PMFDS*        FLUX OF DRY STATIC ENERGY IN DOWNDRAFTS       J/(M2*S)
    !    *PMFDQ*        FLUX OF SPEC. HUMIDITY IN DOWNDRAFTS         KG/(M2*S)
    !    *PDMFDP*       FLUX DIFFERENCE OF PRECIP. IN DOWNDRAFTS     KG/(M2*S)
    
    !    OUTPUT PARAMETERS (INTEGER):
    
    !    *KDTOP*        TOP LEVEL OF DOWNDRAFTS
    
    !    OUTPUT PARAMETERS (LOGICAL):
    
    !    *LDDRAF*       .TRUE. IF DOWNDRAFTS EXIST
    
    !          EXTERNALS
    !          ---------
    !          *CUADJTQ* FOR CALCULATING WET BULB T AND Q AT LFS
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE         E.C.M.W.F.    12/86 MODIF. 12/89
    
    !     MODIFICATIONS.
    !     --------------
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !      P. Lopez      20-Jun-2007 CY32R2 Bug correction in latent heat when LPHYLIN=T.
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
    
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KCBOT(KLON)
    INTEGER(KIND=JPIM), INTENT(IN) :: KCTOP(KLON)
    LOGICAL, INTENT(IN) :: LDCUM(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PTENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PTEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PTU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFUB(KLON)
    REAL(KIND=JPRB), INTENT(INOUT) :: PRFL(KLON)
    REAL(KIND=JPRB), INTENT(OUT) :: PTD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PQD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFDS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFDQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PDMFDP(KLON, KLEV)
    INTEGER(KIND=JPIM), INTENT(OUT) :: KDTOP(KLON)
    LOGICAL, INTENT(OUT) :: LDDRAF(KLON)
    INTEGER(KIND=JPIM) :: IKHSMIN
    REAL(KIND=JPRB) :: ZTENWB(KLON, KLEV), ZQENWB(KLON, KLEV), ZCOND, ZPH, ZHSMIN
    LOGICAL :: LLO2
    
    INTEGER(KIND=JPIM) :: IK, IKE, IS, JK, JL
    
    REAL(KIND=JPRB) :: ZBUO, ZHSK, ZMFTOP, ZOEALFA, ZOELHM, ZQTEST, ZTARG, ZTTEST
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    
#include "fcttre.func.h"
    REAL(KIND=JPRB) :: Z1S, Z2S, CUADJTQ_ZCOND, ZCOND1, ZCOR, ZFOEEWI, ZFOEEWL, CUADJTQ_ZOEALFA, ZQMAX, ZQSAT, CUADJTQ_ZTARG, ZQP
    REAL(KIND=JPRB) :: ZL, ZI, ZF
    LOGICAL :: LLFLAG
    REAL(KIND=JPHOOK) :: CUADJTQ_ZHOOK_HANDLE
#include "abor1.intfb.h"
#include "cuadjtq.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    POINTER(IP_ZTENWB, ZTENWB)
    POINTER(IP_ZQENWB, ZQENWB)
    YLSTACK_L = YDSTACK_L
    IP_ZTENWB = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
    IP_ZQENWB = YLSTACK_L
    YLSTACK_L = YLSTACK_L + ISHFT(ISHFT(KLON*KLEV*C_SIZEOF(REAL(1, kind=JPRB)) + 7, -3), 3)
!$acc data present( KCBOT, KCTOP, LDCUM, PTENH, PQENH, PTEN, PQSEN, PGEO, PGEOH, PAPH, PTU, PQU, PMFUB, PRFL, PTD, PQD, PMFD,  &
!$acc & PMFDS, PMFDQ, PDMFDP, KDTOP, LDDRAF, YDTHF, YDCST, YDEPHLI, YDECUMF )
    !----------------------------------------------------------------------
    
    !     1.           SET DEFAULT VALUES FOR DOWNDRAFTS
    !                  ---------------------------------
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      LDDRAF(JL) = .false.
      KDTOP(JL) = KLEV + 1
      IKHSMIN = KLEV + 1
      ZHSMIN = 1.E8_JPRB
      
      !orig IF(.NOT.LMFDD) GO TO 300
      IF (YDECUMF%LMFDD) THEN
        
        !----------------------------------------------------------------------
        
        !     2.           DETERMINE LEVEL OF FREE SINKING:
        !                  DOWNDRAFTS SHALL START AT MODEL LEVEL OF MINIMUM
        !                  OF SATURATION MOIST STATIC ENERGY OR BELOW
        !                  RESPECTIVELY
        
        !                  FOR EVERY POINT AND PROCEED AS FOLLOWS:
        
        !                    (1) DETERMINE LEVEL OF MINIMUM OF HS
        !                    (2) DETERMINE WET BULB ENVIRONMENTAL T AND Q
        !                    (3) DO MIXING WITH CUMULUS CLOUD AIR
        !                    (4) CHECK FOR NEGATIVE BUOYANCY
        !                    (5) IF BUOYANCY>0 REPEAT (2) TO (4) FOR NEXT
        !                        LEVEL BELOW
        
        !                  THE ASSUMPTION IS THAT AIR OF DOWNDRAFTS IS MIXTURE
        !                  OF 50% CLOUD AIR + 50% ENVIRONMENTAL AIR AT WET BULB
        !                  TEMPERATURE (I.E. WHICH BECAME SATURATED DUE TO
        !                  EVAPORATION OF RAIN AND CLOUD WATER)
        !                  ----------------------------------------------------
        
!$acc loop seq
        DO JK=3,KLEV - 2
          
          IF (YDEPHLI%LPHYLIN) THEN
            
            ZTARG = PTEN(JL, JK)
            ZOEALFA = MIN(1.0_JPRB, 0.545_JPRB*(TANH(0.17_JPRB*(ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB))
            ZOELHM = ZOEALFA*YDCST%RLVTT + (1.0_JPRB - ZOEALFA)*YDCST%RLSTT
            ZHSK = YDCST%RCPD*PTEN(JL, JK) + PGEO(JL, JK) + ZOELHM*PQSEN(JL, JK)
            IF (ZHSK < ZHSMIN) THEN
              ZHSMIN = ZHSK
              IKHSMIN = JK
            END IF
            
          ELSE
            
            ZHSK = YDCST%RCPD*PTEN(JL, JK) + PGEO(JL, JK) + FOELHMCU(PTEN(JL, JK))*PQSEN(JL, JK)
            IF (ZHSK < ZHSMIN) THEN
              ZHSMIN = ZHSK
              IKHSMIN = JK
            END IF
            
          END IF
          
        END DO
        IKE = KLEV - 3
!$acc loop seq
        DO JK=3,IKE
          
          !     2.1          CALCULATE WET-BULB TEMPERATURE AND MOISTURE
          !                  FOR ENVIRONMENTAL AIR IN *CUADJTQ*
          !                  -------------------------------------------
          
          IS = 0
          ZTENWB(JL, JK) = PTENH(JL, JK)
          ZQENWB(JL, JK) = PQENH(JL, JK)
          ZPH = PAPH(JL, JK)
          LLO2 = LDCUM(JL) .and. PRFL(JL) > 0.0_JPRB .and. .not.LDDRAF(JL) .and. JK < KCBOT(JL) .and. JK > KCTOP(JL) .and. JK >=  &
          & IKHSMIN
          IF (LLO2) THEN
            IS = IS + 1
          END IF
          !orig   IF(IS.EQ.0) GO TO 290
          IF (IS == 0) CYCLE
          
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
            
            
            
            !DIR$    IVDEP
            !OCL NOVREC
            IF (LLO2) THEN
              ZQP = 1.0_JPRB / ZPH
              ZQSAT = FOEEWMCU(ZTENWB(JL, IK))*ZQP
              ZQSAT = MIN(0.5_JPRB, ZQSAT)
              ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
              ZQSAT = ZQSAT*ZCOR
              CUADJTQ_ZCOND = (ZQENWB(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*FOEDEMCU(ZTENWB(JL, IK)))
              CUADJTQ_ZCOND = MIN(CUADJTQ_ZCOND, 0.0_JPRB)
              ZTENWB(JL, IK) = ZTENWB(JL, IK) + FOELDCPMCU(ZTENWB(JL, IK))*CUADJTQ_ZCOND
              ZQENWB(JL, IK) = ZQENWB(JL, IK) - CUADJTQ_ZCOND
              ZQSAT = FOEEWMCU(ZTENWB(JL, IK))*ZQP
              ZQSAT = MIN(0.5_JPRB, ZQSAT)
              ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
              ZQSAT = ZQSAT*ZCOR
              ZCOND1 = (ZQENWB(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*FOEDEMCU(ZTENWB(JL, IK)))
              IF (CUADJTQ_ZCOND == 0.0_JPRB) ZCOND1 = MIN(ZCOND1, 0.0_JPRB)
              ZTENWB(JL, IK) = ZTENWB(JL, IK) + FOELDCPMCU(ZTENWB(JL, IK))*ZCOND1
              ZQENWB(JL, IK) = ZQENWB(JL, IK) - ZCOND1
            END IF
            
            
            
            
            
            !*********************************************
          ELSE
            !*********************************************
            
            !     2.           CALCULATE CONDENSATION AND ADJUST T AND Q ACCORDINGLY
            !                  -----------------------------------------------------
            
            
            
            !DIR$    IVDEP
            !OCL NOVREC
            IF (LLO2) THEN
              ZQP = 1.0_JPRB / ZPH
              
              CUADJTQ_ZTARG = ZTENWB(JL, IK)
              CUADJTQ_ZOEALFA = 0.5_JPRB*(TANH(YDEPHLI%RLPAL1*(CUADJTQ_ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB)
              ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4LES))
              ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4IES))
              ZQSAT = ZQP*(CUADJTQ_ZOEALFA*ZFOEEWL + (1.0_JPRB - CUADJTQ_ZOEALFA)*ZFOEEWI)
              Z1S = TANH(YDEPHLI%RLPAL2*(ZQSAT - ZQMAX))
              ZQSAT = 0.5_JPRB*((1.0_JPRB - Z1S)*ZQSAT + (1.0_JPRB + Z1S)*ZQMAX)
              
              ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
              ZQSAT = ZQSAT*ZCOR
              
              Z2S = CUADJTQ_ZOEALFA*YDTHF%R5ALVCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4LES)**2) + (1.0_JPRB - CUADJTQ_ZOEALFA) &
              & *YDTHF%R5ALSCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4IES)**2)
              CUADJTQ_ZCOND = (ZQENWB(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*Z2S)
              
              CUADJTQ_ZCOND = MIN(CUADJTQ_ZCOND, 0.0_JPRB)
              
              IF (CUADJTQ_ZCOND /= 0.0_JPRB) THEN
                
                ZTENWB(JL, IK) =  &
                & ZTENWB(JL, IK) + (CUADJTQ_ZOEALFA*YDTHF%RALVDCP + (1.0_JPRB - CUADJTQ_ZOEALFA)*YDTHF%RALSDCP)*CUADJTQ_ZCOND
                ZQENWB(JL, IK) = ZQENWB(JL, IK) - CUADJTQ_ZCOND
                CUADJTQ_ZTARG = ZTENWB(JL, IK)
                CUADJTQ_ZOEALFA = 0.5_JPRB*(TANH(YDEPHLI%RLPAL1*(CUADJTQ_ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB)
                ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4LES))
                ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(CUADJTQ_ZTARG - YDCST%RTT) / (CUADJTQ_ZTARG - YDTHF%R4IES))
                ZQSAT = ZQP*(CUADJTQ_ZOEALFA*ZFOEEWL + (1.0_JPRB - CUADJTQ_ZOEALFA)*ZFOEEWI)
                Z1S = TANH(YDEPHLI%RLPAL2*(ZQSAT - ZQMAX))
                ZQSAT = 0.5_JPRB*((1.0_JPRB - Z1S)*ZQSAT + (1.0_JPRB + Z1S)*ZQMAX)
                
                ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
                ZQSAT = ZQSAT*ZCOR
                
                Z2S = CUADJTQ_ZOEALFA*YDTHF%R5ALVCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4LES)**2) + (1.0_JPRB - CUADJTQ_ZOEALFA) &
                & *YDTHF%R5ALSCP*(1.0_JPRB / (CUADJTQ_ZTARG - YDTHF%R4IES)**2)
                ZCOND1 = (ZQENWB(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*Z2S)
                
                ZTENWB(JL, IK) =  &
                & ZTENWB(JL, IK) + (CUADJTQ_ZOEALFA*YDTHF%RALVDCP + (1.0_JPRB - CUADJTQ_ZOEALFA)*YDTHF%RALSDCP)*ZCOND1
                
                ZQENWB(JL, IK) = ZQENWB(JL, IK) - ZCOND1
              END IF
            END IF
            
            
            
            
            !*********************************************
          END IF
          !*********************************************
          
          
          !IF (LHOOK) CALL DR_HOOK('CUADJTQ',1,ZHOOK_HANDLE)
          
          ! =========================================
          
          !     2.2          DO MIXING OF CUMULUS AND ENVIRONMENTAL AIR
          !                  AND CHECK FOR NEGATIVE BUOYANCY.
          !                  THEN SET VALUES FOR DOWNDRAFT AT LFS.
          !                  ----------------------------------------
          
          !DIR$ IVDEP
          !OCL NOVREC
          IF (LLO2) THEN
            ZTTEST = 0.5_JPRB*(PTU(JL, JK) + ZTENWB(JL, JK))
            ZQTEST = 0.5_JPRB*(PQU(JL, JK) + ZQENWB(JL, JK))
            ZBUO = ZTTEST*(1.0_JPRB + YDCST%RETV*ZQTEST) - PTENH(JL, JK)*(1.0_JPRB + YDCST%RETV*PQENH(JL, JK))
            ZCOND = PQENH(JL, JK) - ZQENWB(JL, JK)
            ZMFTOP = -YDECUMF%RMFDEPS*PMFUB(JL)
            IF (ZBUO < 0.0_JPRB .and. PRFL(JL) > 10._JPRB*ZMFTOP*ZCOND) THEN
              KDTOP(JL) = JK
              LDDRAF(JL) = .true.
              PTD(JL, JK) = ZTTEST
              PQD(JL, JK) = ZQTEST
              PMFD(JL, JK) = ZMFTOP
              PMFDS(JL, JK) = PMFD(JL, JK)*(YDCST%RCPD*PTD(JL, JK) + PGEOH(JL, JK))
              PMFDQ(JL, JK) = PMFD(JL, JK)*PQD(JL, JK)
              PDMFDP(JL, JK - 1) = -0.5_JPRB*PMFD(JL, JK)*ZCOND
              PRFL(JL) = PRFL(JL) + PDMFDP(JL, JK - 1)
            END IF
          END IF
          
          ! 290   continue
        END DO
        
        !300  CONTINUE
      END IF
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUDLFSN_LOKI
END MODULE CUDLFSN_LOKI_MOD
