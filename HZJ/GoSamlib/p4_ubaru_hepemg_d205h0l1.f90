module     p4_ubaru_hepemg_d205h0l1
   ! file: /home/oleari/fortran/POWHEG-BOX-trunk/HZJ/GoSam_POWHEG/Virtual/p4_ub &
   ! &aru_hepemg/helicity0d205h0l1.f90
   ! generator: buildfortran.py
   use p4_ubaru_hepemg_config, only: ki
   use p4_ubaru_hepemg_util, only: cond
   implicit none
   private
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   public :: numerator_samurai
   public :: numerator_golem95
contains
!---#[ function brack_1:
   pure function brack_1(Q,mu2) result(brack)
      use p4_ubaru_hepemg_model
      use p4_ubaru_hepemg_kinematics
      use p4_ubaru_hepemg_color
      use p4_ubaru_hepemg_abbrevd205h0
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: acc205(34)
      complex(ki) :: Qspvak1k6
      complex(ki) :: Qspvak6k2
      complex(ki) :: QspQ
      complex(ki) :: Qspvae6k2
      complex(ki) :: Qspk2
      complex(ki) :: Qspvak5k4
      complex(ki) :: Qspvak1k2
      complex(ki) :: Qspk1
      complex(ki) :: Qspvak1k4
      complex(ki) :: Qspvak5k2
      complex(ki) :: Qspe6
      complex(ki) :: Qspk6
      Qspvak1k6 = dotproduct(Q,spvak1k6)
      Qspvak6k2 = dotproduct(Q,spvak6k2)
      QspQ = dotproduct(Q,Q)
      Qspvae6k2 = dotproduct(Q,spvae6k2)
      Qspk2 = dotproduct(Q,k2)
      Qspvak5k4 = dotproduct(Q,spvak5k4)
      Qspvak1k2 = dotproduct(Q,spvak1k2)
      Qspk1 = dotproduct(Q,k1)
      Qspvak1k4 = dotproduct(Q,spvak1k4)
      Qspvak5k2 = dotproduct(Q,spvak5k2)
      Qspe6 = dotproduct(Q,e6)
      Qspk6 = dotproduct(Q,k6)
      acc205(1)=abb205(4)
      acc205(2)=abb205(5)
      acc205(3)=abb205(6)
      acc205(4)=abb205(7)
      acc205(5)=abb205(8)
      acc205(6)=abb205(9)
      acc205(7)=abb205(10)
      acc205(8)=abb205(11)
      acc205(9)=abb205(12)
      acc205(10)=abb205(13)
      acc205(11)=abb205(14)
      acc205(12)=abb205(16)
      acc205(13)=abb205(17)
      acc205(14)=abb205(18)
      acc205(15)=abb205(19)
      acc205(16)=abb205(20)
      acc205(17)=abb205(21)
      acc205(18)=abb205(22)
      acc205(19)=abb205(23)
      acc205(20)=abb205(24)
      acc205(21)=abb205(25)
      acc205(22)=abb205(26)
      acc205(23)=abb205(27)
      acc205(24)=abb205(28)
      acc205(25)=abb205(29)
      acc205(26)=abb205(30)
      acc205(27)=-acc205(4)*Qspvak1k6
      acc205(28)=Qspvak6k2*acc205(25)
      acc205(29)=QspQ*acc205(23)
      acc205(30)=Qspvae6k2*acc205(24)
      acc205(31)=Qspk2*acc205(22)
      acc205(27)=acc205(31)+acc205(30)+acc205(29)+acc205(28)+acc205(20)+acc205(&
      &27)
      acc205(27)=Qspvak5k4*acc205(27)
      acc205(28)=-Qspvak5k4*acc205(11)
      acc205(28)=acc205(28)+acc205(10)
      acc205(28)=Qspvak1k2*acc205(28)
      acc205(29)=Qspk2+Qspk1
      acc205(29)=acc205(2)*acc205(29)
      acc205(30)=Qspvak6k2*acc205(15)
      acc205(31)=Qspvak1k4*acc205(26)
      acc205(32)=Qspvak5k2*acc205(18)
      acc205(28)=acc205(32)+acc205(31)+acc205(30)+acc205(9)+acc205(29)+acc205(2&
      &8)
      acc205(28)=Qspe6*acc205(28)
      acc205(29)=Qspvak1k4*acc205(12)
      acc205(30)=Qspvak5k2*acc205(21)
      acc205(29)=acc205(29)-acc205(30)
      acc205(30)=acc205(13)-acc205(29)
      acc205(30)=Qspk6*acc205(30)
      acc205(31)=Qspvak1k4*acc205(3)
      acc205(32)=Qspvak5k2*acc205(19)
      acc205(31)=acc205(32)+acc205(16)+acc205(31)
      acc205(31)=QspQ*acc205(31)
      acc205(32)=-Qspk6*acc205(8)
      acc205(33)=QspQ*acc205(17)
      acc205(32)=acc205(33)+acc205(7)+acc205(32)
      acc205(32)=Qspvae6k2*acc205(32)
      acc205(33)=Qspvae6k2*acc205(8)
      acc205(29)=acc205(33)+acc205(14)+acc205(29)
      acc205(29)=Qspk2*acc205(29)
      acc205(33)=Qspk1*acc205(1)
      acc205(34)=Qspvak6k2*acc205(5)
      brack=acc205(6)+acc205(27)+acc205(28)+acc205(29)+acc205(30)+acc205(31)+ac&
      &c205(32)+acc205(33)+acc205(34)
   end  function brack_1
