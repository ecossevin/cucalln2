! (C) Copyright 1996- ECMWF.
!
! This software is licensed under the terms of the Apache Licence Version 2.0
! which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
!
! In applying this licence, ECMWF does not waive the privileges and immunities
! granted to it by virtue of its status as an intergovernmental organisation
! nor does it submit to any jurisdiction.
MODULE SATUR_LOKI_MOD
  CONTAINS
  SUBROUTINE SATUR_LOKI (YDTHF, YDCST, KIDIA, KFDIA, KLON, KTDIA, KLEV, LDPHYLIN, PAPRSF, PT, PQSAT, KFLAG, YDSTACK_L)
    
    !***
    
    ! **   *SATUR* -  COMPUTES SPECIFIC HUMIDITY AT SATURATION
    
    !       J.F. MAHFOUF       E.C.M.W.F.     15/05/96
    
    !       Modified J. HAGUE          13/01/03 MASS Vector Functions
    
    !       PURPOSE.
    !       --------
    
    !       SPECIFIC HUMIDITY AT SATURATION IS USED BY THE
    !       DIAGNOSTIC CLOUD SCHEME TO COMPUTE RELATIVE HUMIDITY
    !       AND LIQUID WATER CONTENT
    
    !       INTERFACE
    !       ---------
    
    !       THIS ROUTINE IS CALLED FROM *CALLPAR*.
    
    !       PARAMETER     DESCRIPTION                                 UNITS
    !       ---------     -----------                                 -----
    !       INPUT PARAMETERS (INTEGER):
    
    !      *KIDIA*        START POINT
    !      *KFDIA*        END POINT
    !      *KLON*         NUMBER OF GRID POINTS PER PACKET
    !      *KTDIA*        START OF THE VERTICAL LOOP
    !      *KLEV*         NUMBER OF LEVELS
    
    !       INPUT PARAMETERS (REAL):
    
    !      *PAPRSF*        PRESSURE ON FULL LEVELS                      PA
    !      *PT*            TEMPERATURE AT T-DT                          K
    
    !       INPUT PARAMETERS (INTEGER):
    
    !      *KFLAG*         FLAG TO DETECT CALL FROM
    
    !                      CONVECTION  KFLAG=1
    !                      OTHER       KFLAG=2
    
    !       OUTPUT PARAMETER (REAL):
    
    !      *PQSAT*         SATURATION SPECIFIC HUMIDITY                 KG/KG
    
    !     R. El Khatib 22-Jun-2022 A contribution to simplify phasing after the refactoring of YOMCLI/YOMCST/YOETHF.
    !-------------------------------------------------------------------------
    
    USE, intrinsic :: ISO_FORTRAN_ENV, ONLY: REAL64
    USE, intrinsic :: ISO_C_BINDING, ONLY: C_SIZEOF
    USE PARKIND1, ONLY: JPIM, JPRB
    USE YOMHOOK, ONLY: LHOOK, JPHOOK
    
    USE YOMCST, ONLY: TCST
    USE YOETHF, ONLY: TTHF
    
    IMPLICIT NONE
    
    TYPE(TTHF), INTENT(IN) :: YDTHF
    TYPE(TCST), INTENT(IN) :: YDCST
    INTEGER(KIND=JPIM), INTENT(IN) :: KIDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KFDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KLON
    INTEGER(KIND=JPIM), INTENT(IN) :: KTDIA
    INTEGER(KIND=JPIM), INTENT(IN) :: KLEV
    LOGICAL, INTENT(IN) :: LDPHYLIN
    REAL(KIND=JPRB), INTENT(IN) :: PAPRSF(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(IN) :: PT(KLON, KLEV)
    REAL(KIND=JPRB), INTENT(OUT) :: PQSAT(KLON, KLEV)
    INTEGER(KIND=JPIM), INTENT(IN) :: KFLAG
    INTEGER(KIND=JPIM) :: JK, JL
    
    REAL(KIND=JPRB) :: ZCOR, ZEW, ZFOEEW, ZQMAX, ZQS, ZTARG
    REAL(KIND=JPRB) :: ZALFA, ZFOEEWL, ZFOEEWI
    REAL(KIND=JPHOOK) :: ZHOOK_HANDLE
    
    !DIR$ VFUNCTION EXPHF
    
#include "fcttre.func.h"
!$acc routine vector
    INTEGER(KIND=8) :: YLSTACK_L
    INTEGER(KIND=8), INTENT(INOUT) :: YDSTACK_L
    YLSTACK_L = YDSTACK_L
!$acc data present( PAPRSF, PT, PQSAT, YDTHF, YDCST )
    
    !----------------------------------------------------------------------
    
    !*    1.           DEFINE CONSTANTS
    !                  ----------------
    
    
    ZQMAX = 0.5_JPRB
    
    !     *
    !----------------------------------------------------------------------
    
    !     *    2.           CALCULATE SATURATION SPECIFIC HUMIDITY
    !                       --------------------------------------
    
    
!$acc loop vector
    DO JL=KIDIA,KFDIA
      IF (LDPHYLIN) THEN
!$acc loop seq
        DO JK=KTDIA,KLEV
          ZTARG = PT(JL, JK)
          ZALFA = FOEALFA(ZTARG)
          
          ZFOEEWL = YDTHF%R2ES*EXP(YDTHF%R3LES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4LES))
          ZFOEEWI = YDTHF%R2ES*EXP(YDTHF%R3IES*(ZTARG - YDCST%RTT) / (ZTARG - YDTHF%R4IES))
          ZFOEEW = ZALFA*ZFOEEWL + (1.0_JPRB - ZALFA)*ZFOEEWI
          
          ZQS = ZFOEEW / PAPRSF(JL, JK)
          IF (ZQS > ZQMAX) THEN
            ZQS = ZQMAX
          END IF
          ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQS)
          PQSAT(JL, JK) = ZQS*ZCOR
        END DO
      ELSE
        
!$acc loop seq
        DO JK=KTDIA,KLEV
          IF (KFLAG == 1) THEN
            ZEW = FOEEWMCU(PT(JL, JK))
          ELSE
            ZEW = FOEEWM(PT(JL, JK))
          END IF
          ZQS = ZEW / PAPRSF(JL, JK)
          ZQS = MIN(ZQMAX, ZQS)
          ZCOR = 1.0_JPRB / (1.0_JPRB - YDCST%RETV*ZQS)
          PQSAT(JL, JK) = ZQS*ZCOR
        END DO
        
      END IF
    END DO
    
    
    
!$acc end data
  END SUBROUTINE SATUR_LOKI
END MODULE SATUR_LOKI_MOD
