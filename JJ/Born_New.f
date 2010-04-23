      subroutine setborn(p,bflav,born,bornjk,bmunu)
      implicit none
      include 'nlegborn.h'
      include '../include/pwhg_math.h'
      include '../include/pwhg_st.h'
      include '../include/pwhg_kn.h'
      include 'PhysPars.h'

      integer nlegs
      parameter (nlegs=nlegborn)
      real * 8 p(0:3,nlegs),bornjk(nlegs,nlegs)
      integer bflav(nlegs)
      real * 8 bmunu(0:3,0:3,nlegs),born
      real *8 borntmp
      integer mu,nu,j,k

      integer ileg,ioleg
      real *8 kb_mad(0:3,nlegs)
C     define a real *8 value for nc in order
C     to avoid integer by integer division
      real *8 ncol
      parameter (ncol=nc)
      real *8 VC
      parameter(VC=ncol**2-1)

      real * 8 gtens(0:3,0:3),ap
      data gtens/1d0, 0d0, 0d0, 0d0,
     #           0d0,-1d0, 0d0, 0d0,
     #           0d0, 0d0,-1d0, 0d0,
     #           0d0, 0d0, 0d0,-1d0/
      save gtens

      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      real *8 Hat,Hau,HB,HCs,HCt,HCu,HDs,HDt,HDu,dotp
      external Hat,Hau,HB,HCs,HCt,HCu,HDs,HDt,HDu,dotp
      real * 8 symfac

c     The process class according to Kunszt Soper
      character*3  ks_label
c     The madgraph process (based on 2 flavour scheme)
      character*10 mg_label
c     The map from POWHEG-BOX to Kunszt-Soper particles and momenta.
      integer ksmap(4)
c     Kunszt-Soper momenta analogous to POWHEG-BOX.
      real*8  k1(0:3),k2(0:3),k3(0:3),k4(0:3)
c     Variables to hold spin / colour average factor (& overall +/- sign)
      real*8 spin_col_avg

c     Get the Kunszt Soper and Madgraph labels as well as the map
c     to Kunszt Soper conventions:
      call ks_2to2_map(bflav,ks_label,mg_label,ksmap)  
c     Assign Kunszt Soper momenta
      do mu=0,3
         p(mu,3)=-p(mu,3)  ! temprarily flip the outgoing momenta
         p(mu,4)=-p(mu,4)  !
      enddo
      do mu=0,3
         k1(mu)=p(mu,ksmap(1))  ! setting the Kunszt Soper momenta using
         k2(mu)=p(mu,ksmap(2))  ! the Kunszt Soper map.
         k3(mu)=p(mu,ksmap(3))  ! 
         k4(mu)=p(mu,ksmap(4))  !
      enddo
      do mu=0,3
         p(mu,3)=-p(mu,3)  ! restore the powheg outgoing momenta
         p(mu,4)=-p(mu,4)  !
      enddo      
   
c     set madgraph parameters that can change on an event-by-event basis
      call mad_setparam

      do ileg=1,4
         do mu=0,3
            kb_mad(mu,ileg)=p(mu,ileg)
         enddo
      enddo
c     to avoid bugs in HELAS, restore exact masslessness of incoming partons 
      kb_mad(0,1)=dabs(kb_mad(3,1))
      kb_mad(0,2)=dabs(kb_mad(3,2))

c$$$c    also outgoing ?    
c$$$       kb_mad(0,3)=sqrt(dabs(kb_mad(1,3)**2+kb_mad(2,3)**2+kb_mad(3,3)
c$$$     $     **2))
c$$$      kb_mad(0,4)=sqrt(dabs(kb_mad(1,4)**2+kb_mad(2,4)**2+kb_mad(3,4)
c$$$     $     **2))


      call compborn(kb_mad,bflav,borntmp)
      born=borntmp

c Colour factors for colour-correlated Born amplitudes;
c Rule from Kunszt-Soper.
c First, identify the flavour structure

