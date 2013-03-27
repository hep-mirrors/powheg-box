module     p12_sbars_hepemg_abbrevd204h2
   use p12_sbars_hepemg_config, only: ki
   use p12_sbars_hepemg_globalsh2
   implicit none
   private
   complex(ki), dimension(32), public :: abb204
   complex(ki), public :: R2d204
   public :: init_abbrev
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
contains
   subroutine     init_abbrev()
      use p12_sbars_hepemg_config, only: deltaOS, &
     &    logfile, debug_nlo_diagrams
      use p12_sbars_hepemg_kinematics
      use p12_sbars_hepemg_model
      use p12_sbars_hepemg_color, only: TR
      use p12_sbars_hepemg_globalsl1, only: epspow
      implicit none
      abb204(1)=1.0_ki/(-mZ**2+es345+i_*mZ*wZ)
      abb204(2)=1.0_ki/(-mZ**2+es45+i_*mZ*wZ)
      abb204(3)=NC**(-1)
      abb204(4)=spbk6e6*spak4k6
      abb204(5)=spak1k4*spbe6k1
      abb204(4)=abb204(4)-abb204(5)
      abb204(4)=abb204(4)*spbk5k2
      abb204(6)=gSl*ger*abb204(3)*abb204(1)*abb204(2)*gHZZ*c1*TR*i_
      abb204(7)=2.0_ki*abb204(6)
      abb204(8)=abb204(7)*spak1e6
      abb204(9)=abb204(8)*es12*abb204(4)
      abb204(10)=spak1k4*es12
      abb204(11)=-spak1k2*spak4k6*spbk6k2
      abb204(10)=abb204(11)+abb204(10)
      abb204(11)=4.0_ki*abb204(6)
      abb204(12)=abb204(11)*spbk5k2
      abb204(10)=abb204(10)*abb204(12)
      abb204(13)=spbe6k2*spak1k2
      abb204(14)=spbk5k2*spak4e6
      abb204(15)=abb204(13)*abb204(14)
      abb204(16)=abb204(11)*abb204(15)
      abb204(4)=spak1e6*abb204(4)
      abb204(4)=-abb204(15)+abb204(4)
      abb204(4)=abb204(4)*abb204(11)
      abb204(6)=8.0_ki*spak1k4*abb204(6)*spbk5k2
      abb204(17)=-spbe6k5*spbk2k1
      abb204(18)=spbe6k2*spbk5k1
      abb204(17)=abb204(17)+abb204(18)
      abb204(17)=abb204(17)*spak1e6
      abb204(18)=-spbe6k2*spae6k6*spbk6k5
      abb204(17)=abb204(17)+abb204(18)
      abb204(17)=spak1k4*abb204(17)
      abb204(15)=abb204(15)+abb204(17)
      abb204(15)=abb204(15)*abb204(7)
      abb204(17)=abb204(11)*spak1k4
      abb204(18)=-spbk5k2*abb204(17)
      abb204(19)=abb204(17)*spbe6k5
      abb204(20)=spbe6k5*abb204(7)*spak1k4
      abb204(21)=abb204(14)*abb204(11)
      abb204(14)=-abb204(7)*abb204(14)
      abb204(22)=spbk6e6*spbk5k1
      abb204(23)=abb204(22)*abb204(8)*spak1k4
      abb204(24)=-spbk6k5*abb204(17)
      abb204(25)=abb204(13)*spae6k6
      abb204(26)=spbk6k2*abb204(7)*abb204(25)
      abb204(27)=abb204(11)*spak1e6
      abb204(28)=spbe6k2*abb204(27)
      abb204(29)=spak1k6*abb204(7)*spbk6e6
      abb204(30)=-spae6k6*spbk6k2
      abb204(31)=spak1e6*spbk2k1
      abb204(30)=abb204(30)+abb204(31)
      abb204(30)=abb204(30)*abb204(7)
      abb204(31)=abb204(8)*spbk6e6
      abb204(22)=-spak1k6*abb204(22)
      abb204(32)=-spbe6k5*es12
      abb204(13)=spbk5k1*abb204(13)
      abb204(13)=abb204(13)+abb204(22)+abb204(32)
      abb204(13)=spak1e6*abb204(13)
      abb204(22)=-spbk6k5*abb204(25)
      abb204(13)=abb204(22)+abb204(13)
      abb204(7)=abb204(13)*abb204(7)
      abb204(13)=spbk6k5*spak1k6
      abb204(22)=-spbk5k2*spak1k2
      abb204(13)=abb204(13)+abb204(22)
      abb204(13)=abb204(13)*abb204(11)
      abb204(22)=abb204(27)*spbe6k5
      abb204(25)=-spbe6k5*abb204(8)
      abb204(12)=spak4k6*abb204(12)
      abb204(5)=abb204(5)*abb204(8)*spbk5k1
      abb204(8)=-spbk5k1*abb204(17)
      abb204(17)=-spbe6k1*abb204(27)
      R2d204=0.0_ki
      rat2 = rat2 + R2d204
      if (debug_nlo_diagrams) then
          write (logfile,*) "<result name='r2' index='204' value='", &
          & R2d204, "'/>"
      end if
   end subroutine
end module p12_sbars_hepemg_abbrevd204h2
