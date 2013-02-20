c Mappings of the underlying born configuration in
c kn_cmpborn(0:3,nlegborn), and the xrad(1:3) variables
c in the unit cube, into kn_real(0:3,nlegreal).
c The factor jac_over_csi*csi*kn_csimax, multiplied
c by the Born phase space jacobian, yields the real phase
c space jacobian.
c More explicitly:
c d Phi_n = d^3 xrad jac_over_csi csi csimax d Phi_{n-1}
c Since
c  d Phi_n = d phi d y d csi Jrad d Phi_{n-1}
c (where Jrad is given in FNO2006) we get
c                                  d phi d y d csi
c csimax csi jac_over_csi = Jrad  ----------------
c                                    d^3 xrad
c Notice that using d csi=d csitilde csimax the csimax
c factor cancels, and jac_over_csi is as given in the
c code below (see notes on xscaled.tm).
c gen_real_phsp_fsr: provides the mapping for the final state
c radiation, assuming that the emitter is the kn_emitter-th
c particle, and the emitted particle is the nlegreal-th particle
c gen_real_phsp_isr: mapping for the initial state radiation
      subroutine gen_real_phsp_fsr(xrad,
     #   jac_over_csi,jac_over_csi_coll,jac_over_csi_soft)
      implicit none
      real * 8 xrad(3),jac_over_csi,
     #        jac_over_csi_coll,jac_over_csi_soft
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_rad.h'
      include 'pwhg_par.h'
      include 'pwhg_flg.h'
      real * 8 q0,q2,xjac
      real * 8 betalept
      real * 8 decmass
      common/clepmass/decmass
c find rad_kinreg as function of kn_emitter
      rad_kinreg=kn_emitter+2-flst_lightpart
c Boost the underlying Born variables to their cm frame
      q0=2*kn_cmpborn(0,1)
      q2=kn_sborn
      if(flg_jacsing) then
         kn_csitilde=(1-par_fsrtinycsi)
     1        -(1-xrad(1))**2*(1-2*par_fsrtinycsi)
         xjac=2*(1-xrad(1))
      else
         kn_csitilde=xrad(1)*(1-2*par_fsrtinycsi)+par_fsrtinycsi
         xjac=1
      endif
c original version
c      kn_y=1-2*xrad(2)
c      xjac=xjac*2
cc importance sampling for kn_y
c      xjac=xjac*1.5d0*(1-kn_y**2)
c      kn_y=1.5d0*(kn_y-kn_y**3/3)*(1-par_fsrtinyy)

      betalept= sqrt(1d0-4d0*decmass/sqrt(q2))
     +         *sqrt(1d0+4d0*decmass/sqrt(q2))
      kn_y= 1.d0/betalept*
     + ( 1d0 - (1d0+betalept) * 
     +          exp(-xrad(2)*log((1d0+betalept)/(1d0-betalept))) )
      xjac= xjac*( 1d0-betalept*kn_y )
     +          *(log((1.d0+betalept)/(1.d0-betalept)))/betalept

      kn_azi=2*pi*xrad(3)
      xjac=xjac*2*pi
      call compcsimaxfsr
      kn_csi=kn_csitilde*kn_csimax     
c remember: no csimax in the jacobian factor, we are integrating in csitilde 
      call gen_real_phsp_fsr_rad
      jac_over_csi=xjac*kn_jacreal/kn_csi
      jac_over_csi_coll=xjac*q2/(4*pi)**3
     #                *(1-kn_csi/2*q0/kn_cmpborn(0,kn_emitter))
      jac_over_csi_soft=xjac*q2/(4*pi)**3
      end

      subroutine gen_real_phsp_fsr_rad0
c     Same as gen_real_phsp_fsr_rad, but for given kn_csitilde
c     instead of kn_csi.
c     Used in the generation of radiation
      implicit none
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_rad.h'
      real * 8 q0,q2
c Boost the underlying Born variables to their cm frame
      kn_emitter=flst_lightpart+rad_kinreg-2
      q0=2*kn_cmpborn(0,1)
      q2=kn_sborn
      call compcsimaxfsr
      kn_csi=kn_csitilde*kn_csimax
c remember: no csimax in the jacobian factor, we are integrating in csitilde 
      call gen_real_phsp_fsr_rad
      end

c gen_real_phsp_fsr_rad: provides the mapping for the final state
c radiation, assuming that we are considering the region rad_kinreg
c and the emitted particle is the nlegreal-th particle,
c for given kn_csi, kn_y, kn_azi. Sets the jacobian
c kn_jacreal so that kn_jacreal d kn_csi d kn_y d kn_azi times
c the underlying Born jacobian is the phase space volume
      subroutine gen_real_phsp_fsr_rad
      implicit none
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_rad.h'
      real * 8 vec(3),q0,beta
      integer i
      data vec/0d0,0d0,1d0/
      save vec
      q0=2*kn_cmpborn(0,1)
      kn_emitter=flst_lightpart+rad_kinreg-2
c remember: no csimax factor, we are integrating in csitilde
      if(kn_masses(kn_emitter).eq.0) then
         call barradmap(nlegborn-2,kn_emitter-2,q0,kn_cmpborn(0,3),
     1    kn_csi,kn_y,kn_azi,kn_preal(0,3),kn_jacreal)
      else
c massive case; here kn_y will assume a different meaning!
         call compcsimaxfsr
         if(kn_csi.gt.kn_csimax) then
            kn_jacreal=0
            return
         endif
         call barradmapmv(nlegborn-2,kn_emitter-2,
     1   kn_masses(kn_emitter)**2,q0,kn_cmpborn(0,3),
     2    kn_csi,kn_y,kn_azi,kn_preal(0,3),kn_jacreal)
      endif

      beta=(kn_xb1-kn_xb2)/(kn_xb1+kn_xb2)
      call mboost(nlegreal-2,vec,beta,kn_preal(0,3),kn_preal(0,3))
      do i=0,3
         kn_preal(i,1)=kn_pborn(i,1)
         kn_preal(i,2)=kn_pborn(i,2)
      enddo
      kn_x1=kn_xb1
      kn_x2=kn_xb2
      kn_sreal=kn_sborn
      call checkmomzero(nlegreal,kn_preal)
      call compcmkin
      call compdij
      if(kn_masses(kn_emitter).eq.0) then
         call setsoftvecfsr
      else
         call setsoftvecfsrmv
      endif
      call compdijsoft
      end

c This routine performs the inverse mapping from barred and radiation
c variables to the n+1 momenta, as in Sec. 5.2.1 in fno2006.
c All particle can have masses, except for the n+1-th and j-th.
c conventions: vector(4)=(x,y,z,t)
c Input:
c n           : number of final state barred momenta
c j           : the emitter
c q0          : CM energy
c barredk(4,n): the n barred-k 4-vectors
c csi,y,phi   : the radiation variables
c Output:
c xk(4,n+1)   : the n+1 real final state momenta
c jac         : jacobian factor on phirad
      subroutine barradmap(n,j,q0,barredk,csi,y,phi,xk,jac)
      implicit none
c parameters
      include 'pwhg_math.h'
      integer n,j
      real * 8 q0,barredk(0:3,n),csi,y,phi,xk(0:3,n+1),jac
C Local variables
      real * 8 q2,mrec2,k0np1,uknp1,ukj,uk,cpsi,cpsi1,ubkj,vec(3),
     #     norm,k0rec,ukrec,beta,k2
      integer i
c     according to fno2006: by k0 we mean the 0 component in the CM, by
c     uk (underlined k) we mean the modulus of its 3-momentum n and np1
c     in a variable name suggests n and n+1, etc.
      q2=q0**2
c (5.42) of fnw2006
      k0np1=csi*q0/2
      uknp1=k0np1
c compute Mrec^2 (5.45)
      mrec2=(q0-barredk(0,j))**2
     #     -barredk(1,j)**2-barredk(2,j)**2-barredk(3,j)**2
      ukj=(q2-mrec2-2*q0*uknp1)/(2*(q0-uknp1*(1-y)))
c compute the length of k (5.44)
      uk=sqrt(ukj**2+uknp1**2+2*ukj*uknp1*y)
c compute cos psi (angle between knp1 and k)
      cpsi=(uk**2+uknp1**2-ukj**2)/(2*uk*uknp1)
c get the cosine of the angle between kn and k
      cpsi1=(uk**2+ukj**2-uknp1**2)/(2*uk*ukj)
c Set k_j and k_n+1 parallel to kbar_n
      ubkj=barredk(0,j)
      do i=0,3
         xk(i,j)=ukj*barredk(i,j)/ubkj
         xk(i,n+1)=uknp1*barredk(i,j)/ubkj
      enddo
c Set up a unit vector orthogonal to kbar_n and to the z axis
      vec(3)=0
      norm=sqrt(barredk(1,j)**2+barredk(2,j)**2)
      vec(1)=barredk(2,j)/norm
      vec(2)=-barredk(1,j)/norm
c Rotate k_n+1 around vec of an amount psi
      call mrotate(vec,sqrt(abs(1-cpsi**2)),cpsi,xk(1,n+1))
c Rotate k_j around vec of an amount psi1 in opposite direction
      call mrotate(vec,-sqrt(abs(1-cpsi1**2)),cpsi1,xk(1,j))
c set up a unit vector parallel to kbar_j
      do i=1,3
         vec(i)=barredk(i,j)/ubkj
      enddo
c Rotate k_j and k_n+1 around this vector of an amount phi
      call mrotate(vec,sin(phi),cos(phi),xk(1,n+1))
      call mrotate(vec,sin(phi),cos(phi),xk(1,j))
c compute the boost velocity
      k0rec=q0-ukj-uknp1
c use abs to fix tiny negative root FPE
      ukrec=sqrt(abs(k0rec**2-mrec2))
      beta=(q2-(k0rec+ukrec)**2)/(q2+(k0rec+ukrec)**2)
c     Boost all other barred k (i.e. 1 to j-1,j+1 to n) along vec with velocity
c     beta in the k direction (same as barred k_j)
      do i=1,3
         vec(i)=barredk(i,j)/ubkj
      enddo
      call mboost(j-1,vec,beta,barredk(0,1),xk(0,1))
      if(n-j.gt.0) call mboost(n-j,vec,beta,barredk(0,j+1),xk(0,j+1))
      k2=2*ukj*uknp1*(1-y)
c returns jacobian of FNO 5.40 (i.e. jac*d csi * d y * d phi is phase space)
      jac=q2*csi/(4*pi)**3*ukj**2/ubkj/(ukj-k2/(2*q0))
      end


c This routine is as the previous one,
c in case the emitter is massive.
      subroutine barradmapmv(n,j,m2,q0,barredk,csi,y,phi,xk,jac)
      implicit none
c parameters
      include 'pwhg_math.h'
      integer n,j
      real * 8 q0,barredk(0:3,n),csi,y,phi,xk(0:3,n+1),jac
C Local variables
      real * 8 m2,q2,mrec2,k0np1,uknp1,ukj,k0j,uk,cpsi,cpsi1,vec(3),
     1     norm,k0rec,ukrec,beta,ukj0,alpha,
     2     ubkj,bk0j,bk0rec,ubkrec,k0jmax,k0recmax,z,z1,z2
      integer i
      real * 8 cosjnp1soft
      common/ccosjnp1soft/cosjnp1soft
      jac=1
c     according to fno2006: by k0 we mean the 0 component in the CM, by
c     uk (underlined k) we mean the modulus of its 3-momentum n and np1
c     in a variable name suggests n and n+1, etc.
      q2=q0**2
c (5.42) of fnw2006
      k0np1=csi*q0/2
c our reference is the Dalitz phase space d k0jp1 dk0j
      jac=jac*q0/2
      uknp1=k0np1
c compute Mrec^2 (5.45)
      mrec2=(q0-barredk(0,j))**2
     #     -barredk(1,j)**2-barredk(2,j)**2-barredk(3,j)**2
      k0recmax = (q2-m2+mrec2)/(2*q0)
      k0jmax   = (q2+m2-mrec2)/(2*q0)
      z1=(k0recmax+sqrt(k0recmax**2-mrec2))/q0
      z2=(k0recmax-sqrt(k0recmax**2-mrec2))/q0
      z=z2-(z2-z1)*(1+y)/2
      jac=jac*(z1-z2)/2
      k0j=k0jmax-k0np1*z
      jac=jac*k0np1
      ukj=sqrt(k0j**2-m2)
      k0rec=q0-k0np1-k0j
      ukrec=sqrt(k0rec**2-mrec2)
      uk=ukrec
c compute cos psi (angle between knp1 and k)
      cpsi=(uk**2+uknp1**2-ukj**2)/(2*uk*uknp1)
c get the cosine of the angle between kj and k
      cpsi1=(uk**2+ukj**2-uknp1**2)/(2*uk*ukj)
c Set k_j and k_n+1 parallel to kbar_j
      ubkj=sqrt(barredk(1,j)**2+barredk(2,j)**2+barredk(3,j)**2)
      bk0j=barredk(0,j)
      do i=0,3
         xk(i,n+1)=uknp1*barredk(i,j)/ubkj
      enddo
      xk(0,n+1)= k0np1
      do i=1,3
         xk(i,j)=ukj*barredk(i,j)/ubkj
      enddo
      xk(0,j)=k0j
c Set up a unit vector orthogonal to kbar_n and to the z axis
      vec(3)=0
      norm=sqrt(barredk(1,j)**2+barredk(2,j)**2)
      vec(1)=barredk(2,j)/norm
      vec(2)=-barredk(1,j)/norm
c Rotate k_n+1 around vec of an amount psi
      call mrotate(vec,sqrt(abs(1-cpsi**2)),cpsi,xk(1,n+1))
c Rotate k_j around vec of an amount psi1 in opposite direction
      call mrotate(vec,-sqrt(abs(1-cpsi1**2)),cpsi1,xk(1,j))
c set up a unit vector parallel to kbar_j
      do i=1,3
         vec(i)=barredk(i,j)/ubkj
      enddo
c Rotate k_j and k_n+1 around this vector of an amount phi
      call mrotate(vec,sin(phi),cos(phi),xk(1,n+1))
      call mrotate(vec,sin(phi),cos(phi),xk(1,j))
c find boost of recoil system
      bk0rec=q0-bk0j
      ubkrec=ubkj
      alpha=(k0rec+ukrec)/(bk0rec+ubkrec)
      beta=(1-alpha**2)/(1+alpha**2)
c massless limit is
c     beta=(q2-(k0rec+ukrec)**2)/(q2+(k0rec+ukrec)**2)
c     Boost all other barred k (i.e. 1 to j-1,j+1 to n) along vec with velocity
c     beta in the k direction (same as barred k_j)
      do i=1,3
         vec(i)=barredk(i,j)/ubkj
      enddo
      call mboost(j-1,vec,beta,barredk(0,1),xk(0,1))
      if(n-j.gt.0) call mboost(n-j,vec,beta,barredk(0,j+1),xk(0,j+1))
c 
      jac=jac*q0/((2*pi)**3*2*ubkj)
c compute the cosine of the angle between kj and kn+1 IN THE SOFT LIMIT.
c this must replace kn_y when computing the soft limit vector
c since kn_y has a different meaning here
      cosjnp1soft=(2*q2*z-q2-mrec2+m2)/(sqrt(k0jmax**2-m2)*q0)/2
      end

c END FSR
c ISR:


      subroutine gen_real_phsp_isr(xrad,
     #    jac_over_csi,jac_over_csi_p,jac_over_csi_m,jac_over_csi_s)
      implicit none
      real * 8 xrad(3),
     #    jac_over_csi,jac_over_csi_p,jac_over_csi_m,jac_over_csi_s
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_rad.h'
      include 'pwhg_par.h'
      real * 8 xjac
      rad_kinreg=1
      kn_csitilde=(3-2*xrad(1))*xrad(1)**2
      xjac=6*(1-xrad(1))*xrad(1)
      kn_csitilde=kn_csitilde*(1-2*par_isrtinycsi)+par_isrtinycsi
      kn_y=1-2*xrad(2)
      xjac=xjac*2
      xjac=xjac*1.5d0*(1-kn_y**2)
      kn_y=1.5d0*(kn_y-kn_y**3/3)*(1-par_isrtinyy)
      kn_azi=2*pi*xrad(3)
      xjac=xjac*2*pi
      call compcsimax
      kn_csi=kn_csitilde*kn_csimax
      kn_csip=kn_csitilde*kn_csimaxp
      kn_csim=kn_csitilde*kn_csimaxm
      call gen_real_phsp_isr_rad
      jac_over_csi=xjac*kn_jacreal/kn_csi
      jac_over_csi_p=xjac*(kn_sborn/(1-kn_csip))/(4*pi)**3/(1-kn_csip)
      jac_over_csi_m=xjac*(kn_sborn/(1-kn_csim))/(4*pi)**3/(1-kn_csim)
c here we need the Born s (real s is function of Born s via csi)
      jac_over_csi_s=xjac*(kn_sborn)/(4*pi)**3
c      call checkmomzero(nlegreal,kn_preal)
      end

      subroutine compcsimax
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      real * 8 y,xb1,xb2
      xb1=kn_xb1
      xb2=kn_xb2
      y=kn_y
      kn_csimax=1-max(2*(1+y)*xb1**2/
     #    (sqrt((1+xb1**2)**2*(1-y)**2+16*y*xb1**2)+(1-y)*(1-xb1**2)),
     #            2*(1-y)*xb2**2/
     #    (sqrt((1+xb2**2)**2*(1+y)**2-16*y*xb2**2)+(1+y)*(1-xb2**2)))
      kn_csimaxp=1-xb1
      kn_csimaxm=1-xb2
      end


      subroutine compcsimaxfsr
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      real * 8 q0,m2,mrec2,k0recmax,knp1max,z1,z2,z
      integer j
      q0=kn_cmpborn(0,1)+kn_cmpborn(0,2)
      j=kn_emitter
      m2=kn_masses(j)**2
      mrec2=(q0-kn_cmpborn(0,j))**2
     #     -kn_cmpborn(1,j)**2-kn_cmpborn(2,j)**2-kn_cmpborn(3,j)**2
      if(kn_masses(kn_emitter).eq.0) then
         kn_csimax=1-mrec2/q0**2
      else
         k0recmax = (q0**2-m2+mrec2)/(2*q0)
         z1=(k0recmax+sqrt(k0recmax**2-mrec2))/q0
         z2=(k0recmax-sqrt(k0recmax**2-mrec2))/q0
         z=z2-(z2-z1)*(1+kn_y)/2
         knp1max=-(q0**2*z**2-2*q0*k0recmax*z+mrec2)/(2*q0*z*(1-z))
         kn_csimax=2*knp1max/q0
      endif
      end

      subroutine comppt2fsrmv(y,csi,pt2)
c this subroutine computes the scale of the coupling in case
c of a massive final state emitter
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_mvem.h'
      real * 8 y,csi,pt2
      real * 8 z
      call setupmvemitter
      z=z2-(z2-z1)*(1+y)/2
      pt2=csi**2*q**3*(1-z)/(2*p0max-z*csi*q)
      end

      subroutine comptmaxmv(t)
      implicit none
      real * 8 t
      include 'pwhg_mvem.h'
      call setupmvemitter
      t=kt2max
      end
      
      subroutine compubradmv(y,csi,ub)
      implicit none
      include 'pwhg_mvem.h'
      integer em
      real * 8 y,csi,ub
      real * 8 z
      call setupmvemitter
      z=z2-(z2-z1)*(1+y)/2
      ub=q/sqrt(p0max**2-m2)/(csi*(1-z))*(z1-z2)/2
      end

      subroutine compintub(t,integral)
      implicit none
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_mvem.h'
      real * 8 t,integral
      real * 8 csimin,csi1,csi
      real * 8 pwhg_gfun
      external pwhg_gfun
      call setupmvemitter
      csimin=(sqrt(t*(t*z2**2+8*p0max*q*(1-z2)))-t*z2)/(2*q**2*(1-z2))
c      csi1=(sqrt(t*(t*z1**2+8*p0max*q*(1-z1)))-t*z1)/(2*q**2*(1-z1))
c The following form is equivalent to the above, but has no large rounding
c errors when z1->1
      csi1=4*p0max*t/q/
     1 (sqrt(t*(t*z1**2+8*p0max*q*(1-z1)))+t*z1)
      csi=min(csimax,csi1)
      if(csi*q**2-t.lt.0.or.2*p0max-csi*q.lt.0) goto 998
      integral=
     1     log(csi)*log((1-z2)*q/t)+log(csi)**2/2+pwhg_gfun(-t,q**2,csi)
     2     -pwhg_gfun(2*p0max,-q,csi)
      csi=csimin
      if(csi*q**2-t.lt.0.or.2*p0max-csi*q.lt.0) goto 998
      integral=integral - (
     1     log(csi)*log((1-z2)*q/t)+log(csi)**2/2+pwhg_gfun(-t,q**2,csi)
     2     -pwhg_gfun(2*p0max,-q,csi)
     3 )
      if(csimax.gt.csi1) then
         integral=integral+log(csimax/csi1)*log((1-z2)/(1-z1))
      endif
c don't forget q0/pvec d phi integration!
      integral=integral*q/sqrt(p0max**2-m2)*2*pi
      return
 998  continue
      write(*,*) ' negative!!!'
      end

      subroutine gencsiymv(t,rv,csi,y)
      implicit none
      real * 8 t,rv,csi,y
      include 'pwhg_mvem.h'
      real * 8 csimin,csi1,csim,csimaxz,z
      call setupmvemitter
      csimin=(sqrt(t*(t*z2**2+8*p0max*q*(1-z2)))-t*z2)/(2*q**2*(1-z2))
      csi1=(sqrt(t*(t*z1**2+8*p0max*q*(1-z1)))-t*z1)/(2*q**2*(1-z1))
      csim=min(csimax,csi1)
      csi=(exp(log(csimin*q**2-t)
     1     +rv*log((csim*q**2-t)/(csimin*q**2-t)))+t)/q**2
      z=(csi**2*q**3-2*t*p0max)/(csi*q*(csi*q**2-t))
      y=2*(z-z2)/(z1-z2)-1
      csimaxz=-(q**2*z**2-2*q*k0recmax*z+mrec2)/(q**2*z*(1-z))
      if(csi.gt.csimaxz) then
c this signals if we are out of the relevant Dalitz region
         csi=2
      endif
      end

      subroutine setupmvemitter
c setup all quantities depending only upon the underlying born
c configuration for the massive emitter
      implicit none
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_rad.h'
      include 'pwhg_mvem.h'
      integer em
      em=flst_lightpart+rad_kinreg-2
      q=kn_cmpborn(0,1)+kn_cmpborn(0,2)
      m2=kn_masses(em)**2
      mrec2=abs((q-kn_cmpborn(0,em))**2
     1     -kn_cmpborn(1,em)**2-kn_cmpborn(2,em)**2-kn_cmpborn(3,em)**2)
      if (mrec2.lt.1d-10) mrec2 = 0d0
      csimax=1-(sqrt(m2)+sqrt(mrec2))**2/q**2
      k0recmax = (q**2-m2+mrec2)/(2*q)
      p0max   = (q**2+m2-mrec2)/(2*q)
      z1=(k0recmax+sqrt(k0recmax**2-mrec2))/q
      z2=(k0recmax-sqrt(k0recmax**2-mrec2))/q
      kt2max=csimax**2*q**3*(1-z2)/(2*p0max-z2*csimax*q)
      end

      function pwhg_gfun(a,b,csi)
c returns the indefinite integral
c Int d csi/csi log(a+b*csi), defined to vanish when a+b*csi=0,
c It assumes that a+b*csi>0 and csi>0 in the range of integration
      implicit none
      real * 8 pwhg_gfun,a,b,csi
      real * 8 pi
      parameter (pi=3.141592653589793d0)
      real * 8 ddilog
      external ddilog
      if(a.lt.0) then
         pwhg_gfun=log(b*csi+a)*log(1-(b*csi+a)/a)+ddilog((b*csi+a)/a)
      else
         pwhg_gfun=log(abs(b*csi/a))*log(a)-ddilog(-b*csi/a)+pi**2/6
      endif
      end
       


c     Same as gen_real_phsp_isr_rad, but for given kn_csitilde
c     instead of kn_csi.
      subroutine gen_real_phsp_isr_rad0
      implicit none
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      call compcsimax
      kn_csi=kn_csitilde*kn_csimax
      call gen_real_phsp_isr_rad
      end

      subroutine gen_real_phsp_isr_rad
      implicit none
      include 'pwhg_math.h'
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      real * 8 y,xb1,xb2,x1,x2,betal,betat,vecl(3),vect(3),
     #         cth,sth,cph,sph,csi,pt2
      integer i,mu
      real * 8 dotp
      external dotp
c the following call sets kn_csimax, kn_csimaxp, kn_csimaxm
c also when gen_real_phsp_isr_rad is called directly
c (i.e. not through gen_real_phsp_isr_rad0)
      call compcsimax
      y=kn_y
      xb1=kn_xb1
      xb2=kn_xb2
      csi=kn_csi
      cth=y
      sth=sqrt(1-cth**2)
      cph=cos(kn_azi)
      sph=sin(kn_azi)
      x1=xb1/sqrt(1-csi)*sqrt((2-csi*(1-y))/(2-csi*(1+y)))
      x2=xb2/sqrt(1-csi)*sqrt((2-csi*(1+y))/(2-csi*(1-y)))
      kn_x1=x1
      kn_x2=x2
      do mu=0,3
         kn_preal(mu,1)=kn_beams(mu,1)*x1
         kn_preal(mu,2)=kn_beams(mu,2)*x2
      enddo
      kn_sreal=kn_sborn/(1-csi)
c Build k_n+1 in the rest frame of kn_preal
      kn_preal(0,nlegreal)=sqrt(kn_sreal)*csi/2
      kn_preal(1,nlegreal)=kn_preal(0,nlegreal)*sth*sph
      kn_preal(2,nlegreal)=kn_preal(0,nlegreal)*sth*cph
      kn_preal(3,nlegreal)=kn_preal(0,nlegreal)*cth
c boost it to the frame of kn_preal
      do i=1,3
         vecl(i)=(kn_preal(i,1)+kn_preal(i,2))
     #          /(kn_preal(0,1)+kn_preal(0,2))
      enddo      
      betal=sqrt(vecl(1)**2+vecl(2)**2+vecl(3)**2)
      do i=1,3
         vecl(i)=vecl(i)/betal
      enddo
      call mboost(1,vecl,betal,
     #    kn_preal(0,nlegreal),kn_preal(0,nlegreal))
c longitudinal boost of underlying Born to zero rapidity frame
      do i=1,3
         vecl(i)=(kn_pborn(i,1)+kn_pborn(i,2))
     #          /(kn_pborn(0,1)+kn_pborn(0,2))
      enddo
      betal=sqrt(vecl(1)**2+vecl(2)**2+vecl(3)**2)
      do i=1,3
         vecl(i)=vecl(i)/betal
      enddo
      call mboost(nlegborn-2,vecl,-betal,kn_pborn(0,3),kn_preal(0,3))
c      call printtot(nlegborn,kn_preal(0,1))
c construct transverse boost velocity
      vect(3)=0
      vect(1)=kn_preal(1,nlegreal)
      vect(2)=kn_preal(2,nlegreal)
      pt2=vect(1)**2+vect(2)**2
      betat=1/sqrt(1+(kn_sreal*(1-csi))/pt2)
      vect(1)=vect(1)/sqrt(pt2)
      vect(2)=vect(2)/sqrt(pt2)
c      write(*,*) ' k+1: ',(kn_preal(mu,nlegreal),mu=0,3)
      call mboost(nlegborn-2,vect,-betat,kn_preal(0,3),kn_preal(0,3))
c      call printtot(nlegborn,kn_preal(0,1))
c longitudinal boost in opposite direction
      call mboost(nlegborn-2,vecl,betal,kn_preal(0,3),kn_preal(0,3))
c      call printtot(nlegreal,kn_preal(0,1))
      kn_jacreal=kn_sreal/(4*pi)**3*csi/(1-csi)
      call compcmkin
      call compdij
      call setsoftvecisr
      call compdijsoft
      end


      subroutine compcmkin
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      real * 8 vecl(3),betal
      data vecl/0d0,0d0,1d0/
      save vecl
      betal=-(kn_preal(3,1)+kn_preal(3,2))/(kn_preal(0,1)+kn_preal(0,2))
      call mboost(nlegreal,vecl,betal,kn_preal,kn_cmpreal)
      end

      subroutine compdij
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_par.h'
      integer j,k
      real * 8 y
      real * 8 crossp,dotp
      external crossp,dotp
      do j=flst_lightpart,nlegreal
         y=1-dotp(kn_cmpreal(0,1),kn_cmpreal(0,j))
     # /(kn_cmpreal(0,1)*kn_cmpreal(0,j))
         kn_dijterm(0,j)=(kn_cmpreal(0,j)**2
     # *(1-y**2))**par_diexp
         kn_dijterm(1,j)=(kn_cmpreal(0,j)**2
     # *2*(1-y))**par_diexp
         kn_dijterm(2,j)=(kn_cmpreal(0,j)**2
     # *2*(1+y))**par_diexp
      enddo
      do j=flst_lightpart,nlegreal
         do k=j+1,nlegreal
            kn_dijterm(j,k)=(2*dotp(kn_cmpreal(0,k),kn_cmpreal(0,j))*
c     1       kn_cmpreal(0,k)*kn_cmpreal(0,j)
c     2    /  (kn_cmpreal(0,k)+kn_cmpreal(0,j))**2)**par_dijexp
c Hack for heavy flavour: j is a quark, k is the gluon            
     1       kn_cmpreal(0,k)
     2    /  (kn_cmpreal(0,j)))**par_dijexp            
c     2    /  ((kn_cmpreal(1,k)+kn_cmpreal(1,j))**2+
c     3        (kn_cmpreal(2,k)+kn_cmpreal(2,j))**2+
c     4        (kn_cmpreal(3,k)+kn_cmpreal(3,j))**2))**par_dijexp
         enddo
      enddo
      end


      subroutine compdijsoft
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      include 'pwhg_par.h'
      integer k
      real * 8 y
      real * 8 crossp,dotp
      external crossp,dotp
      if(par_diexp.ne.par_dijexp) then
         write(*,*)
     1   ' compdijsoft: if you have different par_diexp and par_dijexp'
         write(*,*) ' you better fix the soft subroutine too'
         stop
      endif
      y=1-dotp(kn_cmpborn(0,1),kn_softvec(0))
     # /(kn_cmpborn(0,1)*kn_softvec(0))
      kn_dijterm_soft(0)=(kn_softvec(0)**2
     # *(1-y**2))**par_diexp
      kn_dijterm_soft(1)=(kn_softvec(0)**2
     #*2*(1-y))**par_diexp
      kn_dijterm_soft(2)=(kn_softvec(0)**2
     #*2*(1+y))**par_diexp
      do k=flst_lightpart,nlegreal-1
         kn_dijterm_soft(k)=
     1   (2*dotp(kn_cmpborn(0,k),kn_softvec(0))*
     2        kn_cmpborn(0,k)*kn_softvec(0)
     3     / kn_cmpborn(0,k)**2)**par_dijexp
      enddo
      end


      function crossp(a,b)
      implicit none
      real * 8 crossp,a(3),b(3)
      crossp=sqrt((a(1)*b(2)-a(2)*b(1))**2
     #           +(a(2)*b(3)-a(3)*b(2))**2
     #           +(a(3)*b(1)-a(1)*b(3))**2)
      end


      subroutine setsoftvecfsr
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      integer em,j
      real * 8 y,norm,dir(3)
      em=kn_emitter
      y=kn_y
c set soft vector parallel to the emitter
      do j=0,3
         kn_softvec(j)=kn_cmpborn(j,em)/kn_cmpborn(0,em)
      enddo
c Set up a unit vector orthogonal to p_em and to the z axis
      dir(3)=0
      norm=sqrt(kn_cmpborn(1,em)**2+kn_cmpborn(2,em)**2)
      dir(1)=kn_cmpborn(2,em)/norm
      dir(2)=-kn_cmpborn(1,em)/norm
      call mrotate(dir,sqrt(1-y**2),y,kn_softvec(1))
      do j=1,3
         dir(j)=kn_cmpborn(j,em)/kn_cmpborn(0,em)
      enddo
c Rotate kn_softvec around dir of an amount azi
      call mrotate(dir,sin(kn_azi),cos(kn_azi),kn_softvec(1))
      end

      subroutine setsoftvecfsrmv
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      integer em,j
      real * 8 y,norm,dir(3),kem
      real * 8 cosjnp1soft
      common/ccosjnp1soft/cosjnp1soft
      em=kn_emitter
      y=cosjnp1soft
c set soft vector parallel to the emitter
      kem=sqrt(kn_cmpborn(1,em)**2
     1     +kn_cmpborn(2,em)**2+kn_cmpborn(3,em)**2)
      do j=1,3
         kn_softvec(j)=kn_cmpborn(j,em)/kem
      enddo
      kn_softvec(0)=1
c Set up a unit vector orthogonal to p_em and to the z axis
      dir(3)=0
      norm=sqrt(kn_cmpborn(1,em)**2+kn_cmpborn(2,em)**2)
      dir(1)=kn_cmpborn(2,em)/norm
      dir(2)=-kn_cmpborn(1,em)/norm
      call mrotate(dir,sqrt(1-y**2),y,kn_softvec(1))
      do j=1,3
         dir(j)=kn_cmpborn(j,em)/kem
      enddo
c Rotate kn_softvec around dir of an amount azi
      call mrotate(dir,sin(kn_azi),cos(kn_azi),kn_softvec(1))
      end

      subroutine setsoftvecisr
      implicit none
      include 'nlegborn.h'
      include 'pwhg_flst.h'
      include 'pwhg_kn.h'
      real * 8 y
      y=kn_y
      kn_softvec(0)=1
      kn_softvec(1)=sqrt(1-y**2)*sin(kn_azi)
      kn_softvec(2)=sqrt(1-y**2)*cos(kn_azi)
      kn_softvec(3)=y
      end

