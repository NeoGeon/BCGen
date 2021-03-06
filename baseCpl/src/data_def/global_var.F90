module global_var
use shr_kind_mod
use mct_mod
use type_def
use proc_def
use field_def
   implicit none
   type Meta
       type(fldsMeta)    :: fldsMetaData
       type(procMeta)    :: my_proc
       type(confMeta)    :: conf
       type(compMeta)    :: lnd
       type(mct_gsMap) :: comp_gsmap_lndx
       type(compMeta)    :: atm
       type(mct_gsMap) :: comp_gsmap_atmx
       type(compMeta)    :: rof
       type(mct_gsMap) :: comp_gsmap_rofx
       type(compMeta)    :: ice
       type(mct_gsMap) :: comp_gsmap_icex
       type(compMeta)    :: ocn
       type(mct_gsMap) :: comp_gsmap_ocnx
       character(SHR_KIND_CL) :: datanml
       character(SHR_KIND_CL) :: datarc
       character(SHR_KIND_CL) :: case_name
       !-----------------------------------------
       ! meta desc of proc and comps
       !-----------------------------------------
       integer  :: num_comms
       integer  :: num_models
       integer  :: my_rank
       integer  :: ncomps = 12

       !-----------------------------------------
       !  comp id
       !-----------------------------------------
       integer    ::  gloid = 1
       integer    ::  cplid = 2
       integer   :: modellnd_id = 3
       integer   :: modellnd2cpl_id = 8
       integer   :: modelatm_id = 4
       integer   :: modelatm2cpl_id = 9
       integer   :: modelrof_id = 5
       integer   :: modelrof2cpl_id = 10
       integer   :: modelice_id = 6
       integer   :: modelice2cpl_id = 11
       integer   :: modelocn_id = 7
       integer   :: modelocn2cpl_id = 12

       !-------------------------------------------
       ! used for mct_init
       !-------------------------------------------
       integer, allocatable  :: comp_comm(:)
       integer, allocatable  :: comp_id(:)
       logical, pointer      :: iamin_model(:)
       character(SHR_KIND_CL), allocatable :: comp_name(:)
       integer, allocatable  :: comp_comm_iam(:)

       !------------------------------------------
       !   intermediate vars
       !------------------------------------------
       type(mct_aVect)   :: lnd2x_lndlnd
       type(mct_aVect)   :: lnd2x_lndx
       type(mct_aVect)   :: x2lnd_lndlnd
       type(mct_aVect)   :: x2lnd_lndx
       type(mct_gGrid)      :: domain_lndx
       type(mct_gGrid)      :: domain_lndlnd
       type(map_mod)    :: Mapper_Clnd2x
       type(map_mod)    :: Mapper_Cx2lnd
       type(mct_aVect)   :: atm2x_atmatm
       type(mct_aVect)   :: atm2x_atmx
       type(mct_aVect)   :: x2atm_atmatm
       type(mct_aVect)   :: x2atm_atmx
       type(mct_gGrid)      :: domain_atmx
       type(mct_gGrid)      :: domain_atmatm
       type(map_mod)    :: Mapper_Catm2x
       type(map_mod)    :: Mapper_Cx2atm
       type(mct_aVect)   :: rof2x_rofrof
       type(mct_aVect)   :: rof2x_rofx
       type(mct_aVect)   :: x2rof_rofrof
       type(mct_aVect)   :: x2rof_rofx
       type(mct_gGrid)      :: domain_rofx
       type(mct_gGrid)      :: domain_rofrof
       type(map_mod)    :: Mapper_Crof2x
       type(map_mod)    :: Mapper_Cx2rof
       type(mct_aVect)   :: ice2x_iceice
       type(mct_aVect)   :: ice2x_icex
       type(mct_aVect)   :: x2ice_iceice
       type(mct_aVect)   :: x2ice_icex
       type(mct_gGrid)      :: domain_icex
       type(mct_gGrid)      :: domain_iceice
       type(map_mod)    :: Mapper_Cice2x
       type(map_mod)    :: Mapper_Cx2ice
       type(mct_aVect)   :: ocn2x_ocnocn
       type(mct_aVect)   :: ocn2x_ocnx
       type(mct_aVect)   :: x2ocn_ocnocn
       type(mct_aVect)   :: x2ocn_ocnx
       type(mct_gGrid)      :: domain_ocnx
       type(mct_gGrid)      :: domain_ocnocn
       type(map_mod)    :: Mapper_Cocn2x
       type(map_mod)    :: Mapper_Cx2ocn

       !---------------------------------------------
       !  define relative comm
       !---------------------------------------------
       integer    :: mpi_glocomm
       integer    :: mpi_cpl
       integer    :: mpi_modellnd
       integer    :: mpi_modellnd2cpl
       integer    :: mpi_modelatm
       integer    :: mpi_modelatm2cpl
       integer    :: mpi_modelrof
       integer    :: mpi_modelrof2cpl
       integer    :: mpi_modelice
       integer    :: mpi_modelice2cpl
       integer    :: mpi_modelocn
       integer    :: mpi_modelocn2cpl
       
       logical    :: iam_root
       logical    :: iamin_cpl
       logical    :: iamroot_cpl

       logical    :: iamin_modellnd
       logical    :: iamin_modellnd2cpl
       logical    :: iamroot_modellnd
       logical    :: iamroot_modellnd2cpl
       logical    :: lnd_run
       logical    :: iamin_modelatm
       logical    :: iamin_modelatm2cpl
       logical    :: iamroot_modelatm
       logical    :: iamroot_modelatm2cpl
       logical    :: atm_run
       logical    :: iamin_modelrof
       logical    :: iamin_modelrof2cpl
       logical    :: iamroot_modelrof
       logical    :: iamroot_modelrof2cpl
       logical    :: rof_run
       logical    :: iamin_modelice
       logical    :: iamin_modelice2cpl
       logical    :: iamroot_modelice
       logical    :: iamroot_modelice2cpl
       logical    :: ice_run
       logical    :: iamin_modelocn
       logical    :: iamin_modelocn2cpl
       logical    :: iamroot_modelocn
       logical    :: iamroot_modelocn2cpl
       logical    :: ocn_run

       
       type(map_mod)   :: mapper_Smatatm2ice
       type(map_mod)   :: mapper_Smatatm2lnd
       type(map_mod)   :: mapper_Smatocn2atm
       type(map_mod)   :: mapper_Smatlnd2rof
       type(map_mod)   :: mapper_Smatatm2ocn
       type(map_mod)   :: mapper_Smatice2atm
       type(map_mod)   :: mapper_Smatlnd2atm
       type(map_mod)   :: mapper_Smatrof2lnd

       character(SHR_KIND_CXX) :: flds_x2ocn 
       character(SHR_KIND_CXX) :: flds_x2rof_fluxes 
       character(SHR_KIND_CXX) :: flds_rof2x_states 
       character(SHR_KIND_CXX) :: flds_xao_fluxes 
       character(SHR_KIND_CXX) :: flds_x2ice_fluxes 
       character(SHR_KIND_CXX) :: flds_rof2x 
       character(SHR_KIND_CXX) :: flds_dom 
       character(SHR_KIND_CXX) :: flds_ice2x 
       character(SHR_KIND_CXX) :: flds_x2rof_states 
       character(SHR_KIND_CXX) :: flds_atm2x_fluxes 
       character(SHR_KIND_CXX) :: flds_ice2x_states 
       character(SHR_KIND_CXX) :: flds_x2ice 
       character(SHR_KIND_CXX) :: flds_dom_coord 
       character(SHR_KIND_CXX) :: flds_atm2x_states 
       character(SHR_KIND_CXX) :: flds_x2ocn_states 
       character(SHR_KIND_CXX) :: flds_x2atm 
       character(SHR_KIND_CXX) :: flds_lnd2x 
       character(SHR_KIND_CXX) :: flds_xao_fields 
       character(SHR_KIND_CXX) :: flds_ice2x_fluxes 
       character(SHR_KIND_CXX) :: flds_ocn2x_states 
       character(SHR_KIND_CXX) :: flds_x2ocn_fluxes 
       character(SHR_KIND_CXX) :: flds_x2lnd_states 
       character(SHR_KIND_CXX) :: flds_lnd2x_states 
       character(SHR_KIND_CXX) :: flds_x2ice_states 
       character(SHR_KIND_CXX) :: flds_lnd2x_fluxes 
       character(SHR_KIND_CXX) :: flds_atm2x 
       character(SHR_KIND_CXX) :: flds_ocn2x 
       character(SHR_KIND_CXX) :: flds_dom_other 
       character(SHR_KIND_CXX) :: flds_x2lnd_fluxes 
       character(SHR_KIND_CXX) :: flds_x2lnd 
       character(SHR_KIND_CXX) :: flds_x2atm_states 
       character(SHR_KIND_CXX) :: flds_rof2x_fluxes 
       character(SHR_KIND_CXX) :: flds_xao_states 
       character(SHR_KIND_CXX) :: flds_ocn2x_fluxes 
       character(SHR_KIND_CXX) :: flds_x2atm_fluxes 
       character(SHR_KIND_CXX) :: flds_x2rof 

   end type Meta
    
   type(Meta), target  :: metaData
   integer, parameter  :: gloid = 1
   integer, parameter  :: cplid = 2
   integer, parameter  :: lndid = 2
   integer, parameter  :: lnd2xid = 2+1
   integer, parameter  :: atmid = 4
   integer, parameter  :: atm2xid = 4+1
   integer, parameter  :: rofid = 6
   integer, parameter  :: rof2xid = 6+1
   integer, parameter  :: iceid = 8
   integer, parameter  :: ice2xid = 8+1
   integer, parameter  :: ocnid = 10
   integer, parameter  :: ocn2xid = 10+1

end module global_var
