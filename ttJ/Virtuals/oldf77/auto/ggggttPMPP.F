      t1 = m**2
      t4 = den(2*t1+2*dotp(kq,kqb))
      t5 = dotp(k1,k2)
      t7 = dotp(k2,k3)
      t9 = den(2*t5+2*dotp(k1,k3)+2*t7)
      t11 = spa(k1,k2)
      t12 = 1/t11
      t13 = spa(k2,k4)
      t14 = 1/t13
      t15 = t12*t14
      t17 = 1/spa(r1,r2)
      t19 = 1/spb(k1,k2)
      t20 = t17*t19
      t22 = 1/spb(k2,k3)
      t23 = t20*t22
      t24 = t15*t23
      t25 = spa(k2,k3)
      t26 = spa(k2,r1)
      t27 = t25*t26
      t28 = spa(q1,q2)
      t30 = spb(k1,k3)
      t31 = t30**2
      t32 = spb(k3,k4)
      t33 = t31*t32
      t34 = spb(k3,q1)
      t37 = t24*t27*t28*t33*t34
      t38 = t19*t22
      t39 = t15*t38
      t40 = spa(k2,q2)
      t41 = t25*t40
      t42 = spb(k3,r2)
      t45 = t39*t41*t33*t42
      t46 = t12*t17
      t48 = t26*t28
      t49 = spb(k4,q1)
      t52 = t46*t38*t48*t33*t49
      t53 = t12*t19
      t55 = t40*t31
      t56 = spb(k4,r2)
      t59 = t53*t22*t55*t32*t56
      t60 = 1/t25
      t61 = t60*t14
      t62 = t61*t23
      t65 = spb(k1,k4)
      t66 = t31*t65
      t67 = spb(k1,q1)
      t70 = t62*t11*t26*t28*t66*t67
      t71 = t61*t38
      t73 = spb(k1,r2)
      t77 = t60*t17
      t82 = t60*t19
      t84 = t65*t56
      t87 = t14*t17
      t88 = t87*t38
      t91 = t88*t48*t66*t34
      t92 = t31*t67
      t95 = t88*t48*t92*t32
      t96 = t14*t19
      t97 = t96*t22
      t98 = t65*t42
      t101 = t73*t32
      t103 = t97*t55*t101
      t104 = -t37+t45-t52+t59-t70+t71*t11*t40*t66*t73+t77*t38*t48*t66*t4
     #9-t82*t22*t55*t84+t91+t95-t97*t55*t98-t103
      t109 = den(2*t7+2*dotp(k2,k4)+2*dotp(k3,k4))
      t111 = t12*t60
      t113 = 1/spa(k3,k4)
      t114 = t113*t19
      t115 = t111*t114
      t116 = t13**2
      t118 = t65**2
      t122 = t111*t17
      t123 = t38*t13
      t125 = t48*t30
      t126 = t65*t32
      t131 = t40*t30
      t135 = t113*t17
      t136 = t135*t19
      t137 = t15*t136
      t138 = t25**2
      t140 = t28*t31
      t144 = t15*t114
      t149 = t111*t136
      t151 = t28*t118
      t155 = t12*t113
      t156 = t155*t19
      t160 = t38*t26
      t162 = t28*t30
      t166 = t22*t40
      t168 = t30*t65
      t172 = -t37+t45-t52+t59+t95-t103+t115*t116*t40*t118*t56-t122*t123*
     #t125*t126*t49+t111*t123*t131*t126*t56-t137*t138*t26*t140*t34+t144*
     #t138*t40*t31*t42-t149*t116*t26*t151*t49+t156*t41*t31*t56-t46*t160*
     #t162*t126*t34+t53*t166*t168*t32*t42
      t173 = t155*t20
      t177 = t13*t40
      t181 = t13*t26
      t185 = t60*t113
      t190 = t185*t20
      t193 = t190*t181*t151*t67
      t194 = t14*t113
      t200 = t65*t67
      t203 = t77*t160*t162*t200*t32
      t207 = t194*t20
      t210 = t207*t27*t140*t67
      t211 = t20*t25
      t216 = t20*t13
      t232 = t135*t19*t26*t162*t200
      t236 = -t173*t27*t140*t49+t156*t177*t118*t42-t173*t181*t151*t34-t1
     #85*t19*t177*t118*t73+t193-t194*t19*t41*t31*t73+t203-t82*t166*t168*
     #t101+t210-2*t155*t211*t48*t168*t34-2*t155*t216*t48*t168*t49+2*t155
     #*t19*t25*t131*t98+2*t155*t19*t13*t131*t84+2*t232-2*t114*t40*t168*t
     #73
      t239 = dotp(k1,kq)
      t240 = den(-2*t239)
      t243 = den(2*t5-2*t239-2*dotp(k2,kq))
      t245 = spa(k2,q1)
      t246 = t245**2
      t247 = t246*t26
      t248 = t67**2
      t249 = t28*t248
      t253 = t111*t113
      t254 = t20*t245
      t257 = t40*t26*t28
      t258 = spb(k1,q2)
      t259 = t67*t258
      t260 = t259*t49
      t263 = t40**2
      t264 = t263*t26
      t265 = t258**2
      t266 = t28*t265
      t270 = t246*t40
      t271 = t248*t56
      t274 = t245*t263
      t275 = t259*t56
      t278 = t263*t40
      t279 = t19*t278
      t280 = t265*t56
      t286 = t15*t113
      t288 = t259*t34
      t303 = t245*t26
      t308 = t20*t40
      t310 = t200*t258
      t317 = t30*t67
      t321 = -t149*t247*t249*t49-2*t253*t254*t257*t260-t149*t264*t266*t4
     #9+t115*t270*t271+2*t115*t274*t275+t253*t279*t280-t137*t247*t249*t3
     #4-2*t286*t254*t257*t288-t137*t264*t266*t34+t144*t270*t248*t42+2*t1
     #44*t274*t259*t42+t286*t279*t265*t42+t190*t303*t28*t65*t248+t185*t3
     #08*t48*t310+t207*t303*t162*t248+t194*t308*t48*t317*t258
      t326 = t245*t40
      t330 = t253*t216
      t331 = t303*t28
      t335 = t65*t258
      t343 = t38*t245
      t345 = t67*t32
      t349 = t38*t40
      t351 = t258*t32
      t360 = t263*t30
      t368 = t95+t193+t203+t210+2*t232+t111*t114*t13*t326*t200*t56-t330*
     #t331*t200*t49-t330*t257*t335*t49+t115*t13*t263*t335*t56-t122*t343*
     #t125*t345*t49-t122*t349*t125*t351*t49+t111*t343*t131*t345*t56+t111
     #*t38*t360*t351*t56+t15*t343*t131*t345*t42
      t369 = t286*t211
      t373 = t30*t258
      t389 = t15*t17
      t393 = t389*t343*t125*t345*t34
      t394 = t155*t308
      t399 = t351*t34
      t401 = t389*t349*t125*t399
      t402 = t155*t254
      t406 = t258*t56
      t409 = t200*t34
      t415 = t19*t245
      t416 = t155*t415
      t428 = -t369*t331*t317*t34-t369*t257*t373*t34+t15*t114*t25*t326*t3
     #17*t42+t144*t25*t263*t373*t42+t39*t360*t351*t42-t393-t394*t48*t335
     #*t34-t401-t402*t48*t317*t49+t156*t360*t406-t402*t48*t409-t394*t48*
     #t373*t49+t416*t131*t67*t56+t416*t40*t65*t67*t42+t156*t263*t65*t258
     #*t42
      t432 = den(-2*dotp(k4,kqb))
      t433 = t240*t432
      t435 = t111*t87*t19
      t436 = t246*t245
      t439 = t248*t34
      t443 = t111*t14
      t444 = t20*t246
      t445 = t443*t444
      t446 = spb(k3,q2)
      t447 = t248*t446
      t457 = t443*t254
      t458 = t264*t28
      t459 = t265*t34
      t463 = t111*t96
      t472 = t20*t263
      t482 = t263**2
      t484 = t446*t56
      t493 = t65*t248
      t502 = t61*t444
      t503 = t30*t248
      t507 = t61*t17
      t513 = t435*t436*t26*t28*t439*t49+t445*t257*t447*t49+t435*t278*t26
     #*t28*t265*t446*t49+t457*t458*t459*t49-t463*t436*t40*t439*t56-t463*
     #t246*t263*t447*t56+t15*t472*t48*t265*t32*t34-t463*t245*t278*t459*t
     #56-t463*t482*t265*t484+t15*t444*t48*t248*t32*t34-t61*t254*t257*t49
     #3*t446+t61*t20*t11*t331*t168*t248-t502*t48*t503*t49+t507*t19*t11*t
     #40*t125*t310
      t521 = t415*t40
      t522 = t507*t521
      t523 = t48*t65
      t527 = t278*t30
      t530 = t61*t472
      t548 = t34*t49
      t552 = t446*t49
      t560 = t258*t34*t56
      t567 = t258*t446*t56
      t579 = -t502*t48*t493*t34-t87*t415*t48*t503*t32-t522*t523*t288+t61
     #*t19*t527*t280-t530*t48*t30*t265*t49-t530*t523*t259*t446+t61*t19*t
     #246*t131*t271-t87*t19*t40*t26*t162*t259*t32+2*t445*t257*t259*t548+
     #2*t457*t458*t259*t552-2*t111*t96*t246*t263*t67*t560-2*t111*t96*t24
     #5*t278*t67*t567+2*t389*t521*t48*t67*t399-2*t522*t125*t260+2*t61*t4
     #15*t360*t275
      t583 = t443*t23
      t590 = t443*t20*t22*t245
      t600 = t111*t97
      t606 = t274*t30
      t617 = t62*t331*t92*t49
      t624 = t62*t257*t31*t258*t49
      t631 = t71*t326*t92*t56
      t632 = t263*t31
      t634 = t71*t632*t406
      t635 = -t583*t247*t28*t317*t548-t590*t257*t317*t552-t590*t257*t373
     #*t548-t583*t458*t373*t552+t600*t270*t30*t67*t34*t56+t600*t606*t67*
     #t446*t56+t600*t606*t560+t600*t527*t567-t393-t401-t70+t617+t507*t34
     #3*t125*t409+t624+t507*t349*t125*t200*t446-t631-t634+t95
      t638 = t31*t34
      t651 = -t37-t24*t331*t638*t49-t24*t257*t31*t446*t49+t39*t326*t638*
     #t56+t39*t632*t484-t70+t617+t624-t631-t634+t91+t95
      aPMPP = t4*t9*t104+t4*t109*(t172+t236)+t240*t243*t321+t240*t109*(t
     #368+t428)+t433*t243*(t513+t579)+t433*t635+t432*t9*t651
