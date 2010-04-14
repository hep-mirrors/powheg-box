      SUBROUTINE Sgb_bbbx(P1,ANS)
C  
C Generated by MadGraph II                                              
C RETURNS AMPLITUDE SQUARED SUMMED/AVG OVER COLORS
C AND HELICITIES
C FOR THE POINT IN PHASE SPACE P(0:3,NEXTERNAL_REAL)
C  
C FOR PROCESS : g b -> b b b~  
C  
C Crossing   1 is g b -> b b b~  
      IMPLICIT NONE
C  
C CONSTANTS
C  
      Include "../genps.inc"
      INTEGER                 NCOMB,     NCROSS         
      PARAMETER (             NCOMB=  32, NCROSS=  1)
      INTEGER    THEL
      PARAMETER (THEL=NCOMB*NCROSS)
C  
C ARGUMENTS 
C  
      REAL*8 P1(0:3,NEXTERNAL_REAL),ANS(NCROSS)
C  
C LOCAL VARIABLES 
C  
      INTEGER NHEL(NEXTERNAL_REAL,NCOMB),NTRY
      REAL*8 T, P(0:3,NEXTERNAL_REAL)
      REAL*8 gb_bbbx
      INTEGER IHEL,IDEN(NCROSS),IC(NEXTERNAL_REAL,NCROSS)
      INTEGER IPROC,JC(NEXTERNAL_REAL), I
      LOGICAL GOODHEL(NCOMB,NCROSS)
      INTEGER NGRAPHS
      REAL*8 hwgt, xtot, xtry, xrej, xr, yfrac(0:ncomb)
      INTEGER idum, ngood, igood(ncomb), jhel, j, jj
      LOGICAL warned
      REAL     xran1
      EXTERNAL xran1
C  
C GLOBAL VARIABLES
C  
      Double Precision amp2(maxamps), jamp2(0:maxamps)
      common/to_amps_gb_bbbx/  amp2,       jamp2

      character*79         hel_buff
      common/to_helicity/  hel_buff

      REAL*8 POL(2)
      common/to_polarization/ POL

      integer          isum_hel
      logical                    multi_channel
      common/to_matrix/isum_hel, multi_channel
      INTEGER MAPCONFIG(0:LMAXCONFIGS), ICONFIG
      common/to_mconfigs/mapconfig, iconfig
      DATA NTRY,IDUM /0,-1/
      DATA xtry, xrej, ngood /0,0,0/
      DATA warned/.false./
      
      SAVE yfrac, igood, jhel
      DATA NGRAPHS /   10/          
      DATA jamp2(0) /   8/          
      DATA GOODHEL/THEL*.FALSE./
      DATA (NHEL(IHEL,   1),IHEL=1, 5) /-1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,   2),IHEL=1, 5) /-1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,   3),IHEL=1, 5) /-1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,   4),IHEL=1, 5) /-1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,   5),IHEL=1, 5) /-1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,   6),IHEL=1, 5) /-1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,   7),IHEL=1, 5) /-1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,   8),IHEL=1, 5) /-1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,   9),IHEL=1, 5) /-1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  10),IHEL=1, 5) /-1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  11),IHEL=1, 5) /-1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  12),IHEL=1, 5) /-1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  13),IHEL=1, 5) /-1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  14),IHEL=1, 5) /-1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  15),IHEL=1, 5) /-1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  16),IHEL=1, 5) /-1, 1, 1, 1, 1/
      DATA (NHEL(IHEL,  17),IHEL=1, 5) / 1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,  18),IHEL=1, 5) / 1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,  19),IHEL=1, 5) / 1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,  20),IHEL=1, 5) / 1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,  21),IHEL=1, 5) / 1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,  22),IHEL=1, 5) / 1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,  23),IHEL=1, 5) / 1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,  24),IHEL=1, 5) / 1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,  25),IHEL=1, 5) / 1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  26),IHEL=1, 5) / 1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  27),IHEL=1, 5) / 1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  28),IHEL=1, 5) / 1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  29),IHEL=1, 5) / 1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  30),IHEL=1, 5) / 1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  31),IHEL=1, 5) / 1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  32),IHEL=1, 5) / 1, 1, 1, 1, 1/
      DATA (  IC(IHEL,  1),IHEL=1, 5) / 1, 2, 3, 4, 5/
      DATA (IDEN(IHEL),IHEL=  1,  1) / 192/
