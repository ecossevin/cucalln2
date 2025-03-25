MODULE CUDDRAFN_LOKI_MOD
  CONTAINS
  SUBROUTINE CUDDRAFN_LOKI (YDCST, YDTHF, YDEPHLI, YDECUMF, KIDIA, KFDIA, KLON, KLEV, LDDRAF, PTENH, PQENH, PQSEN, PGEO, PGEOH,  &
  & PAPH, PRFL, PTD, PQD, PMFU, PMFD, PMFDS, PMFDQ, PDMFDP, PDMFDE, PMFDDE_RATE, PKINED, YDSTACK_L)
    
    !          THIS ROUTINE CALCULATES CUMULUS DOWNDRAFT DESCENT
    
    !          PURPOSE.
    !          --------
    !          TO PRODUCE THE VERTICAL PROFILES FOR CUMULUS DOWNDRAFTS
    !          (I.E. T,Q,U AND V AND FLUXES)
    
    !          INTERFACE
    !          ---------
    
    !          THIS ROUTINE IS CALLED FROM *CUMASTR*.
    !          INPUT IS T,Q,P,PHI,U,V AT HALF LEVELS.
    !          IT RETURNS FLUXES OF S,Q AND EVAPORATION RATE
    !          AND U,V AT LEVELS WHERE DOWNDRAFT OCCURS
    
    !          METHOD.
    !          --------
    !          CALCULATE MOIST DESCENT FOR ENTRAINING/DETRAINING PLUME BY
    !          A) MOVING AIR DRY-ADIABATICALLY TO NEXT LEVEL BELOW AND
    !          B) CORRECTING FOR EVAPORATION TO OBTAIN SATURATED STATE.
    
    !     PARAMETER     DESCRIPTION                                   UNITS
    !     ---------     -----------                                   -----
    !     INPUT PARAMETERS (INTEGER):
    
    !    *KIDIA*        START POINT
    !    *KFDIA*        END POINT
    !    *KLON*         NUMBER OF GRID POINTS PER PACKET
    !    *KLEV*         NUMBER OF LEVELS
    
    !    INPUT PARAMETERS (LOGICAL):
    
    !    *LDDRAF*       .TRUE. IF DOWNDRAFTS EXIST
    
    !    INPUT PARAMETERS (REAL):
    
    !    *PTENH*        ENV. TEMPERATURE (T+1) ON HALF LEVELS          K
    !    *PQENH*        ENV. SPEC. HUMIDITY (T+1) ON HALF LEVELS     KG/KG
    !    *PQSEN*        ENV. SATUR. SPEC. HUMIDITY (T+1)             KG/KG
    !    *PGEO*         GEOPOTENTIAL                                  M2/S2
    !    *PGEOH*        GEOPOTENTIAL ON HALF LEVELS                  M2/S2
    !    *PAPH*         PROVISIONAL PRESSURE ON HALF LEVELS           PA
    !    *PMFU*         MASSFLUX UPDRAFTS                           KG/(M2*S)
    
    !    UPDATED PARAMETERS (REAL):
    
    !    *PRFL*         PRECIPITATION RATE                           KG/(M2*S)
    
    !    OUTPUT PARAMETERS (REAL):
    
    !    *PTD*          TEMPERATURE IN DOWNDRAFTS                      K
    !    *PQD*          SPEC. HUMIDITY IN DOWNDRAFTS                 KG/KG
    !    *PMFD*         MASSFLUX IN DOWNDRAFTS                       KG/(M2*S)
    !    *PMFDS*        FLUX OF DRY STATIC ENERGY IN DOWNDRAFTS       J/(M2*S)
    !    *PMFDQ*        FLUX OF SPEC. HUMIDITY IN DOWNDRAFTS         KG/(M2*S)
    !    *PDMFDP*       FLUX DIFFERENCE OF PRECIP. IN DOWNDRAFTS     KG/(M2*S)
    !    *PMFDDE_RATE*  DOWNDRAFT DETRAINMENT RATE                   KG/(M2*S)
    !    *PKINED*       DOWNDRAFT KINETIC ENERGY                     M2/S2
    
    !          EXTERNALS
    !          ---------
    !          *CUADJTQ* FOR ADJUSTING T AND Q DUE TO EVAPORATION IN
    !          SATURATED DESCENT
    
    !          REFERENCE
    !          ---------
    !          (TIEDTKE,1989)
    
    !     AUTHOR.
    !     -------
    !      M.TIEDTKE         E.C.M.W.F.    12/86 MODIF. 12/89
    
    !     MODIFICATIONS.
    !     --------------
    !      03-08-28 : Clean-up detrainment rates   P. BECHTOLD
    !      M.Hamrud      01-Oct-2003 CY28 Cleaning
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !----------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE YOEPHLI, ONLY: TEPHLI
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOETHF, ONLY: TTHF
    USE YOECUMF, ONLY: TECUMF
    
    IMPLICIT NONE
    
    TYPE(TCST), INTENT(IN) :: YDCST
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TECUMF), INTENT(IN) :: YDECUMF
    TYPE(TEPHLI), INTENT(IN) :: YDEPHLI
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    LOGICAL, INTENT(IN) :: LDDRAF(KLON)
    REAL(KIND=JPRB), INTENT(IN) :: PTENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQENH(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PQSEN(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEO(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PGEOH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(IN) :: PAPH(KLON, KLEV + 1)
    REAL(KIND=JPRB), INTENT(INOUT) :: PRFL(KLON)
    REAL(KIND=JPRB), INTENT(INOUT) :: PTD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PQD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PMFU(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFD(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFDS(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(INOUT) :: PMFDQ(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PDMFDP(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PDMFDE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PMFDDE_RATE(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PKINED(KLON, KLEV)
    REAL(KIND=JPRB) :: ZDMFEN, ZDMFDE, ZCOND, ZOENTR, ZBUOY
    REAL(KIND=JPRB) :: ZPH
    LOGICAL :: LLO2
    INTEGER(KIND=JPIM) :: IK, IS, ITOPDE, JK, JL
    
    REAL(KIND=JPRB) :: ZBUO, ZBUOYZ, ZBUOYV, ZDMFDP, ZDZ, ZENTR, ZMFDQK, ZMFDSK, ZQDDE, ZQEEN, ZRAIN, ZSDDE, ZSEEN, ZZENTR, ZRG,  &
    & ZFACBUO, Z_CWDRAG, ZDKBUO, ZDKEN
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    REAL(KIND=JPRB) :: Z1S, Z2S, CUADJTQ_ZCOND, ZCOND1, ZCOR, ZFOEEWI, ZFOEEWL, ZOEALFA, ZQMAX, ZQSAT, ZTARG, ZQP
    REAL(KIND=JPRB) :: ZL, ZI, ZF
    LOGICAL :: LLFLAG
    REAL(KIND=JPHOOK) :: CUADJTQ_ZHOOK_HANDLE
#include "abor1.intfb.h"
#include "fcttre.func.h"
#include "cuadjtq.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    YLSTACK_L = YDSTACK_L
!$acc data present( LDDRAF, PTENH, PQENH, PQSEN, PGEO, PGEOH, PAPH, PRFL, PTD, PQD, PMFU, PMFD, PMFDS, PMFDQ, PDMFDP, PDMFDE,  &
!$acc & PMFDDE_RATE, PKINED, YDCST, YDTHF, YDEPHLI, YDECUMF )
    
    ITOPDE = YDECUMF%NJKT3
    ZRG = 1.0_JPRB / YDCST%RG
    ZFACBUO = 0.5_JPRB / (1.0_JPRB + 0.5_JPRB)
    Z_CWDRAG = (3._JPRB / 8._JPRB)*0.506_JPRB / 0.2_JPRB
    !----------------------------------------------------------------------
    
    !     1.           CALCULATE MOIST DESCENT FOR CUMULUS DOWNDRAFT BY
    !                     (A) CALCULATING ENTRAINMENT/DETRAINMENT RATES,
    !                         INCLUDING ORGANIZED ENTRAINMENT DEPENDENT ON
    !                         NEGATIVE BUOYANCY AND ASSUMING
    !                         LINEAR DECREASE OF MASSFLUX IN PBL
    !                     (B) DOING MOIST DESCENT - EVAPORATIVE COOLING
    !                         AND MOISTENING IS CALCULATED IN *CUADJTQ*
    !                     (C) CHECKING FOR NEGATIVE BUOYANCY AND
    !                         SPECIFYING FINAL T,Q,U,V AND DOWNWARD FLUXES
    !                    -------------------------------------------------
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      ZOENTR = 0.0_JPRB
      ZBUOY = 0.0_JPRB
      ZDMFEN = 0.0_JPRB
      ZDMFDE = 0.0_JPRB
      PDMFDE(JL, :) = 0.0_JPRB
      PMFDDE_RATE(JL, :) = 0.0_JPRB
      PKINED(JL, :) = 0.0_JPRB
      
!$acc loop seq
      DO JK=3,KLEV
        IS = 0
        ZPH = PAPH(JL, JK)
        LLO2 = LDDRAF(JL) .and. PMFD(JL, JK - 1) < 0.0_JPRB
        IF (LLO2) THEN
          IS = IS + 1
        END IF
        IF (IS == 0) CYCLE
        
        IF (LLO2) THEN
          ZENTR = YDECUMF%ENTRDD*PMFD(JL, JK - 1)*(PGEOH(JL, JK - 1) - PGEOH(JL, JK))*ZRG
          ! &*(1.6_JPRB-MIN(1.0_JPRB,PQENH(JL,JK-1)/PQSEN(JL,JK)))
          ZDMFEN = ZENTR
          ZDMFDE = ZENTR
        END IF
        
        IF (JK > ITOPDE) THEN
          IF (LLO2) THEN
            ZDMFEN = 0.0_JPRB
            ZDMFDE = PMFD(JL, ITOPDE)*(PAPH(JL, JK) - PAPH(JL, JK - 1)) / (PAPH(JL, KLEV + 1) - PAPH(JL, ITOPDE))
          END IF
        END IF
        
        IF (JK <= ITOPDE) THEN
          IF (LLO2) THEN
            ZDZ = -(PGEOH(JL, JK - 1) - PGEOH(JL, JK))*ZRG
            ZZENTR = ZOENTR*ZDZ*PMFD(JL, JK - 1)
            ZDMFEN = ZDMFEN + ZZENTR
            ZDMFEN = MAX(ZDMFEN, 0.3_JPRB*PMFD(JL, JK - 1))
            ZDMFEN = MAX(ZDMFEN, -0.75_JPRB*PMFU(JL, JK) - (PMFD(JL, JK - 1) - ZDMFDE))
            ZDMFEN = MIN(ZDMFEN, 0.0_JPRB)
          END IF
          
          PDMFDE(JL, JK) = ZDMFEN - ZDMFDE
          
        END IF
        IF (LLO2) THEN
          PMFD(JL, JK) = PMFD(JL, JK - 1) + ZDMFEN - ZDMFDE
          ZSEEN = (YDCST%RCPD*PTENH(JL, JK - 1) + PGEOH(JL, JK - 1))*ZDMFEN
          ZQEEN = PQENH(JL, JK - 1)*ZDMFEN
          ZSDDE = (YDCST%RCPD*PTD(JL, JK - 1) + PGEOH(JL, JK - 1))*ZDMFDE
          ZQDDE = PQD(JL, JK - 1)*ZDMFDE
          ZMFDSK = PMFDS(JL, JK - 1) + ZSEEN - ZSDDE
          ZMFDQK = PMFDQ(JL, JK - 1) + ZQEEN - ZQDDE
          PQD(JL, JK) = ZMFDQK*(1.0_JPRB / MIN(-YDECUMF%RMFCMIN, PMFD(JL, JK)))
          PTD(JL, JK) = (ZMFDSK*(1.0_JPRB / MIN(-YDECUMF%RMFCMIN, PMFD(JL, JK))) - PGEOH(JL, JK)) / YDCST%RCPD
          PTD(JL, JK) = MIN(400._JPRB, PTD(JL, JK))
          PTD(JL, JK) = MAX(100._JPRB, PTD(JL, JK))
          ZCOND = PQD(JL, JK)
        END IF
        
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
            ZQSAT = FOEEWMCU(PTD(JL, IK))*ZQP
            ZQSAT = MIN(0.5_JPRB, ZQSAT)
            ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
            ZQSAT = ZQSAT*ZCOR
            CUADJTQ_ZCOND = (PQD(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*FOEDEMCU(PTD(JL, IK)))
            CUADJTQ_ZCOND = MIN(CUADJTQ_ZCOND, 0.0_JPRB)
            PTD(JL, IK) = PTD(JL, IK) + FOELDCPMCU(PTD(JL, IK))*CUADJTQ_ZCOND
            PQD(JL, IK) = PQD(JL, IK) - CUADJTQ_ZCOND
            ZQSAT = FOEEWMCU(PTD(JL, IK))*ZQP
            ZQSAT = MIN(0.5_JPRB, ZQSAT)
            ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
            ZQSAT = ZQSAT*ZCOR
            ZCOND1 = (PQD(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*FOEDEMCU(PTD(JL, IK)))
            IF (CUADJTQ_ZCOND == 0.0_JPRB) ZCOND1 = MIN(ZCOND1, 0.0_JPRB)
            PTD(JL, IK) = PTD(JL, IK) + FOELDCPMCU(PTD(JL, IK))*ZCOND1
            PQD(JL, IK) = PQD(JL, IK) - ZCOND1
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
            
            ZTARG = PTD(JL, IK)
            ZOEALFA = 0.5_JPRB*(TANH(YDEPHLI%RLPAL1*(ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB)
            ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4LES))
            ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4IES))
            ZQSAT = ZQP*(ZOEALFA*ZFOEEWL + (1.0_JPRB - ZOEALFA)*ZFOEEWI)
            Z1S = TANH(YDEPHLI%RLPAL2*(ZQSAT - ZQMAX))
            ZQSAT = 0.5_JPRB*((1.0_JPRB - Z1S)*ZQSAT + (1.0_JPRB + Z1S)*ZQMAX)
            
            ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
            ZQSAT = ZQSAT*ZCOR
            
            Z2S = ZOEALFA*YDTHF%R5ALVCP*(1.0_JPRB / (ZTARG - YDTHF%R4LES)**2) + (1.0_JPRB - ZOEALFA)*YDTHF%R5ALSCP*(1.0_JPRB /  &
            & (ZTARG - YDTHF%R4IES)**2)
            CUADJTQ_ZCOND = (PQD(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*Z2S)
            
            CUADJTQ_ZCOND = MIN(CUADJTQ_ZCOND, 0.0_JPRB)
            
            IF (CUADJTQ_ZCOND /= 0.0_JPRB) THEN
              
              PTD(JL, IK) = PTD(JL, IK) + (ZOEALFA*YDTHF%RALVDCP + (1.0_JPRB - ZOEALFA)*YDTHF%RALSDCP)*CUADJTQ_ZCOND
              PQD(JL, IK) = PQD(JL, IK) - CUADJTQ_ZCOND
              ZTARG = PTD(JL, IK)
              ZOEALFA = 0.5_JPRB*(TANH(YDEPHLI%RLPAL1*(ZTARG - YDEPHLI%RLPTRC)) + 1.0_JPRB)
              ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4LES))
              ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4IES))
              ZQSAT = ZQP*(ZOEALFA*ZFOEEWL + (1.0_JPRB - ZOEALFA)*ZFOEEWI)
              Z1S = TANH(YDEPHLI%RLPAL2*(ZQSAT - ZQMAX))
              ZQSAT = 0.5_JPRB*((1.0_JPRB - Z1S)*ZQSAT + (1.0_JPRB + Z1S)*ZQMAX)
              
              ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQSAT)
              ZQSAT = ZQSAT*ZCOR
              
              Z2S = ZOEALFA*YDTHF%R5ALVCP*(1.0_JPRB / (ZTARG - YDTHF%R4LES)**2) + (1.0_JPRB - ZOEALFA)*YDTHF%R5ALSCP*(1.0_JPRB /  &
              & (ZTARG - YDTHF%R4IES)**2)
              ZCOND1 = (PQD(JL, IK) - ZQSAT) / (1.0_JPRB + ZQSAT*ZCOR*Z2S)
              
              PTD(JL, IK) = PTD(JL, IK) + (ZOEALFA*YDTHF%RALVDCP + (1.0_JPRB - ZOEALFA)*YDTHF%RALSDCP)*ZCOND1
              
              PQD(JL, IK) = PQD(JL, IK) - ZCOND1
            END IF
          END IF
          
          
          
          
          !*********************************************
        END IF
        !*********************************************
        
        
        !IF (LHOOK) CALL DR_HOOK('CUADJTQ',1,ZHOOK_HANDLE)
        
        ! =========================================
        
        IF (LLO2) THEN
          ZCOND = ZCOND - PQD(JL, JK)
          ZBUO = PTD(JL, JK)*(1.0_JPRB + YDCST%RETV*PQD(JL, JK)) - PTENH(JL, JK)*(1.0_JPRB + YDCST%RETV*PQENH(JL, JK))
          IF (PRFL(JL) > 0.0_JPRB .and. PMFU(JL, JK) > 0.0_JPRB) THEN
            ZRAIN = PRFL(JL) / PMFU(JL, JK)
            ZBUO = ZBUO - PTD(JL, JK)*ZRAIN
          END IF
          IF (ZBUO >= 0.0_JPRB .or. PRFL(JL) <= PMFD(JL, JK)*ZCOND) THEN
            PMFD(JL, JK) = 0.0_JPRB
            ZBUO = 0.0_JPRB
          END IF
          PMFDS(JL, JK) = (YDCST%RCPD*PTD(JL, JK) + PGEOH(JL, JK))*PMFD(JL, JK)
          PMFDQ(JL, JK) = PQD(JL, JK)*PMFD(JL, JK)
          ZDMFDP = -PMFD(JL, JK)*ZCOND
          PDMFDP(JL, JK - 1) = ZDMFDP
          PRFL(JL) = PRFL(JL) + ZDMFDP
          
          ! COMPUTE ORGANIZED ENTRAINMENT FOR USE AT NEXT LEVEL
          
          ZBUOYZ = ZBUO / PTENH(JL, JK)
          ZBUOYV = ZBUOYZ
          ZBUOYZ = MIN(ZBUOYZ, 0.0_JPRB)
          ZDZ = -(PGEO(JL, JK - 1) - PGEO(JL, JK))
          ZBUOY = ZBUOY + ZBUOYZ*ZDZ
          ZOENTR = YDCST%RG*ZBUOYZ*0.5_JPRB / (1.0_JPRB + ZBUOY)
          
          ! STORE DOWNDRAUGHT DETRAINMENT RATES
          
          PMFDDE_RATE(JL, JK) = -ZDMFDE
          
          ! COMPUTE KINETIC ENERGY
          
          ZDKBUO = ZDZ*ZBUOYV*ZFACBUO
          IF (ZDMFEN < 0.0_JPRB) THEN
            ZDKEN = MIN(1.0_JPRB, (1 + Z_CWDRAG)*ZDMFEN / MIN(-YDECUMF%RMFCMIN, PMFD(JL, JK - 1)))
          ELSE
            ZDKEN = MIN(1.0_JPRB, (1 + Z_CWDRAG)*ZDMFDE / MIN(-YDECUMF%RMFCMIN, PMFD(JL, JK - 1)))
          END IF
          PKINED(JL, JK) = MAX(0.0_JPRB, (PKINED(JL, JK - 1)*(1 - ZDKEN) + ZDKBUO) / (1 + ZDKEN))
          
        END IF
        
      END DO
    END DO
    
    
    
!$acc end data
  END SUBROUTINE CUDDRAFN_LOKI
END MODULE CUDDRAFN_LOKI_MOD
