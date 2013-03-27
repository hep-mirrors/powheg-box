module     p12_sbars_hepemg_d170h3l1
   ! file: /home/oleari/fortran/POWHEG-BOX-trunk/HZJ/GoSam_POWHEG/Virtual/p12_s &
   ! &bars_hepemg/helicity3d170h3l1.f90
   ! generator: buildfortran.py
   use p12_sbars_hepemg_config, only: ki
   use p12_sbars_hepemg_util, only: cond
   implicit none
   private
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   public :: numerator_samurai
   public :: numerator_golem95
contains
!---#[ function brack_1:
   pure function brack_1(Q,mu2) result(brack)
      use p12_sbars_hepemg_model
      use p12_sbars_hepemg_kinematics
      use p12_sbars_hepemg_color
      use p12_sbars_hepemg_abbrevd170h3
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: acc170(11)
      complex(ki) :: Qspvak2e6
      complex(ki) :: Qspvak6k2
      complex(ki) :: Qspe6
      complex(ki) :: Qspk6
      complex(ki) :: Qspk2
      Qspvak2e6 = dotproduct(Q,spvak2e6)
      Qspvak6k2 = dotproduct(Q,spvak6k2)
      Qspe6 = dotproduct(Q,e6)
      Qspk6 = dotproduct(Q,k6)
      Qspk2 = dotproduct(Q,k2)
      acc170(1)=abb170(5)
      acc170(2)=abb170(6)
      acc170(3)=abb170(7)
      acc170(4)=abb170(8)
      acc170(5)=abb170(9)
      acc170(6)=abb170(10)
      acc170(7)=Qspvak2e6*acc170(3)
      acc170(8)=Qspvak6k2*acc170(1)
      acc170(9)=Qspe6*acc170(2)
      acc170(10)=Qspk6*acc170(5)
      acc170(11)=Qspk2*acc170(4)
      brack=acc170(6)+acc170(7)+acc170(8)+acc170(9)+acc170(10)+acc170(11)
   end  function brack_1
!---#] function brack_1:
!---#[ numerator interfaces:
   !------#[ function numerator_samurai:
   function numerator_samurai(ncut,Q_ext, mu2_ext) result(numerator)
      use precision, only: ki_sam => ki
!      use p12_sbars_hepemg_groups, only: &
!           & sign => diagram170_sign, shift => diagram170_shift
      use p12_sbars_hepemg_globalsl1, only: epspow
      use p12_sbars_hepemg_kinematics
      use p12_sbars_hepemg_abbrevd170h3
      implicit none
      integer, intent(in) :: ncut
      complex(ki_sam), dimension(4), intent(in) :: Q_ext
      complex(ki_sam), intent(in) :: mu2_ext
      complex(ki_sam) :: numerator
      complex(ki) :: d170
      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      real(ki), dimension(0:3) :: qshift
      qshift = k6
      Q(1)  =cmplx(real(+Q_ext(4)  -qshift(0),  ki_sam),aimag(+Q_ext(4)),  ki)
      Q(2:4)=cmplx(real(+Q_ext(1:3)-qshift(1:3),ki_sam),aimag(+Q_ext(1:3)),ki)
      d170 = 0.0_ki
      d170 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d170, ki), aimag(d170), ki_sam)
   end function numerator_samurai
   !------#] function numerator_samurai:
   !------#[ function numerator_golem95:
   function numerator_golem95(Q_ext, mu2_ext) result(numerator)
      use precision_golem, only: ki_gol => ki
      use p12_sbars_hepemg_globalsl1, only: epspow
      use p12_sbars_hepemg_kinematics
      use p12_sbars_hepemg_abbrevd170h3
      implicit none
      real(ki_gol), dimension(0:3), intent(in) :: Q_ext
      real(ki_gol), intent(in) :: mu2_ext
      complex(ki_gol) :: numerator
      complex(ki) :: d170
      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      real(ki), dimension(4) :: qshift
      qshift = k6
      Q(:)  =cmplx(real(+Q_ext(:)  -qshift(:),  ki_gol), 0.0_ki_gol, ki)
      d170 = 0.0_ki
      d170 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d170, ki), aimag(d170), ki_gol)
   end function numerator_golem95
   !------#] function numerator_golem95:
!---#] numerator interfaces:
end module p12_sbars_hepemg_d170h3l1
