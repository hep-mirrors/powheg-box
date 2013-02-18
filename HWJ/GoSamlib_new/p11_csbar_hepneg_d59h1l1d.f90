module     p11_csbar_hepneg_d59h1l1d
   ! file:      /home/pcl305a/luisonig/Documents/GoSamPowheg/POWHEG-BOX/HWJ/GoSa
   ! mlib_New/Virtual/p11_csbar_hepneg/helicity1/d59h1l1d.f90
   ! generator: haggies (1.1)
   use p11_csbar_hepneg_config, only: ki
   use p11_csbar_hepneg_util, only: cond, d => metric_tensor
   

   implicit none
   private

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   integer, private :: iv0
   integer, private :: iv1
   integer, private :: iv2
   integer, private :: iv3
   real(ki), dimension(4), private :: qshift


   public :: derivative, reconstruct_d59
contains
!---#[ function brack_1:
   pure function brack_1(Q) result(brack)
      use p11_csbar_hepneg_model
      use p11_csbar_hepneg_kinematics
      use p11_csbar_hepneg_color
      use p11_csbar_hepneg_abbrevh1
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5
      complex(ki) :: t6
      real(ki) :: t7
      real(ki) :: t8
      real(ki) :: t9
      real(ki) :: t10
      t7 = dotproduct(qshift, qshift)
      t8 = dotproduct(k1, qshift)
      t9 = dotproduct(k6, qshift)
      t1 = (spvak6k2(1)*qshift(1)-spvak6k2(2)*qshift(2)-spvak6k2(3)*qshift(3)-sp&
      &vak6k2(4)*qshift(4))
      t2 = (spvak6k1(1)*qshift(1)-spvak6k1(2)*qshift(2)-spvak6k1(3)*qshift(3)-sp&
      &vak6k1(4)*qshift(4))
      t10 = dotproduct(k2, qshift)
      t3 = (spvak5k1(1)*qshift(1)-spvak5k1(2)*qshift(2)-spvak5k1(3)*qshift(3)-sp&
      &vak5k1(4)*qshift(4))
      t4 = (spvak2k1(1)*qshift(1)-spvak2k1(2)*qshift(2)-spvak2k1(3)*qshift(3)-sp&
      &vak2k1(4)*qshift(4))
      t5 = (spvak2k4(1)*qshift(1)-spvak2k4(2)*qshift(2)-spvak2k4(3)*qshift(3)-sp&
      &vak2k4(4)*qshift(4))
      t6 = (spvak5k4(1)*qshift(1)-spvak5k4(2)*qshift(2)-spvak5k4(3)*qshift(3)-sp&
      &vak5k4(4)*qshift(4))
      brack = (abb59n28+t1*abb59n57+t10*abb59n59+t2*abb59n58+t7*abb59n46+t8*abb5&
      &9n54+t9*abb59n55+t1*t10*abb59n40+t1*t2*abb59n31+t1*t3*abb59n30+t1*t4*abb5&
      &9n37+t1*t5*abb59n39+t1*t8*abb59n40+t2*t6*abb59n51+t2*t7*abb59n76+t2*t8*ab&
      &b59n38+t2*t9*abb59n35+t3*t7*abb59n81+t3*t8*abb59n32+t3*t9*abb59n34+t4*t6*&
      &abb59n47+t5*t7*abb59n68+t5*t8*abb59n41+t5*t9*abb59n43+t6*t7*abb59n63+t6*t&
      &8*abb59n44+t1*t4*t6*abb59n86)
   end  function brack_1