C --------------------------------------------------------------------
C     A-type: q + Q -> q + Q plus charge conjugations and crossings
C --------------------------------------------------------------------
      if((ks_label.eq.'A1a').or.(ks_label.eq.'A1b').or.
     $   (ks_label.eq.'A1c').or.(ks_label.eq.'A1d').or.
     $   (ks_label.eq.'A2a').or.(ks_label.eq.'A2b').or.
     $   (ks_label.eq.'A2c').or.(ks_label.eq.'A2d').or.
     $   (ks_label.eq.'A3a').or.(ks_label.eq.'A3b').or.
     $   (ks_label.eq.'A3c').or.(ks_label.eq.'A3d')) then

         spin_col_avg = 4.*ncol*ncol

         bornjk(ksmap(1),ksmap(2)) = (4.*pi*st_alpha)**2 * 
     $        ( 2*VC/nc*HAt(k1,k2,k3,k4))         / spin_col_avg
         bornjk(ksmap(1),ksmap(3)) = (4.*pi*st_alpha)**2 * 
     $        (-VC/nc*HAt(k1,k2,k3,k4))           / spin_col_avg
         bornjk(ksmap(1),ksmap(4)) = (4.*pi*st_alpha)**2 * 
     $        (VC/nc*(nc**2-2)*HAt(k1,k2,k3,k4))  / spin_col_avg
         bornjk(ksmap(3),ksmap(4)) = bornjk(ksmap(1),ksmap(2))
         bornjk(ksmap(2),ksmap(4)) = bornjk(ksmap(1),ksmap(3))
         bornjk(ksmap(2),ksmap(3)) = bornjk(ksmap(1),ksmap(4))

C --------------------------------------------------------------------
C     B-type: q + q -> q + q plus charge conjugations
C --------------------------------------------------------------------
      elseif((ks_label.eq.'Ba').or.(ks_label.eq.'Bb').or.
     $       (ks_label.eq.'Bc').or.(ks_label.eq.'Bd').or.
     $       (ks_label.eq.'Be').or.(ks_label.eq.'Bf')) then

         spin_col_avg = 4.*ncol*ncol

         bornjk(ksmap(1),ksmap(2))=(4.*pi*st_alpha)**2 * 
     $        ( 2*VC/nc/nc) *
     $   (-HB(k1,k2,k3,k4)+nc*(HAt(k1,k2,k3,k4)+HAu(k1,k2,k3,k4))
     $   -nc**2*HB(k1,k2,k3,k4))
     $   /spin_col_avg

         bornjk(ksmap(1),ksmap(3))=(4.*pi*st_alpha)**2 * 
     $        ( 2*VC/nc/nc) *
     $   (HB(k1,k2,k3,k4)-nc*(HAu(k1,k2,k3,k4)+0.5*HAt(k1,k2,k3,k4))
     $   +0.5*nc**3*HAu(k1,k2,k3,k4))
     $   /spin_col_avg


         bornjk(ksmap(1),ksmap(4))=(4.*pi*st_alpha)**2 * 
     $        ( 2*VC/nc/nc) *
     $   (HB(k1,k2,k3,k4)-nc*(HAt(k1,k2,k3,k4)+0.5*HAu(k1,k2,k3,k4))
     $   +0.5*nc**3*HAt(k1,k2,k3,k4))
     $   /spin_col_avg

         bornjk(ksmap(3),ksmap(4))=bornjk(ksmap(1),ksmap(2))
         bornjk(ksmap(2),ksmap(4))=bornjk(ksmap(1),ksmap(3))
         bornjk(ksmap(2),ksmap(3))=bornjk(ksmap(1),ksmap(4))

