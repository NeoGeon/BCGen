module mrg_mod
use shr_kind_mod, only: r8 => shr_kind_r8, CL => shr_kind_cl
use mpi
use mct_mod
use proc_def
use global_var
    implicit none
!include "mpif.h"
    public :: mrg_x2atm
    public :: mrg_x2lnd
    public :: mrg_x2ocn
    private :: getfld
    public :: mrg_x2rof
!    public :: mrg_x2rof
    public :: mrg_x2ice
!    public :: mrg_x2wav

contains

subroutine mrg_x2atm(metaData, ocn2x_atm, lnd2x_atm, ice2x_atm, xao_atm, atm2x_atm, fraction_atm,&
x2atm_atm)
    implicit none
    type(Meta),        intent(in)    :: metaData
    type(mct_aVect),   intent(in)    :: lnd2x_atm
    type(mct_aVect),   intent(in)    :: ocn2x_atm
    type(mct_aVect),   intent(in)    :: xao_atm
    type(mct_aVect),   intent(in)    :: ice2x_atm
    type(mct_aVect),   intent(in)    :: atm2x_atm
    type(mct_aVect),   intent(in)    :: fraction_atm
    type(mct_aVect),   intent(inout) :: x2atm_atm

    integer :: av_size
    integer :: nf
    integer :: i,j
    real(r8) :: fracl, fraci, fraco
    integer :: n,ka, ki, kl, ko, kx, kof, kif, klf
    integer :: lsize
    integer :: index_x2a_Sf_lfrac
    integer :: index_x2a_Sf_ifrac
    integer :: index_x2a_Sf_ofrac
    character(CL) :: field_atm
    character(CL) :: field_ocn
    character(CL) :: field_ice
    character(CL) :: field_lnd
    character(CL) :: field_xao
    character(CL) :: itemc_atm
    character(CL) :: itemc_ocn
    character(CL) :: itemc_xao
    character(CL) :: itemc_lnd
    character(CL) :: itemc_ice
    logical :: iamroot
    logical :: first_time = .true.
    logical, pointer, save :: xmerge(:), omerge(:), imerge(:), lmerge(:)
    integer, pointer, save :: oindx(:), xindx(:), iindx(:), lindx(:)
    integer,  save :: naflds, noflds, nxflds, klflds, niflds
    if(first_time)then
        naflds = mct_aVect_nRattr(x2atm_atm)
        noflds = mct_aVect_nRattr(ocn2x_atm)
        nxflds = mct_aVect_nRattr(xao_atm)
        niflds = mct_aVect_nRattr(ice2x_atm)
        klflds = mct_aVect_nRattr(lnd2x_atm)

        allocate(oindx(naflds), omerge(naflds))
        allocate(xindx(naflds), xmerge(naflds))
        allocate(lindx(naflds), lmerge(naflds))
        allocate(iindx(naflds), imerge(naflds))       

        lindx(:) = 0
        iindx(:) = 0
        oindx(:) = 0
        xindx(:) = 0
        omerge(:) = .true.
        xmerge(:) = .true.
        lmerge(:) = .true.
        imerge(:) = .true.

        
        do ka = 1, naflds
            call getfld(ka, x2atm_atm, field_atm, itemc_atm)
            if(field_atm(1:2)=='PF')then
                cycle
            end if
            if(field_atm(1:1)=='S' .and. field_atm(2:2)/='x')then
                cycle
            end if

            do kl = 1, klflds
                call getfld(kl, lnd2x_atm, field_lnd, itemc_lnd)
                if(trim(itemc_atm) == trim(itemc_lnd))then
                    if(trim(field_atm)==trim(field_lnd))then
                        if(field_lnd(1:1)=='F') lmerge(ka) = .false.
                    end if
                    lindx(ka) = kl
                    exit
                end if
            end do

            do ki = 1, niflds
                call getfld(ki, ice2x_atm, field_atm, itemc_atm)
                if(field_ice(1:1) == 'F' .and. field_ice(2:4)=='ioi')then
                    cycle
                end if
                if(trim(itemc_atm)==trim(itemc_ice))then
                    if(trim(field_atm)==trim(field_ice))then
                        if(field_ice(1:1)=='F') imerge(ka) = .false.
                    end if 
                    iindx(ka) = ki 
                    exit
                end if
            end do

            do kx = 1, nxflds
                call getfld(kx, xao_atm, field_xao, itemc_xao)
                if(trim(itemc_atm)==trim(itemc_xao))then
                    if(trim(field_atm)==trim(field_xao))then
                        if(field_xao(1:1)=='F')xmerge(ka) = .false.
                    end if
                    xindx(ka) = kx
                    exit
                end if 
            end do

            do ko = 1, noflds
                call getfld(ko, ocn2x_atm, field_ocn, itemc_ocn)
                if(trim(itemc_atm)==trim(itemc_ocn))then
                    if((trim(field_atm)==trim(field_ocn)))then
                        if(field_ocn(1:1)=='F') omerge(ka) = .false.
                    end if
                    oindx(ka) = ko
                    exit
                end if
            end do
            if(oindx(ka)==0) itemc_ocn = 'unset'
            if(xindx(ka)==0) itemc_xao = 'unset'
            if(lindx(ka)==0) itemc_lnd = 'unset'
            if(iindx(ka)==0) itemc_ice = 'unset'
        end do
        first_time = .false.
    end if 

    call mct_aVect_zero(x2atm_atm)

    kof = mct_aVect_indexRA(fraction_atm,'ofrac')
    kif = mct_aVect_indexRA(fraction_atm,'ifrac')
    klf = mct_aVect_indexRA(fraction_atm,'lfrac')
    lsize = mct_aVect_lsize(x2atm_atm)

    index_x2a_Sf_ofrac = mct_aVect_indexRA(x2atm_atm, 'Sf_ofrac')
    index_x2a_Sf_ifrac = mct_aVect_indexRA(x2atm_atm, 'Sf_ifrac')
    index_x2a_Sf_lfrac = mct_aVect_indexRA(x2atm_atm, 'Sf_lfrac')
    print *, 'index', index_x2a_Sf_ofrac, index_x2a_Sf_ifrac, index_x2a_Sf_lfrac
    do n =1, lsize
        x2atm_atm%rAttr(index_x2a_Sf_ofrac, n) = fraction_atm%Rattr(kof, n)
        x2atm_atm%rAttr(index_x2a_Sf_ifrac, n) = fraction_atm%Rattr(kif, n)
        if(n==8)print *,'the ice', fraction_atm%Rattr(kif, n)
        x2atm_atm%rAttr(index_x2a_Sf_lfrac, n) = fraction_atm%Rattr(klf, n)
    end do

    call mct_aVect_copy(aVin=ocn2x_atm, aVout=x2atm_atm, vector=mct_usevector)
    call mct_aVect_copy(aVin=xao_atm, aVout=x2atm_atm, vector=mct_usevector)
    call mct_aVect_copy(aVin=ice2x_atm, aVout=x2atm_atm, vector=mct_usevector)
    call mct_aVect_copy(aVin=lnd2x_atm, aVout=x2atm_atm, vector=mct_usevector)

    do ka = 1, naflds
        if(ka==12)print *, lindx(ka), lmerge(ka), iindx(ka), imerge(ka), xindx(ka), xmerge(ka), oindx(ka), omerge(ka)
        do n =  1, lsize
            if(ka==12 .and. n==8)print *,'then8', x2atm_atm%rAttr(ka, n)
            fraco = fraction_atm%Rattr(kof, n)
            fraci = fraction_atm%Rattr(kif, n)
            fracl = fraction_atm%Rattr(klf, n)
            if(lindx(ka)>0 .and. fracl > 0._r8)then
                if(lmerge(ka))then
                    x2atm_atm%rAttr(ka, n) = x2atm_atm%rAttr(ka, n) + lnd2x_atm%rAttr(lindx(ka), n)*fracl
                else
                    x2atm_atm%rAttr(ka, n) = lnd2x_atm%rAttr(lindx(ka), n)*fracl
                end if
            end if
            if(iindx(ka) > 0 .and. fraci > 0._r8)then
                if(imerge(ka))then
                    x2atm_atm%rAttr(ka, n) = x2atm_atm%rAttr(ka, n) + ice2x_atm%rAttr(iindx(ka), n)*fraci
                else
                    x2atm_atm%rAttr(ka, n) = ice2x_atm%rAttr(iindx(ka), n)*fraci
                end if
            end if
            if(xindx(ka) > 0 .and. fraco > 0._r8)then
                if (xmerge(ka))then
                    x2atm_atm%rAttr(ka, n) = x2atm_atm%rAttr(ka, n) + xao_atm%rAttr(xindx(ka), n)*fraco
                else
                    x2atm_atm%rAttr(ka, n) = x2atm_atm%rAttr(xindx(ka), n) * fraco
                end if
            end if
            if(oindx(ka) >0)then
                if(omerge(ka) .and. fraco>0._r8)then
                    x2atm_atm%rAttr(ka, n) = x2atm_atm%rAttr(ka,n) + ocn2x_atm%rAttr(oindx(ka),n)*fraco
                end if
                if(.not. omerge(ka))then
                    x2atm_atm%rAttr(ka, n) = ocn2x_atm%rAttr(oindx(ka),n)*fraci
                    x2atm_atm%rAttr(ka, n) = x2atm_atm%rAttr(ka,n) + ocn2x_atm%rAttr(oindx(ka), n)*fraco
                end if
            end if
        end do
    end do
    write(*,*)'========== atm mrged =========='    

