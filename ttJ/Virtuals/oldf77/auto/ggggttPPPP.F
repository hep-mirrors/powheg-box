      t1 = m**2
      t4 = den(2*t1+2*dotp(kq,kqb))
      t5 = dotp(k1,k2)
      t7 = dotp(k2,k3)
      t9 = den(2*t5+2*dotp(k1,k3)+2*t7)
      t12 = 1/spa(k1,k2)
      t13 = spa(k1,r1)
      t14 = 1/t13
      t15 = t12*t14
      t16 = spa(q2,r1)
      t18 = spb(k2,k3)
      t19 = spb(k3,k4)
      t21 = spb(k4,r2)
      t24 = spa(k4,r1)
      t25 = 1/t24
      t27 = t12*t25*t16
      t28 = spb(k1,k3)
      t29 = spb(k2,k4)
      t30 = t28*t29
      t31 = spb(k3,r2)
      t34 = spa(k3,r1)
      t35 = 1/t34
      t36 = t12*t35
      t37 = t25*t13
      t38 = t36*t37
      t39 = t16*t28
      t40 = spb(k1,r2)
      t41 = t40*t29
      t44 = spb(k1,k4)
      t45 = t16*t44
      t46 = t40*t18
      t49 = spa(k2,r1)
      t50 = t25*t49
      t51 = t36*t50
      t52 = spb(k2,r2)
      t53 = t29*t52
      t54 = t39*t53
      t56 = t18*t52
      t60 = 1/spa(k2,k3)
      t61 = t14*t60
      t62 = 1/t49
      t63 = t62*t25
      t64 = t61*t63
      t65 = t34**2
      t66 = t65*t16
      t67 = t28*t19
      t70 = t64*t66*t67*t31
      t71 = t35*t49
      t72 = t61*t71
      t73 = spb(k1,k2)
      t74 = t16*t73
      t75 = t29*t21
      t76 = t74*t75
      t77 = t72*t76
      t82 = t16*t18
      t85 = t35*t25
      t86 = t15*t85
      t87 = t49**2
      t88 = t87*t16
      t89 = t18*t29
      t93 = t15*t50
      t94 = t29*t31
      t97 = t15*t16*t18*t19*t21+t27*t30*t31+t38*t39*t41+t38*t45*t46+t51*
     #t54+t51*t45*t56+t70+t77+t27*t28*t52*t19+t15*t71*t82*t75+t86*t88*t8
     #9*t52+t93*t82*t94
      t98 = t36*t16
      t99 = t30*t21
      t101 = t52*t19
      t104 = t25*t34
      t106 = t19*t31
      t109 = t12*t62
      t115 = t44*t21
      t118 = t44*t18
      t121 = t109*t85
      t122 = t13**2
      t124 = t28*t44
      t128 = t109*t37
      t130 = t39*t44*t31
      t133 = t39*t40*t19
      t138 = t16*t40
      t141 = t44*t52
      t144 = t98*t99+t93*t82*t101+t15*t104*t82*t106+t109*t16*t67*t21+t10
     #9*t35*t13*t39*t115+t98*t118*t21+t121*t122*t16*t124*t40+t128*t130+t
     #128*t133+t109*t104*t39*t106+t51*t138*t89+t38*t39*t141
      t146 = t60*t62
      t147 = t146*t16
      t150 = t61*t50
      t152 = t150*t74*t94
      t154 = t150*t74*t101
      t155 = t150*t54
      t156 = t61*t104
      t158 = t156*t74*t106
      t159 = t39*t94
      t160 = t156*t159
      t162 = t156*t39*t101
      t167 = t61*t16
      t170 = t167*t73*t19*t21
      t171 = t167*t99
      t173 = t61*t62*t34
      t174 = t19*t21
      t176 = t173*t39*t174
      t177 = t147*t124*t21+t152+t154+t155+t158+t160+t162+t27*t118*t31+t2
     #7*t46*t19+t170+t171+t176
      t178 = t146*t104
      t180 = t178*t133
      t181 = t61*t85
      t182 = t73*t29
      t185 = t181*t88*t182*t52
      t186 = t60*t35
      t187 = t186*t16
      t188 = t73*t44
      t192 = t44*t40
      t199 = t60*t25*t16
      t202 = t186*t50
      t206 = t202*t74*t41
      t207 = t73*t40
      t209 = t199*t207*t19
      t212 = t28*t40
      t213 = t212*t29
      t214 = t199*t213
      t215 = t178*t130+t180+t185+t187*t188*t21+t146*t37*t39*t192+t186*t3
     #7*t74*t192+t199*t188*t31+t202*t74*t141+t206+t209+t199*t124*t52+t21
     #4
      t222 = den(2*t7+2*dotp(k2,k4)+2*dotp(k3,k4))
      t224 = t70+t77+t152+t154+t155+t158+t160+t162+t170+t171+t176+t180
      t225 = t44*t29
      t236 = t45*t53
      t238 = t35*t24
      t242 = t14*t62
      t244 = 1/spa(k3,k4)
      t246 = t242*t244*t34
      t248 = t18*t21
      t251 = t185+t206+t209+t214+t167*t225*t31+t167*t141*t19+t173*t45*t1
     #06+t61*t62*t24*t45*t174+t72*t236+t61*t238*t45*t75+t246*t159+t246*t
     #39*t248
      t253 = t14*t244
      t254 = t253*t16
      t259 = t18*t31
      t266 = t242*t244*t24
      t273 = t244*t35
      t274 = t242*t273
      t275 = t24**2
      t280 = t244*t25
      t281 = t242*t280
      t293 = t254*t182*t31+t254*t30*t52+t246*t45*t259+t254*t73*t18*t21+t
     #266*t39*t75+t266*t45*t248+t266*t45*t94+t274*t275*t16*t225*t21+t281
     #*t66*t28*t18*t31+t254*t118*t52+t253*t71*t74*t53+t147*t192*t19
      t294 = t253*t238
      t300 = t253*t104
      t307 = t62*t244
      t308 = t307*t16
      t324 = t294*t76+t294*t236+t253*t50*t74*t56+t300*t74*t259+t300*t39*
     #t56+t187*t192*t29+t308*t213+t308*t192*t18+t273*t16*t207*t29+t307*t
     #238*t45*t41+t307*t104*t39*t46+t280*t16*t207*t18
      t328 = t15*t244
      t334 = t15*t273
      t335 = t49*t16
      t338 = t24*t16
      t341 = t15*t280
      t344 = t34*t16
      t347 = t109*t244
      t352 = t109*t273
      t353 = t13*t16
      t358 = t109*t280
      t364 = t12*t244
      t365 = t364*t35
      t370 = t364*t25
      t375 = -t328*t82*t21-t328*t16*t29*t31-t334*t335*t53-t334*t338*t75-
     #t341*t335*t56-t341*t344*t259-t347*t39*t21-t347*t45*t31-t352*t353*t
     #192-t352*t338*t115-t358*t353*t212-t358*t344*t28*t31-t365*t45*t52-t
     #365*t138*t29-t370*t39*t52-t370*t138*t18
      t377 = dotp(k1,kq)
      t380 = den(2*t5-2*t377-2*dotp(k2,kq))
      t381 = spa(q1,r1)
      t382 = t381*t16
      t383 = spb(k2,q1)
      t384 = t383*t21
      t387 = t16**2
      t388 = t35*t387
      t389 = spb(k2,q2)
      t390 = t389*t21
      t396 = t25*t387
      t397 = t389*t31
      t400 = spb(k1,q1)
      t401 = t400*t21
      t404 = spb(k1,q2)
      t405 = t404*t21
      t408 = t400*t31
      t411 = t404*t31
      t416 = den(-2*t377)
      t418 = t381**2
      t419 = t418*t16
      t420 = t400*t383
      t421 = t420*t21
      t422 = t419*t421
      t424 = t381*t387
      t425 = t400*t389
      t426 = t425*t21
      t427 = t424*t426
      t429 = t404*t383
      t430 = t429*t21
      t431 = t424*t430
      t433 = t387*t16
      t434 = t433*t404
      t435 = t434*t390
      t448 = t35*t381
      t450 = t74*t401
      t453 = t387*t73
      t454 = t453*t405
      t456 = t25*t381
      t463 = t274*t422+t274*t427+t274*t431+t274*t435+t281*t419*t420*t31+
     #t281*t424*t425*t31+t281*t424*t429*t31+t281*t434*t397+t307*t448*t45
     #0+t307*t35*t454+t307*t456*t74*t408+t307*t25*t453*t411
      t468 = t16*t400
      t472 = t387*t404
      t476 = t61*t63*t34
      t481 = t34*t387
      t492 = t85*t49
      t493 = t61*t492
      t494 = t400*t29
      t498 = t49*t387
      t499 = t404*t29
      t503 = t61*t456
      t504 = t468*t94
      t508 = t61*t25
      t509 = t472*t94
      t513 = t61*t62*t381*t468*t174+t61*t62*t472*t174+t476*t382*t400*t19
     #*t31+t64*t481*t404*t19*t31+t61*t448*t468*t75+t61*t35*t472*t75+t493
     #*t382*t494*t52+t181*t498*t499*t52+t503*t504+t503*t468*t101+t508*t5
     #09+t508*t472*t101
      t515 = t242*t244*t381
      t516 = t468*t248
      t519 = t242*t244
      t520 = t472*t248
      t538 = t404*t18
      t554 = t515*t516+t515*t504+t519*t520+t519*t509+t242*t273*t24*t382*
     #t494*t21+t274*t24*t387*t499*t21+t242*t280*t34*t382*t400*t18*t31+t2
     #81*t481*t538*t31+t253*t448*t468*t53+t253*t35*t472*t53+t253*t456*t4
     #68*t56+t253*t25*t472*t56
      t558 = den(-2*dotp(k4,kqb))
      t559 = t416*t558
      t563 = spb(k3,q1)
      t565 = t383*t563*t21
      t569 = t242*t85*t418
      t570 = t387*t400
      t571 = spb(k3,q2)
      t573 = t383*t571*t21
      t577 = t389*t563*t21
      t583 = t242*t85*t381
      t586 = t389*t571*t21
      t594 = t387**2
      t598 = t14*t35
      t599 = t25*t418
      t602 = t18*t383*t21
      t605 = t598*t456
      t607 = t18*t389*t21
      t612 = t25*t433
      t616 = -t242*t85*t418*t381*t468*t565-t569*t570*t573-t569*t570*t577
     #-t569*t472*t565-t583*t433*t400*t586-t583*t434*t573-t583*t434*t577-
     #t242*t85*t594*t404*t586-t598*t599*t468*t602-t605*t570*t607-t605*t4
     #72*t602-t598*t612*t538*t390
      t617 = t62*t35
      t621 = t28*t400*t21
      t625 = t28*t404
      t626 = t625*t21
      t629 = t617*t599
      t631 = t400*t563*t21
      t636 = t617*t456
      t638 = t400*t571*t21
      t642 = t404*t563*t21
      t645 = t387*t28
      t650 = t617*t612
      t651 = t73*t404
      t652 = t571*t21
      t664 = -t617*t37*t381*t74*t621-t617*t37*t453*t626-t629*t74*t631-t6
     #29*t39*t421-t636*t453*t638-t636*t453*t642-t636*t645*t426-t636*t645
     #*t430-t650*t651*t652-t650*t625*t390-t85*t382*t73*t400*t248-t85*t38
     #7*t651*t248
      t668 = t419*t631
      t670 = t424*t638
      t672 = t424*t642
      t674 = t434*t652
      t682 = t146*t456*t39*t401
      t685 = t146*t25*t645*t405
      t687 = t186*t456*t450
      t689 = t186*t25*t454
      t690 = t64*t668+t64*t670+t64*t672+t64*t674+t181*t422+t181*t427+t18
     #1*t431+t181*t435+t682+t685+t687+t689
      t695 = t15*t492*t382*t602
      t697 = t86*t498*t607
      t699 = t563*t21
      t709 = t109*t85*t13*t382*t621
      t712 = t121*t13*t387*t626
      t719 = t36*t456
      t720 = t39*t384
      t721 = t719*t720
      t722 = t719*t516
      t723 = t36*t25
      t724 = t645*t390
      t725 = t723*t724
      t726 = t723*t520
      t727 = t695+t697+t15*t456*t82*t699+t15*t25*t387*t18*t652+t709+t712
     #+t109*t456*t39*t699+t109*t25*t645*t652+t721+t722+t725+t726
      t750 = t476*t382*t28*t563*t21+t64*t481*t28*t571*t21+t493*t382*t73*
     #t383*t21+t181*t498*t73*t389*t21+t503*t74*t699+t503*t720+t508*t453*
     #t652+t508*t724+t682+t685+t687+t689
      t767 = t695+t697+t86*t419*t565+t86*t424*t573+t86*t424*t577+t86*t43
     #3*t389*t652+t709+t712+t121*t668+t121*t670+t121*t672+t121*t674+t721
     #+t722+t725+t726
      aPPPP = t4*t9*(t97+t144+t177+t215)+t4*t222*(t224+t251+t293+t324)+t
     #4*t375+t380*(-t334*t382*t384-t328*t388*t390-t341*t382*t383*t31-t32
     #8*t396*t397-t352*t382*t401-t347*t388*t405-t358*t382*t408-t347*t396
     #*t411)+t416*t380*t463+t416*t222*(t513+t554)+t559*t380*(t616+t664)+
     #t559*t690+t558*t9*(t727+t750)+t558*t380*t767