!---#] function brack_1:
!---#[ numerator interfaces:
   !------#[ function numerator_samurai:
   function numerator_samurai(ncut,Q_ext, mu2_ext) result(numerator)
      use precision, only: ki_sam => ki
!      use p4_ubaru_hepemg_groups, only: &
!           & sign => diagram205_sign, shift => diagram205_shift
      use p4_ubaru_hepemg_globalsl1, only: epspow
      use p4_ubaru_hepemg_kinematics
      use p4_ubaru_hepemg_abbrevd205h0
      implicit none
      integer, intent(in) :: ncut
      complex(ki_sam), dimension(4), intent(in) :: Q_ext
      complex(ki_sam), intent(in) :: mu2_ext
      complex(ki_sam) :: numerator
      complex(ki) :: d205
      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      real(ki), dimension(0:3) :: qshift
      qshift = -k2
      Q(1)  =cmplx(real(-Q_ext(4)  -qshift(0),  ki_sam),aimag(-Q_ext(4)),  ki)
      Q(2:4)=cmplx(real(-Q_ext(1:3)-qshift(1:3),ki_sam),aimag(-Q_ext(1:3)),ki)
      d205 = 0.0_ki
      d205 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d205, ki), aimag(d205), ki_sam)
   end function numerator_samurai
   !------#] function numerator_samurai:
   !------#[ function numerator_golem95:
   function numerator_golem95(Q_ext, mu2_ext) result(numerator)
      use precision_golem, only: ki_gol => ki
      use p4_ubaru_hepemg_globalsl1, only: epspow
      use p4_ubaru_hepemg_kinematics
      use p4_ubaru_hepemg_abbrevd205h0
      implicit none
      real(ki_gol), dimension(0:3), intent(in) :: Q_ext
      real(ki_gol), intent(in) :: mu2_ext
      complex(ki_gol) :: numerator
      complex(ki) :: d205
      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      real(ki), dimension(4) :: qshift
      qshift = -k2
      Q(:)  =cmplx(real(-Q_ext(:)  -qshift(:),  ki_gol), 0.0_ki_gol, ki)
      d205 = 0.0_ki
      d205 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d205, ki), aimag(d205), ki_gol)
   end function numerator_golem95
   !------#] function numerator_golem95:
!---#] numerator interfaces:
end module p4_ubaru_hepemg_d205h0l1
