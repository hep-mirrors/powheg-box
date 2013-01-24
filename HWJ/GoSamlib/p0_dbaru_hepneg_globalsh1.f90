module     p0_dbaru_hepneg_globalsh1
   use p0_dbaru_hepneg_config, only: ki
   use p0_dbaru_hepneg_color, only:&
      & c1v => c1

   implicit none
   private
   complex(ki), public :: c1

   public :: init_lo

   complex(ki), public :: rat2
contains

subroutine     init_lo()
   use p0_dbaru_hepneg_globalsl1, only: epspow, ccontract, amp0
   implicit none
   c1 = ccontract(c1v, amp0)
end subroutine init_lo

end module p0_dbaru_hepneg_globalsh1