C --------------------------------------------------------------------
C     C-type: q + qb -> g + g plus charge conjugations & crossings
C --------------------------------------------------------------------
      elseif((ks_label.eq.'C1a').or.(ks_label.eq.'C1b').or.
     $       (ks_label.eq.'C2a').or.(ks_label.eq.'C2b').or.
     $       (ks_label.eq.'C3a').or.(ks_label.eq.'C3b').or.
     $       (ks_label.eq.'C5a').or.(ks_label.eq.'C5b').or.
     $       (ks_label.eq.'C6a').or.(ks_label.eq.'C6b').or.
     $       (ks_label.eq.'C4')) then
         if((ks_label.eq.'C1a').or.(ks_label.eq.'C1b')) then
            spin_col_avg =  4.*ncol*ncol
         elseif((ks_label.eq.'C2a').or.(ks_label.eq.'C2b').or.
     $          (ks_label.eq.'C3a').or.(ks_label.eq.'C3b').or.
     $          (ks_label.eq.'C5a').or.(ks_label.eq.'C5b').or.
     $          (ks_label.eq.'C6a').or.(ks_label.eq.'C6b')) then
            spin_col_avg = -4.*ncol*VC
         elseif(ks_label.eq.'C4') then
            spin_col_avg =  4.*VC*VC
         endif

         bornjk(ksmap(1),ksmap(2))=(4.*pi*st_alpha)**2 * 
     $        ( VC) *
     $   (-(HCt(k1,k2,k3,k4)+HCu(k1,k2,k3,k4)-HCs(k1,k2,k3,k4))
     $   +1./nc/nc * HCs(k1,k2,k3,k4))
     $   / spin_col_avg

         bornjk(ksmap(1),ksmap(3))=(4.*pi*st_alpha)**2 * 
     $        ( VC) *
     $   (nc**2 *HCu(k1,k2,k3,k4) - HCs(k1,k2,k3,k4))
     $   / spin_col_avg

         bornjk(ksmap(1),ksmap(4))=(4.*pi*st_alpha)**2 * 
     $        ( VC) *
     $   (nc**2 *HCt(k1,k2,k3,k4) - HCs(k1,k2,k3,k4))
     $   / spin_col_avg

         bornjk(ksmap(2),ksmap(4))=bornjk(ksmap(1),ksmap(3))
         bornjk(ksmap(2),ksmap(3))=bornjk(ksmap(1),ksmap(4))
         bornjk(ksmap(3),ksmap(4))=(4.*pi*st_alpha)**2 * 
     $        ( VC*nc**2) *
     $   (HCt(k1,k2,k3,k4) + HCu(k1,k2,k3,k4))
     $   / spin_col_avg

C --------------------------------------------------------------------
C     D-type: g + g -> g + g
C --------------------------------------------------------------------
      elseif(ks_label.eq.'D') then
         spin_col_avg =  4.*VC*VC
         bornjk(1,2)=(4.*pi*st_alpha)**2 * 
     $        ( 2*VC*nc**3*HDs(k1,k2,k3,k4)) / spin_col_avg
         bornjk(1,3)=(4.*pi*st_alpha)**2 * 
     $        ( 2*VC*nc**3*HDt(k1,k2,k3,k4)) / spin_col_avg
         bornjk(1,4)=(4.*pi*st_alpha)**2 * 
     $        ( 2*VC*nc**3*HDu(k1,k2,k3,k4)) / spin_col_avg

         bornjk(2,4)=bornjk(1,3)
         bornjk(2,3)=bornjk(1,4)
         bornjk(3,4)=bornjk(1,2)        

      else
         write(*,*) 'setborn: could not identify flavour list!'
         call exit(1)
      endif



C - Bkj=Bjk
      do j=1,nlegborn
C - bornjk(j,j) is not used in soft
         bornjk(j,j)=0d0
         do k=j+1,nlegborn
            bornjk(ksmap(k),ksmap(j))=bornjk(ksmap(j),ksmap(k))
         enddo
      enddo

c normalize: kunszt and Soper have an extra 2, see eq A8 and A11 in
c PRD46-192
      if(bflav(3).eq.bflav(4)) then
         symfac=0.5d0
      else
         symfac=1
      endif
      do j=1,nlegborn
         do k=1,nlegborn
c     bornjk(j,j) is not used in soft
            bornjk(j,k)=bornjk(j,k)/2*symfac
         enddo
      enddo

      
c     spin-projected here are not needed 
      do ileg=1,nlegborn
         if(bflav(ileg).eq.0) then