C ----------
C BEGIN CODE
C ----------
      NTRY=NTRY+1
      DO IPROC=1,NCROSS
      CALL SWITCHMOM(P1,P,IC(1,IPROC),JC,NEXTERNAL_REAL)
      DO IHEL=1,NEXTERNAL_REAL
         JC(IHEL) = +1
      ENDDO
       
      IF (multi_channel) THEN
          DO IHEL=1,NGRAPHS
              amp2(ihel)=0d0
              jamp2(ihel)=0d0
          ENDDO
          DO IHEL=1,int(jamp2(0))
              jamp2(ihel)=0d0
          ENDDO
      ENDIF
      ANS(IPROC) = 0D0
      write(hel_buff,'(16i5)') (0,i=1,NEXTERNAL_REAL)
      IF (ISUM_HEL .EQ. 0 .OR. NTRY .LT. 10) THEN
          DO IHEL=1,NCOMB
             IF (GOODHEL(IHEL,IPROC) .OR. NTRY .LT. 2) THEN
                 T=gb_bbbx(P ,NHEL(1,IHEL),JC(1))            
               DO JJ=1,nincoming
                 IF(POL(JJ).NE.1d0.AND.
     &              NHEL(JJ,IHEL).EQ.INT(SIGN(1d0,POL(JJ)))) THEN
                   T=T*ABS(POL(JJ))
                 ELSE IF(POL(JJ).NE.1d0)THEN
                   T=T*(2d0-ABS(POL(JJ)))
                 ENDIF
               ENDDO
               ANS(IPROC)=ANS(IPROC)+T
               IF (T .NE. 0D0 .AND. .NOT.    GOODHEL(IHEL,IPROC)) THEN
                   GOODHEL(IHEL,IPROC)=.TRUE.
                   NGOOD = NGOOD +1
                   IGOOD(NGOOD) = IHEL
               ENDIF
             ENDIF
          ENDDO
          JHEL = 1
          ISUM_HEL=MIN(ISUM_HEL,NGOOD)
      ELSE              !RANDOM HELICITY
          DO J=1,ISUM_HEL
              JHEL=JHEL+1
              IF (JHEL .GT. NGOOD) JHEL=1
              HWGT = REAL(NGOOD)/REAL(ISUM_HEL)
              IHEL = IGOOD(JHEL)
              T=gb_bbbx(P ,NHEL(1,IHEL),JC(1))            
              DO JJ=1,nincoming
                IF(POL(JJ).NE.1d0.AND.
     &             NHEL(JJ,IHEL).EQ.INT(SIGN(1d0,POL(JJ)))) THEN
                  T=T*ABS(POL(JJ))
                ELSE IF(POL(JJ).NE.1d0)THEN
                  T=T*(2d0-ABS(POL(JJ)))
                ENDIF
              ENDDO
              ANS(IPROC)=ANS(IPROC)+T*HWGT
          ENDDO
          IF (ISUM_HEL .EQ. 1) THEN
              WRITE(HEL_BUFF,'(16i5)')(NHEL(i,IHEL),i=1,NEXTERNAL_REAL)
          ENDIF
      ENDIF
      IF (MULTI_CHANNEL) THEN
          XTOT=0D0
          DO IHEL=1,MAPCONFIG(0)
              XTOT=XTOT+AMP2(MAPCONFIG(IHEL))
          ENDDO
          IF (XTOT.NE.0D0) THEN
              ANS(IPROC)=ANS(IPROC)*AMP2(MAPCONFIG(ICONFIG))/XTOT
          ELSE
              ANS(IPROC)=0D0
          ENDIF
      ENDIF
      ANS(IPROC)=ANS(IPROC)/DBLE(IDEN(IPROC))
      ENDDO
      END
       
       
      REAL*8 FUNCTION gb_bbbx(P,NHEL,IC)
C  
C Generated by MadGraph II                                              
C RETURNS AMPLITUDE SQUARED SUMMED/AVG OVER COLORS
C FOR THE POINT WITH EXTERNAL LINES W(0:6,NEXTERNAL_REAL)
C  
C FOR PROCESS : g b -> b b b~  
C  
      IMPLICIT NONE
