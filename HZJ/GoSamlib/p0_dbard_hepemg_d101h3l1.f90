module     p0_dbard_hepemg_d101h3l1
   ! file: /home/gionata/Documenti/Lavoro/GoSamPowheg/POWHEG-BOX/HZJ_tmp/GoSam_ &
   ! &POWHEG/Virtual/p0_dbard_hepemg/helicity3d101h3l1.f90
   ! generator: buildfortran.py
   use p0_dbard_hepemg_config, only: ki
   use p0_dbard_hepemg_util, only: cond
   implicit none
   private
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   public :: numerator_samurai
   public :: numerator_golem95
contains
!---#[ function brack_1:
   pure function brack_1(Q,mu2) result(brack)
      use p0_dbard_hepemg_model
      use p0_dbard_hepemg_kinematics
      use p0_dbard_hepemg_color
      use p0_dbard_hepemg_abbrevd101h3
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: acc101(65)
      complex(ki) :: Qspk1
      complex(ki) :: Qspk2
      complex(ki) :: Qspvak2k6
      complex(ki) :: Qspvak6k1
      complex(ki) :: Qspvak2k5
      complex(ki) :: Qspvak4k1
      complex(ki) :: Qspk6
      complex(ki) :: Qspvak2k1
      complex(ki) :: QspQ
      complex(ki) :: Qspe6
      complex(ki) :: Qspvae6k1
      complex(ki) :: Qspvak2e6
      complex(ki) :: Qspvak4e6
      complex(ki) :: Qspvae6k5
      complex(ki) :: Qspvak4k5
      complex(ki) :: Qspvak4k6
      complex(ki) :: Qspvak6k5
      complex(ki) :: Qspl3
      Qspk1 = dotproduct(Q,k1)
      Qspk2 = dotproduct(Q,k2)
      Qspvak2k6 = dotproduct(Q,spvak2k6)
      Qspvak6k1 = dotproduct(Q,spvak6k1)
      Qspvak2k5 = dotproduct(Q,spvak2k5)
      Qspvak4k1 = dotproduct(Q,spvak4k1)
      Qspk6 = dotproduct(Q,k6)
      Qspvak2k1 = dotproduct(Q,spvak2k1)
      QspQ = dotproduct(Q,Q)
      Qspe6 = dotproduct(Q,e6)
      Qspvae6k1 = dotproduct(Q,spvae6k1)
      Qspvak2e6 = dotproduct(Q,spvak2e6)
      Qspvak4e6 = dotproduct(Q,spvak4e6)
      Qspvae6k5 = dotproduct(Q,spvae6k5)
      Qspvak4k5 = dotproduct(Q,spvak4k5)
      Qspvak4k6 = dotproduct(Q,spvak4k6)
      Qspvak6k5 = dotproduct(Q,spvak6k5)
      Qspl3 = dotproduct(Q,l3)
      acc101(1)=abb101(6)
      acc101(2)=abb101(7)
      acc101(3)=abb101(8)
      acc101(4)=abb101(9)
      acc101(5)=abb101(10)
      acc101(6)=abb101(11)
      acc101(7)=abb101(12)
      acc101(8)=abb101(13)
      acc101(9)=abb101(14)
      acc101(10)=abb101(15)
      acc101(11)=abb101(16)
      acc101(12)=abb101(17)
      acc101(13)=abb101(18)
      acc101(14)=abb101(19)
      acc101(15)=abb101(20)
      acc101(16)=abb101(21)
      acc101(17)=abb101(22)
      acc101(18)=abb101(23)
      acc101(19)=abb101(24)
      acc101(20)=abb101(25)
      acc101(21)=abb101(26)
      acc101(22)=abb101(27)
      acc101(23)=abb101(28)
      acc101(24)=abb101(29)
      acc101(25)=abb101(30)
      acc101(26)=abb101(31)
      acc101(27)=abb101(32)
      acc101(28)=abb101(33)
      acc101(29)=abb101(34)
      acc101(30)=abb101(35)
      acc101(31)=abb101(36)
      acc101(32)=abb101(37)
      acc101(33)=abb101(39)
      acc101(34)=abb101(40)
      acc101(35)=abb101(42)
      acc101(36)=abb101(45)
      acc101(37)=abb101(47)
      acc101(38)=abb101(50)
      acc101(39)=abb101(53)
      acc101(40)=abb101(56)
      acc101(41)=abb101(58)
      acc101(42)=abb101(60)
      acc101(43)=abb101(61)
      acc101(44)=abb101(62)
      acc101(45)=abb101(63)
      acc101(46)=abb101(64)
      acc101(47)=abb101(65)
      acc101(48)=Qspk1*acc101(39)
      acc101(49)=Qspk2*acc101(41)
      acc101(50)=Qspvak2k6*acc101(47)
      acc101(51)=Qspvak6k1*acc101(34)
      acc101(52)=Qspvak2k5*acc101(17)
      acc101(53)=Qspvak4k1*acc101(2)
      acc101(54)=Qspk6*acc101(36)
      acc101(55)=Qspvak2k1*acc101(9)
      acc101(56)=QspQ*acc101(20)
      acc101(48)=acc101(56)+acc101(55)+acc101(54)+acc101(53)+acc101(52)+acc101(&
      &51)+acc101(50)+acc101(49)+acc101(18)+acc101(48)
      acc101(48)=Qspe6*acc101(48)
      acc101(49)=Qspvae6k1*acc101(44)
      acc101(50)=Qspvak2e6*acc101(43)
      acc101(51)=Qspvak2k5*acc101(24)
      acc101(52)=Qspvak4k1*acc101(22)
      acc101(53)=Qspvak4e6*acc101(28)
      acc101(54)=Qspvae6k5*acc101(30)
      acc101(55)=Qspvak2k1*acc101(11)
      acc101(49)=acc101(55)+acc101(54)+acc101(53)+acc101(52)+acc101(51)+acc101(&
      &50)+acc101(3)+acc101(49)
      acc101(49)=QspQ*acc101(49)
      acc101(50)=Qspvak2k6*acc101(46)
      acc101(51)=-Qspvak6k1*acc101(27)
      acc101(52)=-Qspvae6k1*acc101(32)
      acc101(53)=Qspvak2e6*acc101(26)
      acc101(50)=acc101(53)+acc101(52)+acc101(51)+acc101(33)+acc101(50)
      acc101(50)=Qspvak4k5*acc101(50)
      acc101(51)=Qspvak2k5*acc101(1)
      acc101(52)=Qspvak4k1*acc101(6)
      acc101(53)=Qspvak4e6*acc101(37)
      acc101(54)=Qspvae6k5*acc101(35)
      acc101(51)=acc101(54)+acc101(53)+acc101(52)+acc101(8)+acc101(51)
      acc101(51)=Qspk6*acc101(51)
      acc101(52)=Qspvak4k6*acc101(25)
      acc101(53)=Qspvak6k5*acc101(29)
      acc101(54)=Qspvak4e6*acc101(31)
      acc101(55)=Qspvae6k5*acc101(13)
      acc101(52)=acc101(55)+acc101(54)+acc101(53)+acc101(4)+acc101(52)
      acc101(52)=Qspvak2k1*acc101(52)
      acc101(53)=acc101(38)*Qspl3
      acc101(54)=Qspk1*acc101(14)
      acc101(55)=Qspk2*acc101(12)
      acc101(56)=Qspvak4k6*acc101(40)
      acc101(57)=Qspvak6k5*acc101(45)
      acc101(58)=Qspvak2k6*acc101(10)
      acc101(59)=Qspvak6k1*acc101(5)
      acc101(60)=Qspvae6k1*acc101(21)
      acc101(61)=Qspvak2e6*acc101(42)
      acc101(62)=Qspvak2k5*acc101(16)
      acc101(63)=Qspvak4k1*acc101(19)
      acc101(64)=Qspvak4e6*acc101(23)
      acc101(65)=Qspvae6k5*acc101(7)
      brack=acc101(15)+acc101(48)+acc101(49)+acc101(50)+acc101(51)+acc101(52)+a&
      &cc101(53)+acc101(54)+acc101(55)+acc101(56)+acc101(57)+acc101(58)+acc101(&
      &59)+acc101(60)+acc101(61)+acc101(62)+acc101(63)+acc101(64)+acc101(65)
   end  function brack_1
