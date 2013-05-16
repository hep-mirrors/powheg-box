module     p16_bbarb_hepemg_abbrevd277h2
   use p16_bbarb_hepemg_config, only: ki
   use p16_bbarb_hepemg_globalsh2
   implicit none
   private
   complex(ki), dimension(68), public :: abb277
   complex(ki), public :: R2d277
   public :: init_abbrev
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
contains
   subroutine     init_abbrev()
      use p16_bbarb_hepemg_config, only: deltaOS, &
     &    logfile, debug_nlo_diagrams
      use p16_bbarb_hepemg_kinematics
      use p16_bbarb_hepemg_model
      use p16_bbarb_hepemg_color, only: TR
      use p16_bbarb_hepemg_globalsl1, only: epspow
      implicit none
      abb277(1)=1.0_ki/(-mZ**2+es345+i_*mZ*wZ)
      abb277(2)=1.0_ki/(-mZ**2+es45+i_*mZ*wZ)
      abb277(3)=es12**(-1)
      abb277(4)=dotproduct(k3,e6)
      abb277(5)=dotproduct(k3,spvak1e6)
      abb277(6)=dotproduct(k3,spvae6k2)
      abb277(7)=dotproduct(k3,spvak4e6)
      abb277(8)=dotproduct(k3,spvae6k5)
      abb277(9)=dotproduct(k3,spvak1k2)
      abb277(10)=dotproduct(k3,spvak1k5)
      abb277(11)=dotproduct(k3,spvak4k2)
      abb277(12)=1.0_ki/(-mZ**2+es345)
      abb277(13)=sqrt(mT**2)
      abb277(14)=spak2l3**(-1)
      abb277(15)=spbl3k2**(-1)
      abb277(16)=1.0_ki/2.0_ki*spbe6k5
      abb277(17)=-spak4k5*abb277(16)
      abb277(17)=abb277(17)+1.0_ki/4.0_ki*abb277(7)
      abb277(18)=spak1e6*spbk5k2
      abb277(17)=abb277(18)*abb277(17)
      abb277(19)=1.0_ki/2.0_ki*spak4e6
      abb277(20)=spbe6k5*spak1k4
      abb277(21)=spbk4k2*abb277(20)*abb277(19)
      abb277(22)=spak1e6*spbe6k5
      abb277(23)=abb277(11)*abb277(22)
      abb277(24)=spak4e6*spbk5k2
      abb277(25)=spbe6k4*spak1k4*abb277(24)
      abb277(17)=abb277(21)-1.0_ki/2.0_ki*abb277(25)-1.0_ki/4.0_ki*abb277(23)+a&
      &bb277(17)
      abb277(21)=abb277(2)*TR*c1*ger*abb277(3)
      abb277(23)=abb277(21)*abb277(1)*i_*gHZZ
      abb277(25)=gTl*abb277(23)
      abb277(23)=gTr*abb277(23)
      abb277(26)=abb277(25)+1.0_ki/3.0_ki*abb277(23)
      abb277(17)=abb277(26)*abb277(17)
      abb277(27)=spbk5k4*abb277(19)
      abb277(27)=abb277(27)+1.0_ki/4.0_ki*abb277(8)
      abb277(28)=spbe6k2*spak1k4
      abb277(27)=abb277(28)*abb277(27)
      abb277(16)=spak1k5*abb277(24)*abb277(16)
      abb277(29)=spbe6k2*spak4e6
      abb277(30)=abb277(10)*abb277(29)
      abb277(31)=spak5e6*spbk5k2*abb277(20)
      abb277(16)=abb277(16)-1.0_ki/2.0_ki*abb277(31)-1.0_ki/4.0_ki*abb277(30)+a&
      &bb277(27)
      abb277(27)=abb277(23)+1.0_ki/3.0_ki*abb277(25)
      abb277(16)=abb277(27)*abb277(16)
      abb277(30)=spbk6k5*spak1k4
      abb277(31)=spae6k6*spbe6k2
      abb277(32)=abb277(30)*abb277(31)
      abb277(33)=abb277(27)*abb277(32)
      abb277(34)=spak4k6*spbk5k2
      abb277(35)=spbk6e6*spak1e6
      abb277(36)=abb277(34)*abb277(35)
      abb277(37)=abb277(26)*abb277(36)
      abb277(33)=abb277(33)+abb277(37)
      abb277(37)=abb277(25)-abb277(23)
      abb277(38)=abb277(37)*abb277(24)
      abb277(39)=spbk6e6*abb277(38)
      abb277(40)=abb277(19)*spbe6k2
      abb277(27)=-spbk6k5*abb277(27)*abb277(40)
      abb277(41)=abb277(25)+abb277(23)
      abb277(42)=spbe6k5*abb277(41)*spak4e6
      abb277(43)=spbk6k2*abb277(42)
      abb277(27)=2.0_ki/3.0_ki*abb277(43)+1.0_ki/3.0_ki*abb277(39)+abb277(27)
      abb277(27)=spak1k6*abb277(27)
      abb277(39)=abb277(5)*abb277(38)
      abb277(43)=abb277(37)*abb277(20)
      abb277(44)=abb277(6)*abb277(43)
      abb277(39)=abb277(39)-abb277(44)
      abb277(44)=spae6k6*abb277(43)
      abb277(26)=spak4k6*abb277(26)*abb277(22)
      abb277(26)=-1.0_ki/3.0_ki*abb277(44)-1.0_ki/2.0_ki*abb277(26)
      abb277(26)=spbk6k2*abb277(26)
      abb277(44)=abb277(41)*spak1k4
      abb277(45)=abb277(44)*spbk5k2
      abb277(46)=abb277(4)*abb277(45)
      abb277(47)=abb277(9)*abb277(42)
      abb277(16)=1.0_ki/3.0_ki*abb277(47)-2.0_ki/3.0_ki*abb277(46)+abb277(27)+1&
      &.0_ki/2.0_ki*abb277(33)+abb277(26)+abb277(16)+abb277(17)+1.0_ki/6.0_ki*a&
      &bb277(39)
      abb277(17)=abb277(32)-abb277(36)
      abb277(17)=abb277(37)*abb277(17)
      abb277(26)=spbk2k1*spak1e6
      abb277(27)=abb277(43)*abb277(26)
      abb277(33)=spak1k2*spbe6k2
      abb277(39)=abb277(38)*abb277(33)
      abb277(17)=abb277(39)+abb277(17)+abb277(27)
      abb277(27)=abb277(13)**2
      abb277(17)=abb277(27)*abb277(17)
      abb277(39)=abb277(35)*spbk2k1
      abb277(46)=abb277(39)*spak1k6
      abb277(47)=abb277(31)*spak1k2
      abb277(48)=abb277(47)*spbk6k2
      abb277(46)=abb277(46)+abb277(48)
      abb277(21)=abb277(46)*abb277(21)*abb277(13)
      abb277(48)=-abb277(15)*abb277(14)*spak2k4*mH**2*spbk5k2*abb277(21)
      abb277(21)=-spal3k4*spbk5l3*abb277(21)
      abb277(21)=abb277(48)+abb277(21)
      abb277(21)=2.0_ki*abb277(21)
      abb277(21)=gZXH*gXT*abb277(12)*abb277(21)
      abb277(17)=abb277(17)+abb277(21)
      abb277(17)=2.0_ki*abb277(17)
      abb277(21)=abb277(27)*abb277(45)
      abb277(48)=abb277(34)*spak1k2
      abb277(49)=spbk6k2*abb277(25)*abb277(48)
      abb277(50)=abb277(30)*spbk2k1
      abb277(51)=-abb277(23)*spak1k6*abb277(50)
      abb277(21)=abb277(51)+abb277(21)+abb277(49)
      abb277(21)=4.0_ki*abb277(21)
      abb277(49)=abb277(23)*abb277(20)*abb277(26)
      abb277(33)=-abb277(24)*abb277(25)*abb277(33)
      abb277(33)=abb277(49)+abb277(33)
      abb277(33)=4.0_ki*abb277(33)
      abb277(49)=2.0_ki*abb277(41)
      abb277(51)=-abb277(32)*abb277(49)
      abb277(52)=abb277(25)+3.0_ki*abb277(23)
      abb277(53)=-abb277(52)*abb277(36)
      abb277(51)=abb277(51)+abb277(53)
      abb277(53)=8.0_ki*abb277(45)
      abb277(54)=abb277(23)+3.0_ki*abb277(25)
      abb277(32)=-abb277(54)*abb277(32)
      abb277(36)=-abb277(36)*abb277(49)
      abb277(32)=abb277(32)+abb277(36)
      abb277(36)=-4.0_ki*abb277(45)
      abb277(27)=2.0_ki*abb277(27)
      abb277(23)=abb277(27)*abb277(23)
      abb277(45)=-abb277(28)*abb277(23)
      abb277(49)=abb277(37)*abb277(28)
      abb277(55)=1.0_ki/2.0_ki*abb277(52)
      abb277(28)=abb277(28)*abb277(55)
      abb277(25)=abb277(27)*abb277(25)
      abb277(56)=-abb277(18)*abb277(25)
      abb277(57)=abb277(37)*abb277(18)
      abb277(58)=1.0_ki/2.0_ki*abb277(54)
      abb277(18)=abb277(18)*abb277(58)
      abb277(59)=1.0_ki/2.0_ki*abb277(37)
      abb277(60)=abb277(59)*spbk6e6
      abb277(48)=abb277(60)*abb277(48)
      abb277(61)=abb277(59)*spae6k6
      abb277(50)=abb277(61)*abb277(50)
      abb277(39)=spak1k4*abb277(39)*abb277(55)
      abb277(62)=abb277(37)*abb277(30)
      abb277(47)=abb277(47)*abb277(58)
      abb277(63)=-spbk5k2*abb277(47)
      abb277(46)=-abb277(46)*abb277(59)
      abb277(64)=abb277(37)*spbe6k2
      abb277(65)=spak1k2*abb277(64)
      abb277(60)=-spak1k6*abb277(60)
      abb277(60)=abb277(65)+abb277(60)
      abb277(26)=abb277(37)*abb277(26)
      abb277(61)=spbk6k2*abb277(61)
      abb277(26)=abb277(26)+abb277(61)
      abb277(61)=-abb277(35)*abb277(59)
      abb277(25)=abb277(22)*abb277(25)
      abb277(47)=spbk6k5*abb277(47)
      abb277(25)=abb277(25)+abb277(47)
      abb277(47)=spak1k2*spbk5k2*abb277(54)
      abb277(65)=spak1k6*spbk6k5*abb277(37)
      abb277(47)=2.0_ki*abb277(47)+abb277(65)
      abb277(65)=-abb277(37)*abb277(22)
      abb277(22)=-abb277(58)*abb277(22)
      abb277(66)=-abb277(37)*abb277(34)
      abb277(67)=abb277(31)*abb277(59)
      abb277(23)=abb277(23)*abb277(29)
      abb277(29)=abb277(35)*spak4k6
      abb277(35)=-spbk2k1*abb277(29)*abb277(55)
      abb277(23)=abb277(23)+abb277(35)
      abb277(35)=spak1k4*abb277(52)*spbk2k1
      abb277(68)=-spbk6k2*spak4k6*abb277(37)
      abb277(35)=-2.0_ki*abb277(35)+abb277(68)
      abb277(68)=spak4e6*abb277(64)
      abb277(40)=-abb277(52)*abb277(40)
      abb277(31)=spak2k4*spbk6k5*abb277(31)
      abb277(29)=spbk5k1*abb277(29)
      abb277(29)=abb277(29)+abb277(31)
      abb277(29)=abb277(41)*abb277(29)
      abb277(27)=-abb277(27)*abb277(42)
      abb277(31)=spak2e6*abb277(55)*abb277(34)*spbk6e6
      abb277(34)=abb277(58)*spae6k6
      abb277(30)=spbe6k1*abb277(30)*abb277(34)
      abb277(27)=abb277(30)+abb277(31)+abb277(27)+abb277(29)
      abb277(29)=-spak4k6*spbk6k5
      abb277(30)=spak2k4*spbk5k2
      abb277(29)=abb277(29)+abb277(30)
      abb277(29)=abb277(41)*abb277(29)
      abb277(30)=spbk5k1*abb277(44)
      abb277(29)=abb277(30)+abb277(29)
      abb277(29)=4.0_ki*abb277(29)
      abb277(30)=4.0_ki*abb277(42)
      abb277(31)=2.0_ki*abb277(42)
      abb277(41)=abb277(52)*spbk6e6
      abb277(42)=spak4k6*abb277(41)
      abb277(44)=spak2k4*abb277(64)
      abb277(52)=spbe6k1*spak1k4*abb277(37)
      abb277(42)=abb277(52)+abb277(42)+abb277(44)
      abb277(42)=1.0_ki/2.0_ki*abb277(42)
      abb277(44)=-spbk5k1*spak1e6
      abb277(52)=-spak2e6*spbk5k2
      abb277(44)=abb277(52)+abb277(44)
      abb277(37)=abb277(37)*abb277(44)
      abb277(44)=spbk6k5*spae6k6*abb277(54)
      abb277(37)=abb277(44)+abb277(37)
      abb277(37)=1.0_ki/2.0_ki*abb277(37)
      abb277(44)=spak2k4*spbe6k5*abb277(59)
      abb277(24)=-abb277(24)*abb277(59)
      abb277(20)=abb277(20)*abb277(59)
      abb277(52)=-spbk5k1*spak4e6*abb277(59)
      abb277(19)=abb277(19)*abb277(41)
      abb277(34)=spbe6k5*abb277(34)
      R2d277=abb277(16)
      rat2 = rat2 + R2d277
      if (debug_nlo_diagrams) then
          write (logfile,*) "<result name='r2' index='277' value='", &
          & R2d277, "'/>"
      end if
   end subroutine
end module p16_bbarb_hepemg_abbrevd277h2
