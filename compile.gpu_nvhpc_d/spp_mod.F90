MODULE SPP_MOD

! Purpose :
! -------
!    Define types for the SPP scheme, which represents model uncertainties
!    with Stochastically Perturbed Parameterisations.

! Interface :
! ---------
!    Empty.

! External :
! --------
!    None.

! Method :
! ------
!    See Documentation.

! Reference :
! ---------

! Author :
! ------
!    M. Leutbecher (ECMWF)
!    Original : July 2020

! Modifications :
! -------------
!    
!  
!-----------------------------------------------------------------------------

USE PARKIND1 , ONLY : JPIM, JPRB
USE YOMHOOK  , ONLY : LHOOK, DR_HOOK, JPHOOK
USE SPP_GEN_MOD, ONLY : SPP_MODEL
USE SPP_DEF_MOD, ONLY : SPP_PERT_POINTER

IMPLICIT NONE
SAVE

INTEGER(KIND=JPIM), PARAMETER :: JPSPPLABLEN=16, NWRMAX=255
!=============================================================================

!      1.    TYPE DEFINITIONS
!            ----------------

TYPE TSPP_CONFIG
  LOGICAL :: LSPP=.FALSE.        !> activates stochastically perturbed parameterisation scheme
  CHARACTER(LEN=32) :: CSPP_MODEL_NAME !> name of SPP model, selects define_spp routine
  TYPE(SPP_MODEL) :: SM          !> structure storing details of configuration
  TYPE(SPP_PERT_POINTER) :: PPTR !> perturbation pointer structure

  LOGICAL :: LRAMIDLIMIT1        !> limit perturbed value of RAMID to be <=1.

  LOGICAL :: LUSE_SETRAN=.TRUE.  !> use setran to randomize seed depending on start date, ensemble member number, ...
  LOGICAL :: LNSEED_OFFS0        !> set all seed offsets to 0 regardless of NSEED_OFFS_* given below

  ! write out pattern and reset seed
  LOGICAL            :: LRDPATINIT 
  LOGICAL            :: LWRPATTRUN
  INTEGER(KIND=JPIM) :: NWRPATTRUN
  INTEGER(KIND=JPIM), DIMENSION(NWRMAX) :: NHOUR_PATTRUN
  INTEGER(KIND=JPIM), DIMENSION(NWRMAX) :: NSTEP_PATTRUN
  LOGICAL            :: LRESETSEED 
  LOGICAL            :: LABSTIMSEED 
  INTEGER(KIND=JPIM) :: RESETSEEDFRQ
  INTEGER(KIND=JPIM) :: SHIFTSEED
  CHARACTER(LEN=256) :: SPP_RDPATINIT
  CHARACTER(LEN=256) :: SPP_WRPATTRUN

  INTEGER(JPIM) :: ISEEDFAC      !> seed factor for random numbers
  INTEGER(JPIM) :: IEZDIAG_POS   !> Location of output diagnostics in the EZDIAG array

  INTEGER(JPIM) :: NPATFR=1      !> frequency of pattern updates:
                                 !> >0: every NPATFR timesteps / <0: every -NPATFR hours

  REAL(KIND=JPRB) :: XPRESS_PHR_ST      !> pressure defining level of stratosphere, for heating rate perturbations

  ! SPG flags
  LOGICAL :: LSPG_SPP=.FALSE.    !> activates SPG as pattern generator

  REAL(KIND=JPRB) :: SPGMU       !>
  REAL(KIND=JPRB) :: SPGLAMBDA   !>
  REAL(KIND=JPRB) :: SPGSIGMA    !>
  REAL(KIND=JPRB) :: SPGQ        !>
  REAL(KIND=JPRB) :: SPGADTMIN   !>
  REAL(KIND=JPRB) :: SPGADTMAX   !>
  REAL(KIND=JPRB) :: SPGTDT      !>


END TYPE TSPP_CONFIG

!     1.2    TYPE holding the data of the spp scheme
TYPE TSPP_DATA
  INTEGER(JPIM), DIMENSION(:), ALLOCATABLE :: IGRIBCODE !> array with grib codes of pattern

  CHARACTER(LEN=JPSPPLABLEN)     , DIMENSION(:), POINTER :: LAB_ARP=>NULL() !> label to refer to ARP
END TYPE TSPP_DATA

END MODULE SPP_MOD