C  
C CONSTANTS
C  
      INTEGER    NGRAPHS,    NEIGEN 
      PARAMETER (NGRAPHS=  10,NEIGEN=  8) 
      include "../genps.inc"
      INTEGER    NWAVEFUNCS     , NCOLOR
      PARAMETER (NWAVEFUNCS=  17, NCOLOR=   8) 
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
C  
C ARGUMENTS 
C  
      REAL*8 P(0:3,NEXTERNAL_REAL)
      INTEGER NHEL(NEXTERNAL_REAL), IC(NEXTERNAL_REAL)
C  
C LOCAL VARIABLES 
C  
      INTEGER I,J
      COMPLEX*16 ZTEMP
      REAL*8 DENOM(NCOLOR), CF(NCOLOR,NCOLOR)
      COMPLEX*16 AMP(NGRAPHS), JAMP(NCOLOR)
      COMPLEX*16 W(18,NWAVEFUNCS)
C  
C GLOBAL VARIABLES
C  
      Double Precision amp2(maxamps), jamp2(0:maxamps)
      common/to_amps_gb_bbbx/  amp2,       jamp2
      include "../coupl.inc"
C  
C COLOR DATA
C  
      DATA Denom(1  )/            9/                                       
      DATA (CF(i,1  ),i=1  ,6  ) /    24,   -6,   21,   -3,    1,   -8/    
      DATA (CF(i,1  ),i=7  ,8  ) /    10,    1/                            
C               T[ 4, 2]T[ 3, 5, 1]                                        
      DATA Denom(2  )/            9/                                       
      DATA (CF(i,2  ),i=1  ,6  ) /    -6,   24,   -3,   21,    1,   10/    
      DATA (CF(i,2  ),i=7  ,8  ) /    -8,    1/                            
C               T[ 4, 2, 1]T[ 3, 5]                                        
      DATA Denom(3  )/            9/                                       
      DATA (CF(i,3  ),i=1  ,6  ) /    21,   -3,   24,   -6,   10,    1/    
      DATA (CF(i,3  ),i=7  ,8  ) /     1,   -8/                            
C               T[ 4, 2]T[ 3, 5, 1]                                        
      DATA Denom(4  )/            9/                                       
      DATA (CF(i,4  ),i=1  ,6  ) /    -3,   21,   -6,   24,   -8,    1/    
      DATA (CF(i,4  ),i=7  ,8  ) /     1,   10/                            
C               T[ 3, 5]T[ 4, 2, 1]                                        
      DATA Denom(5  )/            9/                                       
      DATA (CF(i,5  ),i=1  ,6  ) /     1,    1,   10,   -8,   24,   21/    
      DATA (CF(i,5  ),i=7  ,8  ) /    -3,   -6/                            
C               T[ 3, 2]T[ 4, 5, 1]                                        
      DATA Denom(6  )/            9/                                       
      DATA (CF(i,6  ),i=1  ,6  ) /    -8,   10,    1,    1,   21,   24/    
      DATA (CF(i,6  ),i=7  ,8  ) /    -6,   -3/                            
C               T[ 4, 5, 1]T[ 3, 2]                                        
      DATA Denom(7  )/            9/                                       
      DATA (CF(i,7  ),i=1  ,6  ) /    10,   -8,    1,    1,   -3,   -6/    
      DATA (CF(i,7  ),i=7  ,8  ) /    24,   21/                            
C               T[ 4, 5]T[ 3, 2, 1]                                        
      DATA Denom(8  )/            9/                                       
      DATA (CF(i,8  ),i=1  ,6  ) /     1,    1,   -8,   10,   -6,   -3/    
      DATA (CF(i,8  ),i=7  ,8  ) /    21,   24/                            
