module     p16_bbarb_hepemg_abbrevd134h2
   use p16_bbarb_hepemg_config, only: ki
   use p16_bbarb_hepemg_globalsh2
   implicit none
   private
   complex(ki), dimension(21), public :: abb134
   complex(ki), public :: R2d134
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
      abb134(1)=1.0_ki/(-es61-es12+es345)
      abb134(2)=1.0_ki/(-mZ**2+es345+i_*mZ*wZ)
      abb134(3)=1.0_ki/(-mZ**2+es45+i_*mZ*wZ)
      abb134(4)=NC**(-1)
      abb134(5)=spae6k6*spak1k4
      abb134(6)=abb134(5)*spbk6k5
      abb134(7)=NC-abb134(4)
      abb134(7)=abb134(7)*gBl*gHZZ*c1*i_*TR*ger*abb134(3)*abb134(2)*abb134(1)
      abb134(8)=spbe6k2*abb134(7)
      abb134(9)=abb134(6)*abb134(8)
      abb134(10)=spak1k2*spbk5k2
      abb134(5)=-spbk6k1*abb134(10)*abb134(5)
      abb134(6)=es61*abb134(6)
      abb134(5)=abb134(6)+abb134(5)
      abb134(5)=2.0_ki*abb134(8)*abb134(5)
      abb134(6)=-es345+es12+es61
      abb134(11)=spbk5k2*spak1k4
      abb134(6)=abb134(11)*abb134(6)
      abb134(12)=spbk5k1*spak1k4
      abb134(13)=spbk6k2*spak1k6
      abb134(14)=-abb134(12)*abb134(13)
      abb134(6)=abb134(14)+abb134(6)
      abb134(6)=-abb134(7)*abb134(6)
      abb134(14)=spak1k6*spbk6k5
      abb134(10)=abb134(14)+abb134(10)
      abb134(14)=-spak4k6*abb134(10)*abb134(7)
      abb134(15)=-spbk6k2*abb134(14)
      abb134(6)=abb134(15)+abb134(6)
      abb134(6)=4.0_ki*abb134(6)
      abb134(10)=abb134(10)*abb134(8)
      abb134(15)=abb134(10)*spak4e6
      abb134(16)=abb134(8)*spak1e6
      abb134(17)=abb134(16)*abb134(12)
      abb134(15)=abb134(15)+abb134(17)
      abb134(15)=4.0_ki*abb134(15)
      abb134(17)=4.0_ki*abb134(9)
      abb134(18)=-2.0_ki*abb134(9)
      abb134(19)=abb134(7)*spbk6e6
      abb134(20)=-spak1k6*abb134(19)
      abb134(21)=abb134(8)*spak1k2
      abb134(20)=abb134(20)-abb134(21)
      abb134(12)=abb134(20)*abb134(12)
      abb134(14)=spbk6e6*abb134(14)
      abb134(10)=spak2k4*abb134(10)
      abb134(11)=abb134(11)*abb134(19)
      abb134(19)=-abb134(8)*spbk6k5*spak1k4
      abb134(11)=abb134(19)+abb134(11)
      abb134(11)=spak2k6*abb134(11)
      abb134(10)=abb134(11)+abb134(10)+abb134(12)+abb134(14)
      abb134(10)=2.0_ki*abb134(10)
      abb134(11)=2.0_ki*spae6k6
      abb134(12)=abb134(11)*spbk6k2
      abb134(14)=abb134(12)*abb134(21)
      abb134(7)=-8.0_ki*abb134(7)*abb134(13)
      abb134(13)=8.0_ki*abb134(16)
      abb134(16)=-4.0_ki*abb134(20)
      abb134(11)=abb134(8)*abb134(11)
      abb134(8)=spak2k4*abb134(12)*abb134(8)
      R2d134=abb134(9)
      rat2 = rat2 + R2d134
      if (debug_nlo_diagrams) then
          write (logfile,*) "<result name='r2' index='134' value='", &
          & R2d134, "'/>"
      end if
   end subroutine
end module p16_bbarb_hepemg_abbrevd134h2
