module     p11_csbar_hepneg_d92h1l1
   ! file:      /home/oleari/fortran/POWHEG-BOX/HWJ_CKM/GoSam_POWHEG/Virtual/p11
   ! _csbar_hepneg/helicity1/d92h1l1.f90
   ! generator: haggies (1.1)
   use p11_csbar_hepneg_config, only: ki
   use p11_csbar_hepneg_util, only: cond
   implicit none
   private

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   public :: numerator_samurai
   public :: numerator_golem95
contains
!---#[ numerator interfaces:
   !------#[ function numerator_samurai:
   function numerator_samurai(ncut,Q_ext, mu2_ext) result(numerator)
      use precision, only: ki_sam => ki
!      use p11_csbar_hepneg_groups, only: &
!           & sign => diagram92_sign, shift => diagram92_shift
      use p11_csbar_hepneg_globalsl1, only: epspow
      use p11_csbar_hepneg_kinematics
      use p11_csbar_hepneg_abbrevh1
      implicit none

      integer, intent(in) :: ncut
      complex(ki_sam), dimension(4), intent(in) :: Q_ext
      complex(ki_sam), intent(in) :: mu2_ext
      complex(ki_sam) :: numerator
      complex(ki) :: d92
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5

      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q

      Q(1)   = cmplx(real(+Q_ext(4),   ki_sam), aimag(+Q_ext(4)),   ki)
      Q(2:4) = cmplx(real(+Q_ext(1:3), ki_sam), aimag(+Q_ext(1:3)), ki)
      d92 = 0.0_ki
      t1 = (Q(1)*spvak5k4(1)-Q(2)*spvak5k4(2)-Q(3)*spvak5k4(3)-Q(4)*spvak5k4(4))
      t2 = (Q(1)*k2(1)-Q(2)*k2(2)-Q(3)*k2(3)-Q(4)*k2(4))
      t3 = (Q(1)*spvak5k1(1)-Q(2)*spvak5k1(2)-Q(3)*spvak5k1(3)-Q(4)*spvak5k1(4))
      t4 = (Q(1)*spvak6k2(1)-Q(2)*spvak6k2(2)-Q(3)*spvak6k2(3)-Q(4)*spvak6k2(4))
      t5 = (Q(1)*k6(1)-Q(2)*k6(2)-Q(3)*k6(3)-Q(4)*k6(4))
      d92 = (abb92n2+t1*abb92n3+t2*abb92n4+t3*abb92n5+t4*abb92n6+t5*abb92n8+abb9&
      &2n7*(Q(1)*Q(1)-Q(2)*Q(2)-Q(3)*Q(3)-Q(4)*Q(4))+t1*t4*abb92n12+t2*t4*abb92n&
      &9+t3*t4*abb92n13+t4*t5*abb92n10+t4*abb92n11*(Q(1)*spvak2k6(1)-Q(2)*spvak2&
      &k6(2)-Q(3)*spvak2k6(3)-Q(4)*spvak2k6(4)))
      numerator = cmplx(real(d92, ki), aimag(d92), ki_sam)
   end function numerator_samurai
   !------#] function numerator_samurai:
   !------#[ function numerator_golem95:
   function numerator_golem95(Q_ext, mu2_ext) result(numerator)
      use precision_golem, only: ki_gol => ki
      use p11_csbar_hepneg_globalsl1, only: epspow
      use p11_csbar_hepneg_kinematics
      use p11_csbar_hepneg_abbrevh1
      implicit none

      real(ki_gol), dimension(0:3), intent(in) :: Q_ext
      real(ki_gol), intent(in) :: mu2_ext
      complex(ki_gol) :: numerator
      complex(ki) :: d92
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5

      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      Q(:) = cmplx(real(+Q_ext(:), ki_gol), 0.0_ki_gol, ki)
      d92 = 0.0_ki
      t1 = (Q(1)*spvak5k4(1)-Q(2)*spvak5k4(2)-Q(3)*spvak5k4(3)-Q(4)*spvak5k4(4))
      t2 = (Q(1)*k2(1)-Q(2)*k2(2)-Q(3)*k2(3)-Q(4)*k2(4))
      t3 = (Q(1)*spvak5k1(1)-Q(2)*spvak5k1(2)-Q(3)*spvak5k1(3)-Q(4)*spvak5k1(4))
      t4 = (Q(1)*spvak6k2(1)-Q(2)*spvak6k2(2)-Q(3)*spvak6k2(3)-Q(4)*spvak6k2(4))
      t5 = (Q(1)*k6(1)-Q(2)*k6(2)-Q(3)*k6(3)-Q(4)*k6(4))
      d92 = (abb92n2+t1*abb92n3+t2*abb92n4+t3*abb92n5+t4*abb92n6+t5*abb92n8+abb9&
      &2n7*(Q(1)*Q(1)-Q(2)*Q(2)-Q(3)*Q(3)-Q(4)*Q(4))+t1*t4*abb92n12+t2*t4*abb92n&
      &9+t3*t4*abb92n13+t4*t5*abb92n10+t4*abb92n11*(Q(1)*spvak2k6(1)-Q(2)*spvak2&
      &k6(2)-Q(3)*spvak2k6(3)-Q(4)*spvak2k6(4)))

      numerator = cmplx(real(d92, ki), aimag(d92), ki_gol)
   end function numerator_golem95
   !------#] function numerator_golem95:
!---#] numerator interfaces:
end module p11_csbar_hepneg_d92h1l1
