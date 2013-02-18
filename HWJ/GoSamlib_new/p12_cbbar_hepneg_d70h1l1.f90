module     p12_cbbar_hepneg_d70h1l1
   ! file:      /home/pcl305a/luisonig/Documents/GoSamPowheg/POWHEG-BOX/HWJ/GoSa
   ! mlib_New/Virtual/p12_cbbar_hepneg/helicity1/d70h1l1.f90
   ! generator: haggies (1.1)
   use p12_cbbar_hepneg_config, only: ki
   use p12_cbbar_hepneg_util, only: cond
   
   implicit none
   private

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   public :: numerator_samurai
   public :: numerator_golem95
contains
!---#[ function brack_1:
   pure function brack_1(Q, mu2) result(brack)
      use p12_cbbar_hepneg_model
      use p12_cbbar_hepneg_kinematics
      use p12_cbbar_hepneg_color
      use p12_cbbar_hepneg_abbrevh1
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      t1 = (Q(1)*spvak6k2(1)-Q(2)*spvak6k2(2)-Q(3)*spvak6k2(3)-Q(4)*spvak6k2(4))
      brack = (abb70n8+t1*abb70n11+abb70n10*(Q(1)*spval3k2(1)-Q(2)*spval3k2(2)-Q&
      &(3)*spval3k2(3)-Q(4)*spval3k2(4))+abb70n13*(Q(1)*spvak6k1(1)-Q(2)*spvak6k&
      &1(2)-Q(3)*spvak6k1(3)-Q(4)*spvak6k1(4))+abb70n2*(Q(1)*spvak6k4(1)-Q(2)*sp&
      &vak6k4(2)-Q(3)*spvak6k4(3)-Q(4)*spvak6k4(4))+abb70n4*(Q(1)*spvak6l3(1)-Q(&
      &2)*spvak6l3(2)-Q(3)*spvak6l3(3)-Q(4)*spvak6l3(4))+abb70n5*(Q(1)*k6(1)-Q(2&
      &)*k6(2)-Q(3)*k6(3)-Q(4)*k6(4))+abb70n6*(Q(1)*Q(1)-Q(2)*Q(2)-Q(3)*Q(3)-Q(4&
      &)*Q(4))+abb70n7*(Q(1)*k2(1)-Q(2)*k2(2)-Q(3)*k2(3)-Q(4)*k2(4))+abb70n9*(Q(&
      &1)*spvak5k2(1)-Q(2)*spvak5k2(2)-Q(3)*spvak5k2(3)-Q(4)*spvak5k2(4))+t1*abb&
      &70n12*(Q(1)*spvak2k1(1)-Q(2)*spvak2k1(2)-Q(3)*spvak2k1(3)-Q(4)*spvak2k1(4&
      &))+t1*abb70n14*(Q(1)*spvak5k1(1)-Q(2)*spvak5k1(2)-Q(3)*spvak5k1(3)-Q(4)*s&
      &pvak5k1(4))+t1*abb70n3*(Q(1)*spvak2k4(1)-Q(2)*spvak2k4(2)-Q(3)*spvak2k4(3&
      &)-Q(4)*spvak2k4(4)))
   end  function brack_1
!---#] function brack_1:
!---#[ numerator interfaces:
   !------#[ function numerator_samurai:
   function numerator_samurai(ncut,Q_ext, mu2_ext) result(numerator)
      use precision, only: ki_sam => ki
!      use p12_cbbar_hepneg_groups, only: &
!           & sign => diagram70_sign, shift => diagram70_shift
      use p12_cbbar_hepneg_globalsl1, only: epspow
      use p12_cbbar_hepneg_kinematics
      use p12_cbbar_hepneg_abbrevh1
      implicit none

      integer, intent(in) :: ncut
      complex(ki_sam), dimension(4), intent(in) :: Q_ext
      complex(ki_sam), intent(in) :: mu2_ext
      complex(ki_sam) :: numerator
      complex(ki) :: d70

      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2

      Q(1)   = cmplx(real(-Q_ext(4),   ki_sam), aimag(-Q_ext(4)),   ki)
      Q(2:4) = cmplx(real(-Q_ext(1:3), ki_sam), aimag(-Q_ext(1:3)), ki)
      d70 = 0.0_ki
      d70 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d70, ki), aimag(d70), ki_sam)
   end function numerator_samurai
   !------#] function numerator_samurai:
   !------#[ function numerator_golem95:
   function numerator_golem95(Q_ext, mu2_ext) result(numerator)
      use precision_golem, only: ki_gol => ki
      use p12_cbbar_hepneg_globalsl1, only: epspow
      use p12_cbbar_hepneg_kinematics
      use p12_cbbar_hepneg_abbrevh1
      implicit none

      real(ki_gol), dimension(0:3), intent(in) :: Q_ext
      real(ki_gol), intent(in) :: mu2_ext
      complex(ki_gol) :: numerator
      complex(ki) :: d70

      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      Q(:) = cmplx(real(-Q_ext(:), ki_gol), 0.0_ki_gol, ki)
      d70 = 0.0_ki
      d70 = (cond(epspow.eq.0,brack_1,Q,mu2))

      numerator = cmplx(real(d70, ki), aimag(d70), ki_gol)
   end function numerator_golem95
   !------#] function numerator_golem95:
!---#] numerator interfaces:
end module p12_cbbar_hepneg_d70h1l1