!---#] function brack_1:
!---#[ function brack_2:
   pure function brack_2(Q) result(brack)
      use p11_csbar_hepneg_model
      use p11_csbar_hepneg_kinematics
      use p11_csbar_hepneg_color
      use p11_csbar_hepneg_abbrevh1
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5
      complex(ki) :: t6
      complex(ki) :: t7
      complex(ki) :: t8
      complex(ki) :: t9
      complex(ki) :: t10
      complex(ki) :: t11
      complex(ki) :: t12
      complex(ki) :: t13
      complex(ki) :: t14
      complex(ki) :: t15
      complex(ki) :: t16
      complex(ki) :: t17
      real(ki) :: t18
      real(ki) :: t19
      real(ki) :: t20
      t1 = k1(iv1)
      t2 = k2(iv1)
      t3 = k6(iv1)
      t4 = qshift(iv1)
      t5 = spvak6k1(iv1)
      t6 = spvak6k2(iv1)
      t7 = (spvak5k4(1)*qshift(1)-spvak5k4(2)*qshift(2)-spvak5k4(3)*qshift(3)-sp&
      &vak5k4(4)*qshift(4))
      t8 = (spvak2k4(1)*qshift(1)-spvak2k4(2)*qshift(2)-spvak2k4(3)*qshift(3)-sp&
      &vak2k4(4)*qshift(4))
      t9 = (spvak6k2(1)*qshift(1)-spvak6k2(2)*qshift(2)-spvak6k2(3)*qshift(3)-sp&
      &vak6k2(4)*qshift(4))
      t10 = (spvak6k1(1)*qshift(1)-spvak6k1(2)*qshift(2)-spvak6k1(3)*qshift(3)-s&
      &pvak6k1(4)*qshift(4))
      t11 = (spvak5k1(1)*qshift(1)-spvak5k1(2)*qshift(2)-spvak5k1(3)*qshift(3)-s&
      &pvak5k1(4)*qshift(4))
      t12 = spvak2k1(iv1)
      t13 = spvak2k4(iv1)
      t18 = dotproduct(qshift, qshift)
      t19 = dotproduct(k6, qshift)
      t20 = dotproduct(k1, qshift)
      t14 = spvak5k1(iv1)
      t15 = spvak5k4(iv1)
      t16 = (spvak2k1(1)*qshift(1)-spvak2k1(2)*qshift(2)-spvak2k1(3)*qshift(3)-s&
      &pvak2k1(4)*qshift(4))
      t17 = t6*abb59n71
      brack = (t1*abb59n53+t17*t20+t17*dotproduct(k2, qshift)+t2*abb59n48+t3*abb&
      &59n52+t4*abb59n61+t5*abb59n49+t6*abb59n50+t1*t10*abb59n73+t1*t11*abb59n83&
      &+t1*t7*abb59n65+t1*t8*abb59n70+t1*t9*abb59n71+t10*t15*abb59n56+t10*t3*abb&
      &59n78+t10*t4*abb59n75+t10*t6*abb59n84+t11*t3*abb59n79+t11*t4*abb59n80+t11&
      &*t6*abb59n85+t12*t7*abb59n60+t12*t9*abb59n74+t13*t18*abb59n42+t13*t19*abb&
      &59n66+t13*t20*abb59n70+t13*t9*abb59n72+t14*t18*abb59n33+t14*t19*abb59n79+&
      &t14*t20*abb59n83+t14*t9*abb59n85+t15*t16*abb59n60+t15*t18*abb59n45+t15*t2&
      &0*abb59n65+t16*t6*abb59n74+t18*t5*abb59n36+t19*t5*abb59n78+t2*t9*abb59n71&
      &+t20*t5*abb59n73+t3*t8*abb59n66+t4*t7*abb59n62+t4*t8*abb59n67+t5*t7*abb59&
      &n56+t5*t9*abb59n84+t6*t8*abb59n72+t12*t7*t9*abb59n29+t15*t16*t9*abb59n29+&
      &t16*t6*t7*abb59n29)
   end  function brack_2