end subroutine mrg_x2atm


subroutine mrg_x2ocn( metaData, a2x_o, xao_o, o2x_ox, fractions_o, x2o_o )

    !----------------------------------------------------------------------- 
    ! Arguments
    type(Meta),      intent(in)    :: metaData
    type(mct_aVect), intent(in)    :: a2x_o
    !type(mct_aVect), intent(in)    :: i2x_o
    !type(mct_aVect), intent(in)    :: w2x_o
    type(mct_aVect), intent(in)    :: xao_o
    type(mct_aVect), intent(in)    :: o2x_ox
    type(mct_aVect), intent(in)    :: fractions_o
    type(mct_aVect), intent(inout) :: x2o_o
    !
    ! Local variables
    !
    integer  :: n,ka,ki,ko,kir,kor
    integer  :: lsize
    real(r8) :: ifrac,ifracr
    real(r8) :: afrac,afracr
    real(r8) :: flux_epbalfact
    real(r8) :: frac_sum
    real(r8) :: avsdr, anidr, avsdf, anidf   ! albedos
    real(r8) :: fswabsv, fswabsi             ! sw
    integer  :: noflds,naflds,niflds,nxflds
    integer  :: kof,kaf,kif,kxf
    character(len=cl) :: flux_epbal
    character(CL) :: field_ocn   ! string converted to char
    character(CL) :: field_atm   ! string converted to char
    !/character(CL) :: field_ice   ! string converted to char
    character(CL) :: field_xao   ! string converted to char
    character(CL) :: itemc_ocn   ! string converted to char
    character(CL) :: itemc_atm   ! string converted to char
    !character(CL) :: itemc_ice   ! string converted to char
    character(CL) :: itemc_xao   ! string converted to char
    logical :: iamroot  
    !type(seq_infodata_type),pointer :: infodata
    integer, save :: index_a2x_Faxa_swvdr
    integer, save :: index_a2x_Faxa_swvdf
    integer, save :: index_a2x_Faxa_swndr
    integer, save :: index_a2x_Faxa_swndf
    !integer, save :: index_i2x_Fioi_swpen
    integer, save :: index_xao_So_avsdr
    integer, save :: index_xao_So_anidr
    integer, save :: index_xao_So_avsdf
    integer, save :: index_xao_So_anidf
    integer, save :: index_a2x_Faxa_snowc
    integer, save :: index_a2x_Faxa_snowl
    integer, save :: index_a2x_Faxa_rainc
    integer, save :: index_a2x_Faxa_rainl
    integer, save :: index_x2o_Foxx_swnet
    integer, save :: index_x2o_Faxa_snow 
    integer, save :: index_x2o_Faxa_rain 
    integer, save :: index_x2o_Faxa_prec  
    logical, save, pointer :: amerge(:),xmerge(:)
    integer, save, pointer :: aindx(:),  oindx(:), xindx(:)
    logical, save :: first_time = .true.
    character(*),parameter :: subName = '(mrg_x2o_run_mct) '
    !----------------------------------------------------------------------- 

    !call seq_comm_setptrs(CPLID, iamroot=iamroot)

    noflds = mct_aVect_nRattr(x2o_o)
    naflds = mct_aVect_nRattr(a2x_o)
    !niflds = mct_aVect_nRattr(i2x_o)
    nxflds = mct_aVect_nRattr(xao_o)

    if (first_time) then
       index_a2x_Faxa_swvdr     = mct_aVect_indexRA(a2x_o,'Faxa_swvdr')
       index_a2x_Faxa_swvdf     = mct_aVect_indexRA(a2x_o,'Faxa_swvdf')
       index_a2x_Faxa_swndr     = mct_aVect_indexRA(a2x_o,'Faxa_swndr')
       index_a2x_Faxa_swndf     = mct_aVect_indexRA(a2x_o,'Faxa_swndf')
       !index_i2x_Fioi_swpen     = mct_aVect_indexRA(i2x_o,'Fioi_swpen') 
       index_xao_So_avsdr       = mct_aVect_indexRA(xao_o,'So_avsdr')
       index_xao_So_anidr       = mct_aVect_indexRA(xao_o,'So_anidr')
       index_xao_So_avsdf       = mct_aVect_indexRA(xao_o,'So_avsdf')
       index_xao_So_anidf       = mct_aVect_indexRA(xao_o,'So_anidf')
       index_x2o_Foxx_swnet     = mct_aVect_indexRA(x2o_o,'Foxx_swnet')

       index_a2x_Faxa_snowc     = mct_aVect_indexRA(a2x_o,'Faxa_snowc')
       index_a2x_Faxa_snowl     = mct_aVect_indexRA(a2x_o,'Faxa_snowl')
       index_a2x_Faxa_rainc     = mct_aVect_indexRA(a2x_o,'Faxa_rainc')
       index_a2x_Faxa_rainl     = mct_aVect_indexRA(a2x_o,'Faxa_rainl')
       index_x2o_Faxa_snow      = mct_aVect_indexRA(x2o_o,'Faxa_snow')
       index_x2o_Faxa_rain      = mct_aVect_indexRA(x2o_o,'Faxa_rain')
       index_x2o_Faxa_prec      = mct_aVect_indexRA(x2o_o,'Faxa_prec') 

       ! Compute all other quantities based on standardized naming convention (see below)
       ! Only ocn field states that have the name-prefix Sx_ will be merged
       ! Only field names have the same name-suffix (after the "_") will be merged
       !    (e.g. Si_fldname, Sa_fldname => merged to => Sx_fldname)
       ! All fluxes will be scaled by the corresponding afrac or ifrac 
       !   EXCEPT for 
       !    -- Faxa_snnet, Faxa_snow, Faxa_rain, Faxa_prec (derived)
       !    -- Forr_* (treated in ccsm_comp_mod)
       ! All i2x_o fluxes that have the name-suffix "Faii" (atm/ice fluxes) will be ignored 
       ! - only ice fluxes that are Fioi_... will be used in the ocean merges

       allocate(aindx(noflds), amerge(noflds))
       !allocate(iindx(noflds), imerge(noflds))
       allocate(xindx(noflds), xmerge(noflds))
       aindx(:) = 0
       !iindx(:) = 0
       xindx(:) = 0
       amerge(:) = .true.
       !imerge(:) = .true.
       xmerge(:) = .true.

       do kof = 1,noflds
          call getfld(kof, x2o_o, field_ocn, itemc_ocn)
          if (field_ocn(1:2) == 'PF') then
             cycle ! if flux has first character as P, pass straight through 
          end if
          if (field_ocn(1:1) == 'S' .and. field_ocn(2:2) /= 'x') then
             cycle ! ignore all ocn states that do not have a Sx_ prefix 
          end if
          if (trim(field_ocn) == 'Foxx_swnet'.or. &
              trim(field_ocn) == 'Faxa_snow' .or. &
              trim(field_ocn) == 'Faxa_rain' .or. &
              trim(field_ocn) == 'Faxa_prec') then
             cycle ! ignore swnet, snow, rain, prec - treated explicitly above
          end if
          if (trim(field_ocn(1:5)) == 'Forr_') then
             cycle ! ignore runoff fields from land - treated in coupler
          end if

          do kaf = 1,naflds
             call getfld(kaf, a2x_o, field_atm, itemc_atm)
             if (trim(itemc_ocn) == trim(itemc_atm)) then
                if ((trim(field_ocn) == trim(field_atm))) then
                   if (field_atm(1:1) == 'F') amerge(kof) = .false.
                end if
                aindx(kof) = kaf
                exit
             end if
          end do
          !do kif = 1,niflds
          !   call getfld(kif, i2x_o, field_ice, itemc_ice)
          !   if (field_ice(1:1) == 'F' .and. field_ice(2:4) == 'aii') then
          !      cycle ! ignore all i2x_o fluxes that are ice/atm fluxes
          !   end if
          !   if (trim(itemc_ocn) == trim(itemc_ice)) then
          !      if ((trim(field_ocn) == trim(field_ice))) then
          !         if (field_ice(1:1) == 'F') imerge(kof) = .false.
          !      end if
          !      iindx(kof) = kif
          !      exit
          !   end if
          !end do
          do kxf = 1,nxflds
             call getfld(kxf, xao_o, field_xao, itemc_xao)
             if (trim(itemc_ocn) == trim(itemc_xao)) then
                if ((trim(field_ocn) == trim(field_xao))) then
                   if (field_xao(1:1) == 'F') xmerge(kof) = .false.
                end if
                xindx(kof) = kxf
                exit
             end if
          end do
          if (aindx(kof) == 0) itemc_atm = 'unset'
          !if (iindx(kof) == 0) itemc_ice = 'unset'
          if (xindx(kof) == 0) itemc_xao = 'unset'

          !if (iamroot) then
          !   write(logunit,10)trim(itemc_ocn),&
          !        trim(itemc_xao),trim(itemc_ice),trim(itemc_atm)
