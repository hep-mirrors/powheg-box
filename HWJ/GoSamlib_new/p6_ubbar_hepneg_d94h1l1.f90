module     p6_ubbar_hepneg_d94h1l1
   ! file:      /home/pcl305a/luisonig/Documents/GoSamPowheg/POWHEG-BOX/HWJ/GoSa
   ! mlib_New/Virtual/p6_ubbar_hepneg/helicity1/d94h1l1.f90
   ! generator: haggies (1.1)
   use p6_ubbar_hepneg_config, only: ki
   use p6_ubbar_hepneg_util, only: cond
   
   implicit none
   private

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   public :: numerator_samurai
   public :: numerator_golem95
contains
!---#[ function brack_1:
   pure function brack_1(Q, mu2) result(brack)
      use p6_ubbar_hepneg_model
      use p6_ubbar_hepneg_kinematics
      use p6_ubbar_hepneg_color
      use p6_ubbar_hepneg_abbrevh1
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      t1 = (Q(1)*spvak6k2(1)-Q(2)*spvak6k2(2)-Q(3)*spvak6k2(3)-Q(4)*spvak6k2(4))
      t2 = (Q(1)*k1(1)-Q(2)*k1(2)-Q(3)*k1(3)-Q(4)*k1(4))
      t3 = (Q(1)*spvak6k1(1)-Q(2)*spvak6k1(2)-Q(3)*spvak6k1(3)-Q(4)*spvak6k1(4))
      brack = (abb94n2+t1*abb94n3+t2*abb94n4+t3*abb94n5+abb94n4*(Q(1)*k6(1)-Q(2)&
      &*k6(2)-Q(3)*k6(3)-Q(4)*k6(4))+abb94n6*(Q(1)*Q(1)-Q(2)*Q(2)-Q(3)*Q(3)-Q(4)&
      &*Q(4))+t1*t2*abb94n7+t1*t3*abb94n8)
   end  function brack_1
!---#] function brack_1:
!---#[ numerator interfaces:
   !------#[ function numerator_samurai:
   function numerator_samurai(ncut,Q_ext, mu2_ext) result(numerator)
      use precision, only: ki_sam => ki
!      use p6_ubbar_hepneg_groups, only: &
!           & sign => diagram94_sign, shift => diagram94_shift
      use p6_ubbar_hepneg_globalsl1, only: epspow
      use p6_ubbar_hepneg_kinematics
      use p6_ubbar_hepneg_abbrevh1
      implicit none

      integer, intent(in) :: ncut
      complex(ki_sam), dimension(4), intent(in) :: Q_ext
      complex(ki_sam), intent(in) :: mu2_ext
      complex(ki_sam) :: numerator
      complex(ki) :: d94

      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      real(ki), dimension(0:3) :: qshift

      qshift = -k3-k6-k5-k4
      Q(1)   = cmplx(real(-Q_ext(4) - qshift(0),   ki_sam), aimag(-Q_ext(4)),   &
      &ki)
      Q(2:4) = cmplx(real(-Q_ext(1:3) - qshift(1:3), ki_sam), aimag(-Q_ext(1:3))&
      &, ki)
      d94 = 0.0_ki
      d94 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d94, ki), aimag(d94), ki_sam)
   end function numerator_samurai
   !------#] function numerator_samurai:
   !------#[ function numerator_golem95:
   function numerator_golem95(Q_ext, mu2_ext) result(numerator)
      use precision_golem, only: ki_gol => ki
      use p6_ubbar_hepneg_globalsl1, only: epspow
      use p6_ubbar_hepneg_kinematics
      use p6_ubbar_hepneg_abbrevh1
      implicit none

      real(ki_gol), dimension(0:3), intent(in) :: Q_ext
      real(ki_gol), intent(in) :: mu2_ext
      complex(ki_gol) :: numerator
      complex(ki) :: d94

      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      real(ki), dimension(4) :: qshift

      qshift = -k3-k6-k5-k4
      Q(:) = cmplx(real(-Q_ext(:) - qshift(:), ki_gol), 0.0_ki_gol, ki)
      d94 = 0.0_ki
      d94 = (cond(epspow.eq.0,brack_1,Q,mu2))

      numerator = cmplx(real(d94, ki), aimag(d94), ki_gol)
   end function numerator_golem95
   !------#] function numerator_golem95:
!---#] numerator interfaces:
end module p6_ubbar_hepneg_d94h1l1
