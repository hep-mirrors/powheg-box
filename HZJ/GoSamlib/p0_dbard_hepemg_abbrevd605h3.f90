module     p0_dbard_hepemg_abbrevd605h3
   use p0_dbard_hepemg_config, only: ki
   use p0_dbard_hepemg_globalsh3
   implicit none
   private
   complex(ki), dimension(19), public :: abb605
   complex(ki), public :: R2d605
   public :: init_abbrev
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
contains
   subroutine     init_abbrev()
      use p0_dbard_hepemg_config, only: deltaOS, &
     &    logfile, debug_nlo_diagrams
      use p0_dbard_hepemg_kinematics
      use p0_dbard_hepemg_model
      use p0_dbard_hepemg_color, only: TR
      use p0_dbard_hepemg_globalsl1, only: epspow
      implicit none
      abb605(1)=1.0_ki/(-es61-es12+es345)
      abb605(2)=1.0_ki/(-mZ**2+es345+i_*mZ*wZ)
      abb605(3)=1.0_ki/(-mZ**2+es45+i_*mZ*wZ)
      abb605(4)=NC**(-1)
      abb605(5)=gDr*gHZZ*spbk5k1*c1*i_*TR*ger*abb605(3)*abb605(2)*abb605(1)
      abb605(6)=abb605(4)*abb605(5)*spak4k6
      abb605(7)=spbk6e6*spak2e6
      abb605(8)=abb605(7)*abb605(6)
      abb605(9)=abb605(5)*NC
      abb605(10)=abb605(9)*spak4k6
      abb605(11)=abb605(7)*abb605(10)
      abb605(8)=abb605(8)-abb605(11)
      abb605(12)=-es61+es345-es12
      abb605(12)=2.0_ki*abb605(12)
      abb605(13)=abb605(11)*abb605(12)
      abb605(9)=abb605(9)*spak2k4
      abb605(12)=-abb605(9)*abb605(12)
      abb605(14)=-4.0_ki*abb605(8)
      abb605(11)=4.0_ki*abb605(11)
      abb605(5)=abb605(5)*spak2k4
      abb605(15)=abb605(4)*abb605(5)
      abb605(16)=abb605(9)+abb605(15)
      abb605(16)=8.0_ki*abb605(16)
      abb605(17)=2.0_ki*abb605(8)
      abb605(18)=-abb605(9)-2.0_ki*abb605(15)
      abb605(18)=spae6k6*abb605(18)
      abb605(19)=-spak2e6*abb605(10)
      abb605(18)=abb605(19)+abb605(18)
      abb605(18)=spbk6k2*abb605(18)
      abb605(19)=2.0_ki*abb605(4)
      abb605(5)=-abb605(19)*abb605(7)*abb605(5)
      abb605(7)=-abb605(9)+abb605(15)
      abb605(7)=2.0_ki*spbe6k2*spae6k6*abb605(7)
      abb605(6)=abb605(10)+abb605(6)
      abb605(6)=4.0_ki*abb605(6)
      R2d605=-abb605(8)
      rat2 = rat2 + R2d605
      if (debug_nlo_diagrams) then
          write (logfile,*) "<result name='r2' index='605' value='", &
          & R2d605, "'/>"
      end if
   end subroutine
end module p0_dbard_hepemg_abbrevd605h3