!10             format(' ',' ocn field: ',a15,', xao merge: ',a15, &
          !        ', ice merge: ',a15,', atm merge: ',a15)
          !   write(logunit, *)'field_ocn,kof,imerge,amerge,xmerge= ',&
          !        trim(field_ocn),kof,imerge(kof),xmerge(kof),amerge(kof) 
         !end if
       end do

       first_time = .false.
    end if
    
    !call seq_cdata_setptrs(cdata_o, infodata=infodata)
    !call seq_infodata_GetData(infodata, flux_epbalfact = flux_epbalfact)

    call mct_aVect_zero(x2o_o)

    call mct_aVect_copy(aVin=a2x_o, aVout=x2o_o, vector=mct_usevector)
    !call mct_aVect_copy(aVin=i2x_o, aVout=x2o_o, vector=mct_usevector)
    !call mct_aVect_copy(aVin=w2x_o, aVout=x2o_o, vector=mct_usevector)
    call mct_aVect_copy(aVin=xao_o, aVout=x2o_o, vector=mct_usevector)

    ! Compute input ocn state (note that this only applies to non-land portion of gridcell)

    !ki  = mct_aVect_indexRa(fractions_o,"ifrac",perrWith=subName)
    ko  = mct_aVect_indexRa(fractions_o,"ofrac",perrWith=subName)
    !kir = mct_aVect_indexRa(fractions_o,"ifrad",perrWith=subName)
    !kor = mct_aVect_indexRa(fractions_o,"ofrad",perrWith=subName)
    lsize = mct_aVect_lsize(x2o_o)
  
    print *,'ocn  merged'
       
