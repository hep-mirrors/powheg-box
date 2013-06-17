module     p6_ubbar_hepneg_abbrevd70h0
   use p6_ubbar_hepneg_config, only: ki
   use p6_ubbar_hepneg_globalsh0
   implicit none
   private
   complex(ki), dimension(34), public :: abb70
   complex(ki), public :: R2d70
   public :: init_abbrev
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
contains
   subroutine     init_abbrev()
      use p6_ubbar_hepneg_config, only: deltaOS, &
     &    logfile, debug_nlo_diagrams
      use p6_ubbar_hepneg_kinematics
      use p6_ubbar_hepneg_model
      use p6_ubbar_hepneg_color, only: TR
      use p6_ubbar_hepneg_globalsl1, only: epspow
      implicit none
      abb70(1)=1.0_ki/(-mW**2+es45+i_*mW*wW)
      abb70(2)=1.0_ki/(mH**2+es45+es61-es23-es345)
      abb70(3)=1.0_ki/(mH**2+es45-es123+es12-es345)
      abb70(4)=sqrt(mT**2)
      abb70(5)=1.0_ki/(es45-es123-es61+es23)
      abb70(6)=spak2l3**(-1)
      abb70(7)=spbl3k2**(-1)
      abb70(8)=c1*gHT*CVBU*abb70(3)*gW**2*i_*TR
      abb70(9)=abb70(4)*abb70(1)
      abb70(10)=abb70(8)*abb70(9)*abb70(2)
      abb70(11)=abb70(10)*spak2k5
      abb70(12)=abb70(11)*spbk4k2
      abb70(13)=abb70(8)*spbk4k1
      abb70(9)=abb70(13)*abb70(9)*abb70(5)
      abb70(14)=abb70(9)*spak1k5
      abb70(12)=abb70(12)-abb70(14)
      abb70(14)=-spak2e6*abb70(12)
      abb70(11)=abb70(11)*spbk5k4
      abb70(15)=abb70(11)*spak5e6
      abb70(16)=abb70(14)-abb70(15)
      abb70(17)=spbe6k1*abb70(16)
      abb70(9)=abb70(9)*spak4k5
      abb70(18)=abb70(9)*spak2e6
      abb70(19)=abb70(18)*spbe6k4
      abb70(17)=abb70(17)-abb70(19)
      abb70(19)=-4.0_ki*abb70(17)
      abb70(20)=abb70(1)*abb70(4)**3
      abb70(8)=abb70(8)*spbe6k1*abb70(20)*spak2k5*abb70(2)
      abb70(21)=spbk4k2*abb70(8)
      abb70(13)=abb70(13)*abb70(20)*abb70(5)
      abb70(20)=-spbe6k1*spak1k5*abb70(13)
      abb70(20)=abb70(21)+abb70(20)
      abb70(20)=spak2e6*abb70(20)
      abb70(8)=spak5e6*spbk5k4*abb70(8)
      abb70(13)=spbe6k4*spak2e6*spak4k5*abb70(13)
      abb70(8)=abb70(13)+abb70(20)+abb70(8)
      abb70(13)=spal3e6*spbl3k1
      abb70(20)=abb70(12)*abb70(13)
      abb70(21)=spal3e6*abb70(9)*spbk4l3
      abb70(22)=mH**2*abb70(7)*abb70(6)
      abb70(23)=-spbk4k2*abb70(22)*abb70(18)
      abb70(20)=-abb70(21)+abb70(20)+abb70(23)
      abb70(23)=spak2k6*spbk6e6
      abb70(20)=abb70(23)*abb70(20)
      abb70(10)=abb70(10)*spbk5k4*abb70(22)*spak2k5**2
      abb70(24)=abb70(10)*spbe6k2
      abb70(25)=abb70(11)*spal3k5
      abb70(26)=abb70(25)*spbe6l3
      abb70(24)=abb70(24)+abb70(26)
      abb70(26)=spbe6l3*spak2l3
      abb70(27)=abb70(12)*abb70(26)
      abb70(27)=abb70(27)-abb70(24)
      abb70(28)=spbk6k1*spae6k6
      abb70(27)=abb70(28)*abb70(27)
      abb70(14)=-abb70(14)*abb70(23)
      abb70(29)=abb70(11)*spak5k6
      abb70(30)=abb70(29)*spbk6e6
      abb70(31)=spak2e6*abb70(30)
      abb70(14)=abb70(14)+abb70(31)
      abb70(22)=abb70(22)*spbk2k1
      abb70(14)=abb70(14)*abb70(22)
      abb70(31)=abb70(13)*abb70(30)
      abb70(32)=abb70(9)*spbk6k4
      abb70(33)=abb70(32)*spae6k6
      abb70(34)=abb70(26)*abb70(33)
      abb70(8)=abb70(34)+abb70(14)+abb70(31)+abb70(27)+abb70(20)+2.0_ki*abb70(8)
      abb70(8)=4.0_ki*abb70(8)
      abb70(14)=-spak2k6*abb70(12)
      abb70(14)=abb70(14)-abb70(29)
      abb70(14)=spbk6k1*abb70(14)
      abb70(20)=-spak2k6*abb70(32)
      abb70(14)=abb70(20)+abb70(14)
      abb70(14)=8.0_ki*abb70(14)
      abb70(20)=-16.0_ki*abb70(17)
      abb70(17)=8.0_ki*abb70(17)
      abb70(27)=-spbe6k1*abb70(12)
      abb70(31)=abb70(9)*spbe6k4
      abb70(27)=abb70(27)-abb70(31)
      abb70(31)=spak2k6*abb70(27)
      abb70(29)=-spbe6k1*abb70(29)
      abb70(29)=abb70(29)+abb70(31)
      abb70(29)=2.0_ki*abb70(29)
      abb70(31)=spbk6k1*abb70(16)
      abb70(32)=-spbk6k4*abb70(18)
      abb70(31)=abb70(32)+abb70(31)
      abb70(31)=2.0_ki*abb70(31)
      abb70(13)=abb70(13)+abb70(28)
      abb70(28)=-spak2e6*abb70(22)
      abb70(28)=abb70(28)-abb70(13)
      abb70(28)=4.0_ki*abb70(11)*abb70(28)
      abb70(23)=abb70(26)+abb70(23)
      abb70(26)=-4.0_ki*abb70(9)*abb70(23)
      abb70(32)=-spak2l3*abb70(27)
      abb70(25)=-spbe6k1*abb70(25)
      abb70(25)=abb70(25)+abb70(32)
      abb70(25)=4.0_ki*abb70(25)
      abb70(32)=-spbl3k1*abb70(16)
      abb70(34)=-spbk4l3*abb70(18)
      abb70(32)=abb70(34)+abb70(32)
      abb70(32)=4.0_ki*abb70(32)
      abb70(10)=-4.0_ki*spbe6k1*abb70(10)
      abb70(13)=-abb70(12)*abb70(13)
      abb70(15)=abb70(15)*abb70(22)
      abb70(13)=abb70(21)-abb70(33)+abb70(15)+abb70(13)
      abb70(13)=4.0_ki*abb70(13)
      abb70(15)=-abb70(12)*abb70(23)
      abb70(15)=-abb70(30)+abb70(15)+abb70(24)
      abb70(15)=4.0_ki*abb70(15)
      abb70(21)=2.0_ki*spbk6e6
      abb70(18)=abb70(18)*abb70(21)
      abb70(16)=-abb70(16)*abb70(21)
      abb70(21)=2.0_ki*spae6k6
      abb70(22)=spbe6k1*abb70(11)*abb70(21)
      abb70(11)=32.0_ki*abb70(11)
      abb70(21)=-abb70(27)*abb70(21)
      abb70(9)=32.0_ki*abb70(9)
      abb70(12)=32.0_ki*abb70(12)
      R2d70=abb70(19)
      rat2 = rat2 + R2d70
      if (debug_nlo_diagrams) then
          write (logfile,*) "<result name='r2' index='70' value='", &
          & R2d70, "'/>"
      end if
   end subroutine
end module p6_ubbar_hepneg_abbrevd70h0
