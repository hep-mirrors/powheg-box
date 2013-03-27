module     p12_sbars_hepemg_diagramsh3l0
   ! file: /home/oleari/fortran/POWHEG-BOX-trunk/HZJ/GoSam_POWHEG/Virtual/p12_sbars_hepemg/helicity3diagramsl0.f90 
   ! generator: buildfortranborn.py 
   use p12_sbars_hepemg_color, only: numcs
   use p12_sbars_hepemg_config, only: ki

   implicit none
   private

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   complex(ki), dimension(numcs), parameter :: zero_col = 0.0_ki
   public :: amplitude

contains
!---#[ function amplitude:
   function amplitude()
      use p12_sbars_hepemg_model
      use p12_sbars_hepemg_kinematics
      use p12_sbars_hepemg_color
      use p12_sbars_hepemg_config, only: debug_lo_diagrams, &
        & use_sorted_sum
      use p12_sbars_hepemg_accu, only: sorted_sum
      use p12_sbars_hepemg_util, only: inspect_lo_diagram
      implicit none
      complex(ki), dimension(numcs) :: amplitude
      complex(ki), dimension(6) :: abb
!      complex(ki), dimension(2,numcs) :: diagrams
      integer :: i

      amplitude(:) = 0.0_ki


      abb(1)=1.0_ki/(-mZ**2+es345+i_*mZ*wZ)
      abb(2)=1.0_ki/(-mZ**2+es45+i_*mZ*wZ)
      abb(3)=es61**(-1)
      abb(4)=1.0_ki/(-es61-es12+es345)
      abb(5)=spae6k6*spbk6k5
      abb(6)=-spbk5k1*spak1e6
      abb(5)=abb(5)+abb(6)
      abb(5)=abb(3)*spbe6k1*spak2k4*abb(5)
      abb(6)=-spbk5k1*abb(4)*spbk6e6*spak2e6*spak4k6
      abb(5)=abb(6)+abb(5)
      abb(5)=2.0_ki*abb(1)*abb(2)*ger*gSr*gHZZ*i_*abb(5)

      amplitude=c1*abb(5)

      if (debug_lo_diagrams) then
         write(*,*) "Using Born optimization, debug_lo_diagrams not implemented."
      end if

!      if (use_sorted_sum) then
!         do i=1,numcs
!            amplitude(i) = sorted_sum(diagrams(i))
!         end do
!      else
!         do i=1,numcs
!            amplitude(i) = sum(diagrams(i))
!         end do
!      end if
   end function     amplitude
!---#] function amplitude:
end module p12_sbars_hepemg_diagramsh3l0