!---#] function brack_1:
!---#[ numerator interfaces:
   !------#[ function numerator_samurai:
   function numerator_samurai(ncut,Q_ext, mu2_ext) result(numerator)
      use precision, only: ki_sam => ki
!      use p0_dbard_hepemg_groups, only: &
!           & sign => diagram101_sign, shift => diagram101_shift
      use p0_dbard_hepemg_globalsl1, only: epspow
      use p0_dbard_hepemg_kinematics
      use p0_dbard_hepemg_abbrevd101h3
      implicit none
      integer, intent(in) :: ncut
      complex(ki_sam), dimension(4), intent(in) :: Q_ext
      complex(ki_sam), intent(in) :: mu2_ext
      complex(ki_sam) :: numerator
      complex(ki) :: d101
      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      Q(1)  =cmplx(real(+Q_ext(4),  ki_sam),aimag(+Q_ext(4)),  ki)
      Q(2:4)=cmplx(real(+Q_ext(1:3),ki_sam),aimag(+Q_ext(1:3)),ki)
      d101 = 0.0_ki
      d101 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d101, ki), aimag(d101), ki_sam)
   end function numerator_samurai
   !------#] function numerator_samurai:
   !------#[ function numerator_golem95:
   function numerator_golem95(Q_ext, mu2_ext) result(numerator)
      use precision_golem, only: ki_gol => ki
      use p0_dbard_hepemg_globalsl1, only: epspow
      use p0_dbard_hepemg_kinematics
      use p0_dbard_hepemg_abbrevd101h3
      implicit none
      real(ki_gol), dimension(0:3), intent(in) :: Q_ext
      real(ki_gol), intent(in) :: mu2_ext
      complex(ki_gol) :: numerator
      complex(ki) :: d101
      ! The Q that goes into the diagram
      complex(ki), dimension(4) :: Q
      complex(ki) :: mu2
      Q(:)  =cmplx(real(+Q_ext(:),  ki_gol), 0.0_ki_gol, ki)
      d101 = 0.0_ki
      d101 = (cond(epspow.eq.0,brack_1,Q,mu2))
      numerator = cmplx(real(d101, ki), aimag(d101), ki_gol)
   end function numerator_golem95
   !------#] function numerator_golem95:
!---#] numerator interfaces:
end module p0_dbard_hepemg_d101h3l1