end subroutine mrg_x2ocn

subroutine mrg_x2lnd(metaData, atm2x_lndx, rof2x_lndx, lnd2x_lndx, fraction_lnd,&
x2lnd_lndx)

    implicit none
    type(Meta),        intent(in)    :: metaData
    type(mct_aVect),   intent(in)    :: atm2x_lndx
    type(mct_aVect),   intent(in)    :: rof2x_lndx
    type(mct_aVect),   intent(in)    :: lnd2x_lndx
    type(mct_aVect),   intent(in)    :: fraction_lnd
    type(mct_aVect),   intent(inout) :: x2lnd_lndx

    call mct_aVect_copy(aVin=atm2x_lndx, aVout=x2lnd_lndx, vector=mct_usevector)
    call mct_aVect_copy(aVin=rof2x_lndx, aVout=x2lnd_lndx, vector=mct_usevector)

    write(*,*)'========== lnd mrged =========='

end subroutine mrg_x2lnd

subroutine mrg_x2ice(metaData, atm2x_icex, ocn2x_icex, ice2x_icex,&
x2ice_icex)

    implicit none
    type(Meta),        intent(in)    :: metaData
    type(mct_aVect),   intent(in)    :: atm2x_icex
    type(mct_aVect),   intent(in)    :: ocn2x_icex
    type(mct_aVect),   intent(in)    :: ice2x_icex
    type(mct_aVect),   intent(inout) :: x2ice_icex

    integer :: i
    real(r8):: flux_epbalfact
    character(len=cl) :: flux_epbal
    integer, save :: index_a2x_Faxa_rainc
    integer, save :: index_a2x_Faxa_rainl
    integer, save :: index_a2x_Faxa_snowc
    integer, save :: index_a2x_Faxa_snowl
    integer, save :: index_x2i_Faxa_rain
    integer, save :: index_x2i_Faxa_snow
    logical, save :: first_time = .true.
    !----------------------------------------------------------------------- 

    if (first_time) then
       index_a2x_Faxa_snowc = mct_aVect_indexRA(atm2x_icex,'Faxa_snowc')
       index_a2x_Faxa_snowl = mct_aVect_indexRA(atm2x_icex,'Faxa_snowl')
       index_a2x_Faxa_rainc = mct_aVect_indexRA(atm2x_icex,'Faxa_rainc')
       index_a2x_Faxa_rainl = mct_aVect_indexRA(atm2x_icex,'Faxa_rainl')
       index_x2i_Faxa_rain  = mct_aVect_indexRA(x2ice_icex,'Faxa_rain' )
       index_x2i_Faxa_snow  = mct_aVect_indexRA(x2ice_icex,'Faxa_snow' )
       first_time = .false.
    end if

    ! Apply correction to precipitation of requested driver namelist

    call mct_aVect_copy(aVin=ocn2x_icex, aVout=x2ice_icex, vector=mct_usevector)
    call mct_aVect_copy(aVin=atm2x_icex, aVout=x2ice_icex, vector=mct_usevector)

    ! Merge total snow and precip for ice input
    ! Scale total precip and runoff by flux_epbalfact 

    do i = 1,mct_aVect_lsize(x2ice_icex)
       x2ice_icex%rAttr(index_x2i_Faxa_rain,i) = atm2x_icex%rAttr(index_a2x_Faxa_rainc,i) + &
	                                    atm2x_icex%rAttr(index_a2x_Faxa_rainl,i)
       x2ice_icex%rAttr(index_x2i_Faxa_snow,i) = atm2x_icex%rAttr(index_a2x_Faxa_snowc,i) + &
	                                    atm2x_icex%rAttr(index_a2x_Faxa_snowl,i) 

       x2ice_icex%rAttr(index_x2i_Faxa_rain,i) = x2ice_icex%rAttr(index_x2i_Faxa_rain,i) * flux_epbalfact
       x2ice_icex%rAttr(index_x2i_Faxa_snow,i) = x2ice_icex%rAttr(index_x2i_Faxa_snow,i) * flux_epbalfact
    end do

    write(*,*)'========== ice mrged =========='

