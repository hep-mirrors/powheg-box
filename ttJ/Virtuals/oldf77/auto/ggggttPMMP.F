      t1 = m**2
      t4 = den(2*t1+2*dotp(kq,kqb))
      t5 = dotp(k1,k2)
      t7 = dotp(k2,k3)
      t9 = den(2*t5+2*dotp(k1,k3)+2*t7)
      t11 = spa(k1,k2)
      t12 = 1/t11
      t14 = 1/spa(k1,k3)
      t15 = t12*t14
      t16 = spa(k3,k4)
      t17 = 1/t16
      t19 = 1/spa(r1,r2)
      t20 = t17*t19
      t21 = spb(k1,k2)
      t22 = 1/t21
      t24 = t15*t20*t22
      t25 = spa(k2,k3)
      t26 = t25**2
      t27 = t26*t25
      t28 = spa(k3,r1)
      t29 = t27*t28
      t30 = spa(q1,q2)
      t31 = spb(k1,q1)
      t32 = t30*t31
      t33 = spb(k2,k4)
      t34 = t32*t33
      t37 = t12*t17
      t39 = spa(k3,q2)
      t40 = t26*t39
      t41 = spb(k1,k4)
      t42 = spb(k1,r2)
      t43 = t41*t42
      t44 = t40*t43
      t46 = t19*t22
      t48 = t26*t28
      t49 = t30*t41
      t50 = t49*t31
      t51 = t48*t50
      t52 = t37*t46*t51
      t54 = 1/spb(k1,k3)
      t55 = t19*t54
      t57 = spa(k2,r1)
      t58 = t26*t57
      t62 = spa(k2,q2)
      t63 = t26*t62
      t66 = t14*t17
      t68 = 1/spb(k2,k3)
      t70 = t66*t55*t68
      t71 = spa(k1,r1)
      t72 = t71*t26
      t74 = t21*t41
      t75 = t74*t31
      t77 = t70*t72*t30*t75
      t79 = t15*t20*t54
      t83 = t27*t57
      t84 = spb(k2,q1)
      t85 = t49*t84
      t90 = spb(k3,q1)
      t93 = t79*t29*t49*t90
      t94 = spa(k2,k4)
      t95 = t26*t94
      t97 = spb(k4,q1)
      t98 = t49*t97
      t101 = t17*t22
      t102 = t15*t101
      t103 = t27*t39
      t104 = t42*t33
      t107 = t17*t54
      t108 = t15*t107
      t109 = spa(k1,q2)
      t113 = t27*t62
      t114 = spb(k2,r2)
      t120 = spb(k3,r2)
      t124 = t39*t41
      t125 = spb(k4,r2)
      t126 = t124*t125
      t130 = t48*t98
      t132 = t24*t29*t34-t37*t22*t44+t52+t37*t55*t58*t50-t37*t54*t63*t43
     #-t77-t79*t71*t27*t50-t79*t83*t85+t79*t83*t34-t93-t79*t95*t28*t98-t
     #102*t103*t104+t108*t109*t27*t43+t108*t113*t41*t114-t108*t113*t104+
     #t108*t103*t41*t120+t108*t95*t126-t15*t46*t130
      t135 = t40*t41*t125
      t137 = t54*t68
      t138 = t66*t137
      t142 = t138*t63*t21*t42*t33
      t145 = t138*t40*t74*t120
      t146 = t137*t25
      t147 = t66*t146
      t148 = t94*t39
      t151 = t147*t148*t74*t125
      t152 = t58*t30
      t155 = t70*t152*t74*t84
      t156 = t21*t31
      t159 = t70*t152*t156*t33
      t160 = t48*t30
      t163 = t70*t160*t74*t90
      t164 = t66*t19
      t165 = t164*t146
      t166 = t94*t28
      t170 = t165*t166*t30*t74*t97
      t171 = t19*t68
      t172 = t66*t171
      t174 = t172*t48*t34
      t175 = t109*t26
      t176 = t74*t42
      t178 = t138*t175*t176
      t181 = t138*t63*t74*t114
      t182 = t66*t68
      t184 = t182*t40*t104
      t187 = t14*t68*t25*t126
      t188 = t14*t19
      t189 = t68*t25
      t191 = t28*t30
      t194 = t188*t189*t191*t41*t97
      t196 = t57*t30
      t200 = t41*t31
      t202 = t20*t189*t191*t200
      t209 = t124*t42
      t210 = t17*t68*t25*t209
      t211 = t15*t22*t135-t142+t145+t151-t155+t159-t163-t170+t174+t178+t
     #181-t184+t187-t194+t20*t146*t196*t75+t202-t107*t189*t62*t21*t43-t2
     #10
      t217 = den(2*t7+2*dotp(k2,k4)+2*dotp(k3,k4))
      t219 = t188*t137
      t220 = t41**2
      t221 = t30*t220
      t222 = t221*t97
      t225 = t14*t22
      t227 = t25*t39
      t228 = t220*t42
      t229 = t227*t228
      t231 = t25*t28
      t235 = t14*t54
      t237 = t62*t41
      t240 = t235*t68
      t244 = t25*t62
      t245 = t220*t114
      t249 = 1/spb(k3,k4)
      t250 = t54*t249
      t251 = t225*t250
      t256 = t220*t41
      t263 = t20*t137
      t264 = t221*t31
      t266 = t263*t166*t264
      t270 = t22*t68
      t271 = t39*t220
      t272 = t271*t42
      t274 = t46*t68
      t275 = t220*t31
      t277 = t274*t191*t275
      t278 = t22*t54
      t279 = t278*t249
      t280 = t164*t279
      t282 = spa(k1,k4)*t25
      t283 = t282*t28
      t284 = t30*t256
      t285 = t284*t31
      t293 = t219*t166*t222-t225*t54*t229+t219*t231*t221*t90+t235*t189*t
     #237*t104-t240*t227*t220*t120-t240*t244*t245+t251*t244*t228*t33+t10
     #1*t250*t148*t256*t42+t107*t68*t148*t228-t266-t251*t244*t256*t114+t
     #270*t272-t277+t280*t283*t285/2-t251*t148*t256*t125-t138*t282*t272/
     #2
      t294 = t137*t11
      t296 = t231*t30
      t298 = t164*t294*t296*t75
      t301 = t66*t279
      t307 = t66*t55*t249
      t308 = t11*t25
      t311 = t307*t308*t28*t264
      t315 = t22*t249
      t317 = t231*t264
      t318 = t20*t315*t317
      t319 = t66*t250
      t322 = t225*t68
      t324 = t220*t125
      t327 = -t298/2+t70*t283*t264/2-t301*t282*t39*t256*t42/2-t311/2+t66
     #*t294*t227*t176/2-t318/2+t319*t308*t272/2-t77-t142+t145+t151-t155+
     #t159-t322*t16*t39*t324-t163-t170+t174
      t338 = t66*t55*t51
      t339 = t25*t94
      t344 = t307*t72*t264
      t345 = t221*t84
      t350 = t200*t33
      t353 = t178+t181-t184+t187-t194-t202/2+t101*t249*t229/2+t210/2+t22
     #5*t189*t124*t104-t225*t249*t227*t324-t338-t307*t339*t28*t222-t344-
     #t307*t58*t345+t66*t54*t44+t307*t152*t350
      t359 = t43*t33
      t367 = t25*t57
      t373 = t271*t125
      t380 = t188*t279
      t391 = t270*t25
      t401 = t20*t279
      t403 = t401*t166*t285
      t404 = -t66*t19*t249*t130+t319*t63*t245-t319*t63*t359+t319*t175*t2
     #28+t188*t315*t231*t222+t219*t367*t345-t188*t146*t196*t350+t319*t33
     #9*t373+t66*t249*t135+t188*t278*t317+t380*t367*t284*t84-t380*t367*t
     #30*t275*t33+t380*t166*t284*t97-t188*t391*t191*t350+t188*t270*t16*t
     #28*t222-t240*t148*t324-t403
      t408 = t54*t26
      t412 = t15*t17
      t413 = t46*t54
      t414 = t412*t413
      t419 = t249*t26
      t420 = t419*t57
      t427 = t249*t25
      t428 = t427*t94
      t439 = t15*t101*t54
      t445 = t62*t220
      t464 = t66*t413
      t467 = t464*t427*t28*t264
      t470 = t66*t278
      t475 = t24*t408*t28*t50+t414*t249*t71*t26*t264+t414*t420*t345-t414
     #*t420*t49*t31*t33+t414*t428*t191*t220*t97+t24*t419*t28*t98-t102*t4
     #08*t209-t439*t249*t109*t26*t220*t42-t439*t419*t445*t114+t439*t419*
     #t62*t359-t439*t428*t373-t102*t419*t126-t37*t413*t427*t57*t264+t37*
     #t278*t427*t445*t42+t467/2+t70*t231*t50/2-t470*t427*t272/2-t138*t22
     #7*t43/2
      t477 = dotp(k1,kq)
      t480 = den(2*t5-2*t477-2*dotp(k2,kq))
      t482 = t412*t46*t250
      t483 = spa(k2,q1)
      t484 = t25*t483
      t486 = t31*t97
      t491 = spb(k1,q2)
      t492 = t491*t97
      t496 = t412*t279
      t498 = t200*t125
      t501 = t244*t39
      t502 = t41*t491
      t503 = t502*t125
      t511 = den(-2*t477)
      t513 = spa(k1,q1)
      t514 = t513*t25
      t515 = t514*t28
      t516 = t31**2
      t517 = t221*t516
      t519 = t280*t515*t517
      t520 = t109*t25
      t522 = t31*t491
      t525 = t280*t520*t28*t221*t522
      t526 = spa(k3,q1)
      t527 = t483*t526
      t528 = t527*t28
      t529 = t516*t97
      t536 = t39*t28
      t537 = t536*t30
      t538 = t200*t492
      t544 = t526*t28
      t545 = t544*t30
      t548 = t62*t39
      t549 = t548*t28
      t550 = t491**2
      t551 = t550*t97
      t556 = t41*t516
      t560 = t39**2
      t561 = t483*t560
      t563 = t522*t125
      t566 = t66*t22
      t569 = t526*t39
      t573 = t62*t560
      t578 = t250*t25
      t579 = t66*t578
      t580 = t62*t526
      t585 = t483*t28
      t589 = t62*t28*t30
      t593 = t519+t525+t280*t528*t49*t529+t164*t278*t249*t483*t537*t538+
     #t164*t278*t249*t62*t545*t538+t280*t549*t49*t551-t301*t527*t39*t556
     #*t125-t301*t561*t41*t563-t566*t250*t62*t569*t41*t563-t301*t573*t41
     #*t550*t125-t579*t580*t498-t579*t548*t503-t401*t585*t517-t401*t589*
     #t275*t491
      t596 = t25*t560
      t597 = t502*t42
      t604 = t220*t491
      t608 = t315*t25
      t610 = t569*t498
      t622 = t200*t42
      t625 = t137*t109
      t629 = t49*t516
      t631 = t70*t515*t629
      t633 = t200*t491
      t635 = t164*t625*t296*t633
      t637 = t491*t125
      t640 = t137*t94
      t643 = t94*t560
      t646 = t270*t526
      t648 = t200*t97
      t651 = -t470*t596*t597-t301*t244*t526*t275*t114-t301*t501*t604*t11
     #4-t66*t608*t610-t301*t514*t39*t275*t42/2-t301*t520*t39*t604*t42/2-
     #t66*t137*t513*t227*t622/2-t66*t625*t227*t597/2+t631/2+t635/2-t266-
     #t322*t560*t41*t637-t66*t640*t610-t138*t643*t503+t188*t646*t191*t64
     #8
      t652 = t270*t39
      t654 = t502*t97
      t664 = t491*t42*t33
      t671 = t31*t42*t33
      t676 = t31*t125
      t688 = t94*t526
      t693 = t566*t578
      t700 = t188*t652*t191*t654-t138*t596*t502*t120-t147*t569*t200*t120
     #+t147*t548*t664-t147*t580*t200*t114+t147*t580*t671-t225*t68*t526*t
     #124*t676-t66*t315*t596*t503-t147*t548*t502*t114-t301*t643*t604*t12
     #5-t301*t688*t39*t275*t125+t693*t580*t41*t671+t693*t548*t41*t664-t2
     #77-t298
      t702 = t66*t270
      t705 = t66*t274
      t707 = t25*t526*t28
      t708 = t30*t516
      t709 = t708*t33
      t723 = t57*t39*t30
      t729 = t491*t84
      t733 = t367*t526
      t738 = t31*t84
      t742 = t278*t25
      t743 = t164*t742
      t744 = t537*t633
      t745 = t743*t744
      t746 = t702*t596*t664+t525/2+t519/2-t311-t318-t77-t705*t707*t709+t
     #280*t148*t28*t221*t492+t280*t688*t28*t221*t486-t164*t278*t427*t723
     #*t200*t491*t33+t280*t367*t39*t221*t729-t280*t733*t49*t516*t33-t202
     #+t280*t733*t221*t738+t745
      t747 = t707*t629
      t748 = t464*t747
      t752 = t164*t640
      t753 = t537*t654
      t755 = t545*t648
      t759 = t165*t537*t502*t90
      t760 = t522*t33
      t765 = t165*t545*t200*t90
      t766 = t502*t84
      t774 = t200*t84
      t779 = t164*t608
      t782 = t164*t391
      t785 = t748+t66*t391*t569*t671+t752*t753+t752*t755-t344+t759-t165*
     #t723*t760+t765+t165*t723*t766-t66*t742*t569*t622+t165*t57*t526*t30
     #*t774-t70*t733*t709+t779*t753+t779*t755-t782*t537*t760-t403
      t790 = den(-2*dotp(k4,kqb))
      t791 = t511*t790
      t796 = t526**2
      t797 = t483*t796
      t798 = t516*t31
      t803 = t54*t25
      t804 = t66*t803
      t805 = t561*t563
      t807 = t803*t62
      t809 = t522*t97
      t810 = t545*t809
      t813 = t66*t55*t25
      t815 = t30*t550*t97
      t816 = t549*t815
      t820 = t537*t809
      t826 = t708*t97
      t827 = t528*t826
      t836 = t278*t62
      t837 = t164*t836
      t838 = t796*t28
      t840 = t516*t491
      t845 = t550*t491
      t854 = t278*t483
      t855 = t164*t854
      t856 = t560*t28
      t858 = t31*t550
      t867 = t580*t28
      t868 = spb(k2,q2)
      t884 = t743*t528*t49*t516*t84+t470*t797*t39*t798*t125+t804*t805-t1
     #64*t807*t810-t813*t816-t164*t803*t483*t820-t164*t54*t11*t25*t744-t
     #813*t827-t66*t55*t11*t747-t66*t55*t513*t48*t629-t837*t838*t30*t840
     #*t97-t464*t573*t28*t30*t845*t97-t66*t55*t109*t160*t633-t855*t856*t
     #30*t858*t97-t464*t797*t28*t30*t798*t97+t743*t867*t49*t516*t868+t16
     #4*t278*t244*t537*t200*t491*t868+t164*t278*t484*t537*t200*t729
      t885 = t560*t39
      t890 = t66*t836
      t891 = t796*t39
      t892 = t840*t125
      t896 = t858*t125
      t900 = t516*t125
      t903 = t569*t28
      t911 = t526*t560
      t917 = t191*t633
      t920 = t585*t629
      t922 = t20*t836
      t923 = t556*t491
      t926 = t20*t854
      t932 = t66*t408
      t933 = t21*t491
      t935 = t548*t933*t125
      t938 = t39*t516*t125
      t939 = t527*t938
      t941 = t156*t125
      t942 = t580*t941
      t944 = t550*t125
      t945 = t573*t944
      t948 = t569*t563
      t953 = t470*t62*t885*t845*t125+t890*t891*t892+t470*t483*t885*t896+
     #t804*t62*t796*t900-2*t837*t903*t32*t551-2*t855*t903*t708*t492+2*t6
     #6*t854*t911*t892+2*t890*t911*t896+t20*t807*t917+t20*t803*t920+t922
     #*t545*t923+t926*t544*t49*t798+t926*t537*t923+t932*t935+t804*t939+t
     #932*t942+2*t804*t945+3*t66*t807*t948+t922*t537*t200*t550
      t958 = t182*t596*t637
      t962 = t137*t62
      t982 = t631+t635-t958-t566*t68*t885*t944+t164*t962*t810+t164*t137*
     #t483*t820-t702*t891*t900+t70*t827-t782*t537*t766+t705*t856*t815+t7
     #05*t838*t826-t782*t545*t774+t70*t816-2*t702*t911*t563
      t991 = t66*t189*t569*t676
      t995 = t147*t935
      t1003 = 2*t164*t646*t820-t20*t652*t917-t263*t920-t138*t945-t991-t6
     #6*t962*t948-t138*t939-t995-t20*t962*t917-t138*t805-t147*t942+t759-
     #t20*t270*t544*t629+t765
      t1013 = t26*t483
      t1015 = t39*t31*t125
      t1017 = t108*t1013*t1015
      t1021 = t108*t63*t39*t491*t125
      t1022 = t21*t125
      t1024 = t108*t113*t1022
      t1025 = t1013*t28
      t1026 = t32*t97
      t1028 = t79*t1025*t1026
      t1031 = t30*t491*t97
      t1034 = t26*t526
      t1038 = t63*t28
      t1040 = t79*t1038*t1031
      t1043 = t298+t958+t991+t995-t165*t585*t30*t156*t97+t172*t48*t85+t1
     #017+t1021+t1024-t1028-t24*t40*t28*t1031-t24*t1034*t28*t1026-t1040+
     #t102*t1034*t1015
      t1051 = t483*t39
      t1055 = t66*t171*t25
      t1058 = t21**2
      t1069 = t102*t26*t560*t637+t412*t103*t125+t24*t29*t85+t147*t1051*t
     #941-t1055*t536*t1031+t138*t63*t1058*t125-t1055*t544*t1026+t182*t40
     #*t1022+t52-t165*t589*t933*t97-t93-t163+t202+t338
      t1088 = t484*t526
      t1093 = t412*t46*t803
      t1095 = t32*t492
      t1120 = t414*t513*t26*t28*t629+t414*t175*t28*t49*t522+t414*t1025*t
     #49*t738+t414*t1038*t49*t31*t868-t414*t1088*t191*t529-t1093*t1051*t
     #28*t1095-t1093*t867*t1095-t414*t501*t191*t551-t1028-t1040+t439*t10
     #88*t938+t439*t484*t560*t563+t412*t742*t580*t39*t563+t439*t244*t560
     #*t550*t125+t1024+t1017+t108*t63*t526*t31*t125+2*t1021+t748+t745
      aPMMP = t4*t9*(t132+t211)+t4*t217*(t293+t327+t353+t404)+t4*t475+t4
     #80*(t482*t484*t28*t49*t486+t482*t244*t28*t49*t492-t496*t484*t39*t4
     #98-t496*t501*t503-t108*t419*t237*t125-t467)+t511*t480*t593+t511*t2
     #17*(t651+t700+t746+t785)+t791*t480*(t884+t953)+t791*(t982+t1003)+t
     #790*t9*(t1043+t1069)+t790*t480*t1120