!---#] function brack_2:
!---#[ function brack_3:
   pure function brack_3(Q) result(brack)
      use p11_csbar_hepneg_model
      use p11_csbar_hepneg_kinematics
      use p11_csbar_hepneg_color
      use p11_csbar_hepneg_abbrevh1
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5
      complex(ki) :: t6
      complex(ki) :: t7
      complex(ki) :: t8
      complex(ki) :: t9
      complex(ki) :: t10
      complex(ki) :: t11
      complex(ki) :: t12
      complex(ki) :: t13
      complex(ki) :: t14
      complex(ki) :: t15
      complex(ki) :: t16
      complex(ki) :: t17
      complex(ki) :: t18
      complex(ki) :: t19
      complex(ki) :: t20
      complex(ki) :: t21
      complex(ki) :: t22
      complex(ki) :: t23
      real(ki) :: t24
      t24 = d(iv1,iv2)
      t1 = (spvak5k4(1)*qshift(1)-spvak5k4(2)*qshift(2)-spvak5k4(3)*qshift(3)-sp&
      &vak5k4(4)*qshift(4))
      t2 = k1(iv1)
      t3 = spvak2k4(iv2)
      t4 = spvak5k1(iv2)
      t5 = spvak5k4(iv2)
      t6 = spvak6k1(iv2)
      t7 = spvak6k2(iv2)
      t8 = k1(iv2)
      t9 = spvak2k4(iv1)
      t10 = spvak5k1(iv1)
      t11 = spvak5k4(iv1)
      t12 = spvak6k1(iv1)
      t13 = spvak6k2(iv1)
      t14 = k6(iv1)
      t15 = k6(iv2)
      t16 = qshift(iv1)
      t17 = qshift(iv2)
      t18 = spvak2k1(iv1)
      t19 = t18*t5
      t18 = t18*t7
      t20 = spvak2k1(iv2)
      t21 = t11*t20
      t20 = t13*t20
      t22 = (spvak6k2(1)*qshift(1)-spvak6k2(2)*qshift(2)-spvak6k2(3)*qshift(3)-s&
      &pvak6k2(4)*qshift(4))
      t23 = (spvak2k1(1)*qshift(1)-spvak2k1(2)*qshift(2)-spvak2k1(3)*qshift(3)-s&
      &pvak2k1(4)*qshift(4))
      brack = ((2.0_ki)*(t24*abb59n46+t1*t24*abb59n63+t24*abb59n68*(spvak2k4(1)*&
      &qshift(1)-spvak2k4(2)*qshift(2)-spvak2k4(3)*qshift(3)-spvak2k4(4)*qshift(&
      &4))+t24*abb59n76*(spvak6k1(1)*qshift(1)-spvak6k1(2)*qshift(2)-spvak6k1(3)&
      &*qshift(3)-spvak6k1(4)*qshift(4))+t24*abb59n81*(spvak5k1(1)*qshift(1)-spv&
      &ak5k1(2)*qshift(2)-spvak5k1(3)*qshift(3)-spvak5k1(4)*qshift(4)))+t18*abb5&
      &9n37+t19*abb59n47+t20*abb59n37+t21*abb59n47+k2(iv1)*t7*abb59n40+k2(iv2)*t&
      &13*abb59n40+t1*t18*abb59n86+t1*t20*abb59n86+t10*t15*abb59n34+t10*t17*abb5&
      &9n82+t10*t7*abb59n30+t10*t8*abb59n32+t11*t17*abb59n64+t11*t6*abb59n51+t11&
      &*t8*abb59n44+t12*t15*abb59n35+t12*t17*abb59n77+t12*t5*abb59n51+t12*t7*abb&
      &59n31+t12*t8*abb59n38+t13*t3*abb59n39+t13*t4*abb59n30+t13*t6*abb59n31+t13&
      &*t8*abb59n40+t14*t3*abb59n43+t14*t4*abb59n34+t14*t6*abb59n35+t15*t9*abb59&
      &n43+t16*t3*abb59n69+t16*t4*abb59n82+t16*t5*abb59n64+t16*t6*abb59n77+t17*t&
      &9*abb59n69+t19*t22*abb59n86+t2*t3*abb59n41+t2*t4*abb59n32+t2*t5*abb59n44+&
      &t2*t6*abb59n38+t2*t7*abb59n40+t21*t22*abb59n86+t7*t9*abb59n39+t8*t9*abb59&
      &n41+t11*t23*t7*abb59n86+t13*t23*t5*abb59n86)
   end  function brack_3