end subroutine mrg_x2ice

subroutine mrg_x2rof(metaData, lnd2x_rofx, rof2x_rofx, fractions_r, &
x2rof_rofx)

    implicit none
    type(Meta),        intent(in)    :: metaData
    type(mct_aVect),   intent(in)    :: lnd2x_rofx
    type(mct_aVect),   intent(in)    :: fractions_r
    type(mct_aVect),   intent(in)    :: rof2x_rofx
    type(mct_aVect),   intent(inout) :: x2rof_rofx

    integer :: i
    integer, save :: index_l2x_Flrl_rofliq
    integer, save :: index_l2x_Flrl_rofice
    integer, save :: index_x2r_Flrl_rofliq
    integer, save :: index_x2r_Flrl_rofice
    integer, save :: index_lfrac
    logical, save :: first_time = .true.
    real(r8) :: lfrac
    !----------------------------------------------------------------------- 

    if (first_time) then
       print *, 'herre'
       index_l2x_Flrl_rofliq = mct_aVect_indexRA(lnd2x_rofx,'Flrl_rofliq' )
       print *, 'zero'
       index_l2x_Flrl_rofice = mct_aVect_indexRA(lnd2x_rofx,'Flrl_rofice' )
       index_x2r_Flrl_rofliq = mct_aVect_indexRA(x2rof_rofx,'Flrl_rofliq' )
       print *, 'vero'
       index_x2r_Flrl_rofice = mct_aVect_indexRA(x2rof_rofx,'Flrl_rofice' )
       index_lfrac = mct_aVect_indexRA(fractions_r,"lfrac")
       first_time = .false.
    end if

    ! Merge land rof and ice forcing for rof input

    do i = 1,mct_aVect_lsize(x2rof_rofx)
       lfrac = fractions_r%rAttr(index_lfrac,i)
       x2rof_rofx%rAttr(index_x2r_Flrl_rofliq,i) = lnd2x_rofx%rAttr(index_l2x_Flrl_rofliq,i) * lfrac
       x2rof_rofx%rAttr(index_x2r_Flrl_rofice,i) = lnd2x_rofx%rAttr(index_l2x_Flrl_rofice,i) * lfrac
    end do

    write(*,*)'========== rof mrged =========='

end subroutine mrg_x2rof

subroutine getfld(n, av, field, suffix)
    integer         , intent(in)    :: n
    type(mct_aVect) , intent(in)    :: av 
    character(len=*), intent(out)   :: field
    character(len=*), intent(out)   :: suffix

    type(mct_string) :: mstring     ! mct char type

    call mct_aVect_getRList(mstring,n,av)
    field  = mct_string_toChar(mstring)
    suffix = trim(field(scan(field,'_'):))
    call mct_string_clean(mstring)

    if (field(1:1) /= 'S' .and. field(1:1) /= 'F' .and. field(1:2) /= 'PF') then
       write(6,*)'field attribute',trim(field),' must start with S or F or PF' 
       call shr_sys_abort()
    end if
end subroutine getfld 

end module mrg_mod

