c  lepton spinors and polarization vectors
c
c  precalculated lepton tensors for WZ --> l v l' lbar' 
c	always write we (zu) for the W (Z) which goes to e ve (mu+mu-)
c
c  lepton spinors and V polarization vectors

      double complex wl(6),wn(6),lp(6),lm(6)
      common /lspinor/  wl,wn,lp,lm
      
      integer ie,iu
      
      double complex we(6),au(6),zu(6),xxew, xxua,xxuz,
     # 		     wet(6),zut(6),aut(6)
      double precision qe(0:4), qu(0:4)
      common /wzspinor/ we,au,zu,qe,qu,wet,zut,aut,xxew, xxua,xxuz
c
c  leptonic tensors
      double complex zwwv(0:3,0:3,3),awwv(0:3,0:3,3),
     #		     wzwv(0:3,0:3,3),wawv(0:3,0:3,3),
     #		     aauu(0:3,0:3,2,3),azuu(0:3,0:3,2,3),
     #		     zauu(0:3,0:3,2,3),zzuu(0:3,0:3,2,3),
     #		     wwuu(0:3,0:3,2,3),
     #		     awen(0:3,0:3,2,3),zwen(0:3,0:3,2,3),
     #		     waen(0:3,0:3,2,3),wzen(0:3,0:3,2,3),
     #		     wwv(0:5)
      logical lws(8)
      common /tenswz/ zwwv,awwv,wzwv,wawv,
     #		     aauu,azuu,zauu,zzuu,wwuu,
     #		     awen,zwen,waen,wzen,wwv,
     #		     lws