C               T[ 4, 5]T[ 3, 2, 1]                                        
C ----------
C BEGIN CODE
C ----------
      CALL VXXXXX(P(0,1   ),ZERO ,NHEL(1   ),-1*IC(1   ),W(1,1   ))        
      CALL IXXXXX(P(0,2   ),BMASS ,NHEL(2   ),+1*IC(2   ),W(1,2   ))       
      CALL OXXXXX(P(0,3   ),BMASS ,NHEL(3   ),+1*IC(3   ),W(1,3   ))       
      CALL OXXXXX(P(0,4   ),BMASS ,NHEL(4   ),+1*IC(4   ),W(1,4   ))       
      CALL IXXXXX(P(0,5   ),BMASS ,NHEL(5   ),-1*IC(5   ),W(1,5   ))       
      CALL JIOXXX(W(1,2   ),W(1,3   ),GG ,ZERO    ,ZERO    ,W(1,6   ))     
      CALL FVOXXX(W(1,4   ),W(1,6   ),GG ,BMASS   ,ZERO    ,W(1,7   ))     
      CALL IOVXXX(W(1,5   ),W(1,7   ),W(1,1   ),GG ,AMP(1   ))             
      CALL JVVXXX(W(1,6   ),W(1,1   ),G ,ZERO    ,ZERO    ,W(1,8   ))      
      CALL IOVXXX(W(1,5   ),W(1,4   ),W(1,8   ),GG ,AMP(2   ))             
      CALL FVOXXX(W(1,4   ),W(1,1   ),GG ,BMASS   ,ZERO    ,W(1,9   ))     
      CALL IOVXXX(W(1,5   ),W(1,9   ),W(1,6   ),GG ,AMP(3   ))             
      CALL FVOXXX(W(1,3   ),W(1,1   ),GG ,BMASS   ,ZERO    ,W(1,10  ))     
      CALL JIOXXX(W(1,2   ),W(1,10  ),GG ,ZERO    ,ZERO    ,W(1,11  ))     
      CALL IOVXXX(W(1,5   ),W(1,4   ),W(1,11  ),GG ,AMP(4   ))             
      CALL FVIXXX(W(1,2   ),W(1,1   ),GG ,BMASS   ,ZERO    ,W(1,12  ))     
      CALL JIOXXX(W(1,12  ),W(1,3   ),GG ,ZERO    ,ZERO    ,W(1,13  ))     
      CALL IOVXXX(W(1,5   ),W(1,4   ),W(1,13  ),GG ,AMP(5   ))             
      CALL JIOXXX(W(1,5   ),W(1,3   ),GG ,ZERO    ,ZERO    ,W(1,14  ))     
      CALL IOVXXX(W(1,2   ),W(1,9   ),W(1,14  ),GG ,AMP(6   ))             
      CALL JIOXXX(W(1,2   ),W(1,4   ),GG ,ZERO    ,ZERO    ,W(1,15  ))     
      CALL FVIXXX(W(1,5   ),W(1,1   ),GG ,BMASS   ,ZERO    ,W(1,16  ))     
      CALL IOVXXX(W(1,16  ),W(1,3   ),W(1,15  ),GG ,AMP(7   ))             
      CALL VVVXXX(W(1,1   ),W(1,15  ),W(1,14  ),G ,AMP(8   ))              
      CALL IOVXXX(W(1,5   ),W(1,10  ),W(1,15  ),GG ,AMP(9   ))             
      CALL JIOXXX(W(1,12  ),W(1,4   ),GG ,ZERO    ,ZERO    ,W(1,17  ))     
      CALL IOVXXX(W(1,5   ),W(1,3   ),W(1,17  ),GG ,AMP(10  ))             
      JAMP(   1) = -AMP(   1)
      JAMP(   2) = +AMP(   2)-AMP(   5)
      JAMP(   3) = -AMP(   2)-AMP(   4)
      JAMP(   4) = -AMP(   3)
      JAMP(   5) = +AMP(   6)-AMP(   8)
      JAMP(   6) = +AMP(   7)
      JAMP(   7) = +AMP(   8)+AMP(  10)
      JAMP(   8) = +AMP(   9)
      gb_bbbx = 0.D0 
      DO I = 1, NCOLOR
          ZTEMP = (0.D0,0.D0)
          DO J = 1, NCOLOR
              ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
          ENDDO
          gb_bbbx =gb_bbbx+ZTEMP*DCONJG(JAMP(I))/DENOM(I)   
      ENDDO
      Do I = 1, NGRAPHS
          amp2(i)=amp2(i)+amp(i)*dconjg(amp(i))
      Enddo
      Do I = 1, NCOLOR
          Jamp2(i)=Jamp2(i)+Jamp(i)*dconjg(Jamp(i))
      Enddo
C      CALL GAUGECHECK(JAMP,ZTEMP,EIGEN_VEC,EIGEN_VAL,NCOLOR,NEIGEN) 
      END
       
       