!---#] function brack_3:
!---#[ function brack_4:
   pure function brack_4(Q) result(brack)
      use p11_csbar_hepneg_model
      use p11_csbar_hepneg_kinematics
      use p11_csbar_hepneg_color
      use p11_csbar_hepneg_abbrevh1
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5
      complex(ki) :: t6
      complex(ki) :: t7
      complex(ki) :: t8
      complex(ki) :: t9
      real(ki) :: t10
      real(ki) :: t11
      real(ki) :: t12
      t10 = d(iv2,iv3)
      t11 = d(iv1,iv3)
      t12 = d(iv1,iv2)
      t1 = spvak5k4(iv1)
      t2 = spvak5k4(iv2)
      t3 = spvak5k4(iv3)
      t4 = spvak2k1(iv1)
      t5 = spvak6k2(iv3)
      t6 = spvak6k2(iv2)
      t7 = spvak2k1(iv2)
      t8 = spvak6k2(iv1)
      t9 = spvak2k1(iv3)
      brack = ((2.0_ki)*(spvak2k4(iv1)*t10*abb59n42+spvak2k4(iv2)*t11*abb59n42+s&
      &pvak2k4(iv3)*t12*abb59n42+spvak5k1(iv1)*t10*abb59n33+spvak5k1(iv2)*t11*ab&
      &b59n33+spvak5k1(iv3)*t12*abb59n33+spvak6k1(iv1)*t10*abb59n36+spvak6k1(iv2&
      &)*t11*abb59n36+spvak6k1(iv3)*t12*abb59n36+t1*t10*abb59n45+t11*t2*abb59n45&
      &+t12*t3*abb59n45)+t1*t5*t7*abb59n29+t1*t6*t9*abb59n29+t2*t4*t5*abb59n29+t&
      &2*t8*t9*abb59n29+t3*t4*t6*abb59n29+t3*t7*t8*abb59n29)
   end  function brack_4
!---#] function brack_4:

!---#[ function derivative:
   function derivative(mu2, i1, i2, i3) result(numerator)
      use p11_csbar_hepneg_globalsl1, only: epspow
      use p11_csbar_hepneg_kinematics
      use p11_csbar_hepneg_abbrevh1
      implicit none
      complex(ki), intent(in) :: mu2
      integer, intent(in), optional :: i1
      integer, intent(in), optional :: i2
      integer, intent(in), optional :: i3
      complex(ki) :: numerator
      complex(ki) :: loc
      integer :: t1
      integer :: deg
      complex(ki), dimension(4), parameter :: Q = (/&
        &(0.0_ki,0.0_ki),(0.0_ki,0.0_ki),(0.0_ki,0.0_ki),(0.0_ki,0.0_ki)/)
      qshift = k2
      numerator = 0.0_ki
      deg = 0
      if(present(i1)) then
         iv1 = i1
         deg = 1
      else
         iv1 = 1
      end if
      if(present(i2)) then
         iv2 = i2
         deg = 2
      else
         iv2 = 1
      end if
      if(present(i3)) then
         iv3 = i3
         deg = 3
      else
         iv3 = 1
      end if
      t1 = 0
      if(deg.eq.0) then
         numerator = (cond(epspow.eq.t1,brack_1(Q),Q,mu2))
         return
      end if
      if(deg.eq.1) then
         numerator = (cond(epspow.eq.t1,brack_2(Q),Q,mu2))
         return
      end if
      if(deg.eq.2) then
         numerator = (cond(epspow.eq.t1,brack_3(Q),Q,mu2))
         return
      end if
      if(deg.eq.3) then
         numerator = (cond(epspow.eq.t1,brack_4(Q),Q,mu2))
         return
      end if
   end function derivative