c find opposite leg
            if(ileg.eq.1) then
               ioleg=2
            elseif(ileg.eq.2) then
               ioleg=1
            elseif(ileg.eq.3) then
               ioleg=4
            elseif(ileg.eq.4) then
               ioleg=3
            endif
            do mu=0,3
               do nu=0,3
                  bmunu(mu,nu,ileg)=(-gtens(mu,nu)+
     1           (kn_cmpborn(mu,ileg)*kn_cmpborn(nu,ioleg)
     2           +kn_cmpborn(nu,ileg)*kn_cmpborn(mu,ioleg))/
     2            dotp(kn_cmpborn(0,ileg),kn_cmpborn(0,ioleg)))*born/2
               enddo
            enddo
         endif
      enddo
      
      end


C - The following functions are taken from Kunszt & Soper Phys.Rev.D46,1 192 

      function HAt(p1,p2,p3,p4)
      real *8 Hat
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      real *8 s,t,u
      real *8 dotp
      external dotp
      s=2.*dotp(p1,p2)
      t=2.*dotp(p1,p3)
      u=2.*dotp(p1,p4)
      HAt=2.*(s**2+u**2)/t**2
      return
      end

      function HAu(p1,p2,p3,p4)
      real *8 HAu
      real *8 HAt
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      HAu=HAt(p1,p2,p4,p3)
      return
      end


      function HB(p1,p2,p3,p4)
      real *8 HB
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      real *8 s,t,u
      real *8 dotp
      external dotp
      s=2.*dotp(p1,p2)
      t=2.*dotp(p1,p3)
      u=2.*dotp(p1,p4)
      HB=2.*s**2/t/u
      return
      end


      function HCt(p1,p2,p3,p4)
      real *8 HCt
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      real *8 s,t,u
      real *8 dotp
      external dotp
      s=2.*dotp(p1,p2)
      t=2.*dotp(p1,p3)
      u=2.*dotp(p1,p4)
      HCt=(2.*(t**2+u**2)/s**2 )*t/u
      return
      end

      function HCu(p1,p2,p3,p4)
      real *8 HCu
      real *8 HCt
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      HCu=HCt(p1,p2,p4,p3)
      return
      end

      function HCs(p1,p2,p3,p4)
      real *8 HCs
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      real *8 s,t,u
      real *8 dotp
      external dotp
      s=2.*dotp(p1,p2)
      t=2.*dotp(p1,p3)
      u=2.*dotp(p1,p4)
      HCs=2.*(t**2+u**2)/t/u
      return
      end


      function HDs(p1,p2,p3,p4)
      real *8 HDs
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      real *8 s,t,u
      real *8 dotp
      external dotp
      s=2.*dotp(p1,p2)
      t=2.*dotp(p1,p3)
      u=2.*dotp(p1,p4)
      HDs=2.*(t**2+u**2) *(s**4+t**4+u**4)/(s*t*u)**2
      return
      end

      function HDt(p1,p2,p3,p4)
      real *8 HDt,HDs
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      HDt=HDs(p1,p3,p2,p4)
      return
      end

      function HDu(p1,p2,p3,p4)
      real *8 HDu,HDs
      real *8 p1(0:3),p2(0:3),p3(0:3),p4(0:3)
      HDu=HDs(p1,p4,p2,p3)
      return
      end


c Now in external file borncolour.f. 
c Will be put back here when finished.
c      subroutine borncolour_lh
c Sets up the colour for the given flavour configuration
c already filled in the Les Houches interface.
c In case there are several colour structure, one
c should pick one with a probability proportional to
c the value of the corresponding cross section, for the
c kinematics defined in the Les Houches interface
c      implicit none
c
cc     TO BE COMPLETED
c      
c      write(*,*) "borncolour_lh TO BE COMPLETED!!" 
c      call exit(1)
c
c      end


      subroutine resonances_lh
c     Set up the resonances whose mass must be preserved
c     on the Les Houches interface.
c     Before that, call the routine that generates the decay.
c     Notice that the current subroutine is called at the end
c     of gen_leshouches (or gen_leshouches_reg). This means
c     that the overall azimuthal rotation has been already
c     performed (add_azimuth called in pwhgevent). 
      implicit none

c     TO BE COMPLETED
      
      write(*,*) "resonances_lh TO BE COMPLETED (not needed ??) " 
      call exit(1)

      end