!---#] function derivative:
!---#[ subroutine reconstruct_d59:
   subroutine     reconstruct_d59(coeffs)
      use p11_csbar_hepneg_groups, only: tensrec_info_group3
      implicit none
      complex(ki), parameter :: czip = (0.0_ki, 0.0_ki)
      complex(ki), parameter :: cone = (1.0_ki, 0.0_ki)

      type(tensrec_info_group3), intent(out) :: coeffs
      ! rank 3 case:
      !---[# reconstruct coeffs%coeffs_59:
      coeffs%coeffs_59%c0 = derivative(czip)
      coeffs%coeffs_59%c1(1,1) = derivative(czip,1)
      coeffs%coeffs_59%c1(1,2) = derivative(czip,1,1) / 2.0_ki
      coeffs%coeffs_59%c1(1,3) = derivative(czip,1,1,1) / 6.0_ki
      coeffs%coeffs_59%c1(2,1) = -derivative(czip,2)
      coeffs%coeffs_59%c1(2,2) = derivative(czip,2,2) / 2.0_ki
      coeffs%coeffs_59%c1(2,3) = -derivative(czip,2,2,2) / 6.0_ki
      coeffs%coeffs_59%c1(3,1) = -derivative(czip,3)
      coeffs%coeffs_59%c1(3,2) = derivative(czip,3,3) / 2.0_ki
      coeffs%coeffs_59%c1(3,3) = -derivative(czip,3,3,3) / 6.0_ki
      coeffs%coeffs_59%c1(4,1) = -derivative(czip,4)
      coeffs%coeffs_59%c1(4,2) = derivative(czip,4,4) / 2.0_ki
      coeffs%coeffs_59%c1(4,3) = -derivative(czip,4,4,4) / 6.0_ki
      coeffs%coeffs_59%c2(1,1) = -derivative(czip,1,2)
      coeffs%coeffs_59%c2(1,2) = derivative(czip,1,2,2) / 2.0_ki
      coeffs%coeffs_59%c2(1,3) = -derivative(czip,1,1,2) / 2.0_ki
      coeffs%coeffs_59%c2(2,1) = -derivative(czip,1,3)
      coeffs%coeffs_59%c2(2,2) = derivative(czip,1,3,3) / 2.0_ki
      coeffs%coeffs_59%c2(2,3) = -derivative(czip,1,1,3) / 2.0_ki
      coeffs%coeffs_59%c2(3,1) = -derivative(czip,1,4)
      coeffs%coeffs_59%c2(3,2) = derivative(czip,1,4,4) / 2.0_ki
      coeffs%coeffs_59%c2(3,3) = -derivative(czip,1,1,4) / 2.0_ki
      coeffs%coeffs_59%c2(4,1) = derivative(czip,2,3)
      coeffs%coeffs_59%c2(4,2) = -derivative(czip,2,3,3) / 2.0_ki
      coeffs%coeffs_59%c2(4,3) = -derivative(czip,2,2,3) / 2.0_ki
      coeffs%coeffs_59%c2(5,1) = derivative(czip,2,4)
      coeffs%coeffs_59%c2(5,2) = -derivative(czip,2,4,4) / 2.0_ki
      coeffs%coeffs_59%c2(5,3) = -derivative(czip,2,2,4) / 2.0_ki
      coeffs%coeffs_59%c2(6,1) = derivative(czip,3,4)
      coeffs%coeffs_59%c2(6,2) = -derivative(czip,3,4,4) / 2.0_ki
      coeffs%coeffs_59%c2(6,3) = -derivative(czip,3,3,4) / 2.0_ki
      coeffs%coeffs_59%c3(1,1) = derivative(czip,1,2,3)
      coeffs%coeffs_59%c3(2,1) = derivative(czip,1,2,4)
      coeffs%coeffs_59%c3(3,1) = derivative(czip,1,3,4)
      coeffs%coeffs_59%c3(4,1) = -derivative(czip,2,3,4)
      !---#] reconstruct coeffs%coeffs_59:
   end subroutine reconstruct_d59
!---#] subroutine reconstruct_d59:
end module p11_csbar_hepneg_d59h1l1d
