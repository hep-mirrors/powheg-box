      SUBROUTINE Sddx_epemddxg(P1,ANS)
C  
C Generated by MadGraph II                                              
C RETURNS AMPLITUDE SQUARED SUMMED/AVG OVER COLORS
C AND HELICITIES
C FOR THE POINT IN PHASE SPACE P(0:3,NEXTERNAL_REAL)
C  
C FOR PROCESS : d d~ -> e+ e- d d~ g  
C  
C Crossing   1 is d d~ -> e+ e- d d~ g  
      IMPLICIT NONE
C  
C CONSTANTS
C  
      Include "../genps.inc"
      Include "NEXTERNAL_REAL.inc"
      Include "maxamps.inc"
      INTEGER                 NCOMB,     NCROSS         
      PARAMETER (             NCOMB= 128, NCROSS=  1)
      INTEGER    THEL
      PARAMETER (THEL=NCOMB*NCROSS)
C  
C ARGUMENTS 
C  
      double precision P1(0:3,NEXTERNAL_REAL),ANS(NCROSS)
C  
C LOCAL VARIABLES 
C  
      INTEGER NHEL(NEXTERNAL_REAL,NCOMB),NTRY
      double precision T, P(0:3,NEXTERNAL_REAL)
      double precision ddx_epemddxg
      INTEGER IHEL,IDEN(NCROSS),IC(NEXTERNAL_REAL,NCROSS)
      INTEGER IPROC,JC(NEXTERNAL_REAL), I
      LOGICAL GOODHEL(NCOMB,NCROSS)
      INTEGER NGRAPHS
      double precision hwgt, xtot, xtry, xrej, xr, yfrac(0:ncomb)
      INTEGER idum, ngood, igood(ncomb), jhel, j, jj
      LOGICAL warned
      REAL     xran1
      EXTERNAL xran1
C  
C GLOBAL VARIABLES
C  
      Double Precision amp2(maxamps), jamp2(0:maxamps)
      common/to_amps_ddx_epemddxg/  amp2,       jamp2

      character*79         hel_buff
      common/to_helicity/  hel_buff

      double precision POL(2)
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
      DATA NGRAPHS /   96/          
      DATA jamp2(0) /   8/          
      DATA GOODHEL/THEL*.FALSE./
      DATA (NHEL(IHEL,   1),IHEL=1, 7) /-1,-1,-1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,   2),IHEL=1, 7) /-1,-1,-1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,   3),IHEL=1, 7) /-1,-1,-1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,   4),IHEL=1, 7) /-1,-1,-1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,   5),IHEL=1, 7) /-1,-1,-1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,   6),IHEL=1, 7) /-1,-1,-1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,   7),IHEL=1, 7) /-1,-1,-1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,   8),IHEL=1, 7) /-1,-1,-1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,   9),IHEL=1, 7) /-1,-1,-1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  10),IHEL=1, 7) /-1,-1,-1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  11),IHEL=1, 7) /-1,-1,-1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  12),IHEL=1, 7) /-1,-1,-1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  13),IHEL=1, 7) /-1,-1,-1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  14),IHEL=1, 7) /-1,-1,-1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  15),IHEL=1, 7) /-1,-1,-1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  16),IHEL=1, 7) /-1,-1,-1, 1, 1, 1, 1/
      DATA (NHEL(IHEL,  17),IHEL=1, 7) /-1,-1, 1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,  18),IHEL=1, 7) /-1,-1, 1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,  19),IHEL=1, 7) /-1,-1, 1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,  20),IHEL=1, 7) /-1,-1, 1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,  21),IHEL=1, 7) /-1,-1, 1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,  22),IHEL=1, 7) /-1,-1, 1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,  23),IHEL=1, 7) /-1,-1, 1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,  24),IHEL=1, 7) /-1,-1, 1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,  25),IHEL=1, 7) /-1,-1, 1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  26),IHEL=1, 7) /-1,-1, 1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  27),IHEL=1, 7) /-1,-1, 1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  28),IHEL=1, 7) /-1,-1, 1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  29),IHEL=1, 7) /-1,-1, 1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  30),IHEL=1, 7) /-1,-1, 1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  31),IHEL=1, 7) /-1,-1, 1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  32),IHEL=1, 7) /-1,-1, 1, 1, 1, 1, 1/
      DATA (NHEL(IHEL,  33),IHEL=1, 7) /-1, 1,-1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,  34),IHEL=1, 7) /-1, 1,-1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,  35),IHEL=1, 7) /-1, 1,-1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,  36),IHEL=1, 7) /-1, 1,-1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,  37),IHEL=1, 7) /-1, 1,-1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,  38),IHEL=1, 7) /-1, 1,-1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,  39),IHEL=1, 7) /-1, 1,-1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,  40),IHEL=1, 7) /-1, 1,-1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,  41),IHEL=1, 7) /-1, 1,-1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  42),IHEL=1, 7) /-1, 1,-1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  43),IHEL=1, 7) /-1, 1,-1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  44),IHEL=1, 7) /-1, 1,-1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  45),IHEL=1, 7) /-1, 1,-1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  46),IHEL=1, 7) /-1, 1,-1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  47),IHEL=1, 7) /-1, 1,-1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  48),IHEL=1, 7) /-1, 1,-1, 1, 1, 1, 1/
      DATA (NHEL(IHEL,  49),IHEL=1, 7) /-1, 1, 1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,  50),IHEL=1, 7) /-1, 1, 1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,  51),IHEL=1, 7) /-1, 1, 1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,  52),IHEL=1, 7) /-1, 1, 1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,  53),IHEL=1, 7) /-1, 1, 1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,  54),IHEL=1, 7) /-1, 1, 1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,  55),IHEL=1, 7) /-1, 1, 1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,  56),IHEL=1, 7) /-1, 1, 1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,  57),IHEL=1, 7) /-1, 1, 1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  58),IHEL=1, 7) /-1, 1, 1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  59),IHEL=1, 7) /-1, 1, 1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  60),IHEL=1, 7) /-1, 1, 1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  61),IHEL=1, 7) /-1, 1, 1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  62),IHEL=1, 7) /-1, 1, 1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  63),IHEL=1, 7) /-1, 1, 1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  64),IHEL=1, 7) /-1, 1, 1, 1, 1, 1, 1/
      DATA (NHEL(IHEL,  65),IHEL=1, 7) / 1,-1,-1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,  66),IHEL=1, 7) / 1,-1,-1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,  67),IHEL=1, 7) / 1,-1,-1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,  68),IHEL=1, 7) / 1,-1,-1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,  69),IHEL=1, 7) / 1,-1,-1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,  70),IHEL=1, 7) / 1,-1,-1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,  71),IHEL=1, 7) / 1,-1,-1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,  72),IHEL=1, 7) / 1,-1,-1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,  73),IHEL=1, 7) / 1,-1,-1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  74),IHEL=1, 7) / 1,-1,-1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  75),IHEL=1, 7) / 1,-1,-1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  76),IHEL=1, 7) / 1,-1,-1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  77),IHEL=1, 7) / 1,-1,-1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  78),IHEL=1, 7) / 1,-1,-1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  79),IHEL=1, 7) / 1,-1,-1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  80),IHEL=1, 7) / 1,-1,-1, 1, 1, 1, 1/
      DATA (NHEL(IHEL,  81),IHEL=1, 7) / 1,-1, 1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,  82),IHEL=1, 7) / 1,-1, 1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,  83),IHEL=1, 7) / 1,-1, 1,-1,-1, 1,-1/
      DATA (NHEL(IHEL,  84),IHEL=1, 7) / 1,-1, 1,-1,-1, 1, 1/
      DATA (NHEL(IHEL,  85),IHEL=1, 7) / 1,-1, 1,-1, 1,-1,-1/
      DATA (NHEL(IHEL,  86),IHEL=1, 7) / 1,-1, 1,-1, 1,-1, 1/
      DATA (NHEL(IHEL,  87),IHEL=1, 7) / 1,-1, 1,-1, 1, 1,-1/
      DATA (NHEL(IHEL,  88),IHEL=1, 7) / 1,-1, 1,-1, 1, 1, 1/
      DATA (NHEL(IHEL,  89),IHEL=1, 7) / 1,-1, 1, 1,-1,-1,-1/
      DATA (NHEL(IHEL,  90),IHEL=1, 7) / 1,-1, 1, 1,-1,-1, 1/
      DATA (NHEL(IHEL,  91),IHEL=1, 7) / 1,-1, 1, 1,-1, 1,-1/
      DATA (NHEL(IHEL,  92),IHEL=1, 7) / 1,-1, 1, 1,-1, 1, 1/
      DATA (NHEL(IHEL,  93),IHEL=1, 7) / 1,-1, 1, 1, 1,-1,-1/
      DATA (NHEL(IHEL,  94),IHEL=1, 7) / 1,-1, 1, 1, 1,-1, 1/
      DATA (NHEL(IHEL,  95),IHEL=1, 7) / 1,-1, 1, 1, 1, 1,-1/
      DATA (NHEL(IHEL,  96),IHEL=1, 7) / 1,-1, 1, 1, 1, 1, 1/
      DATA (NHEL(IHEL,  97),IHEL=1, 7) / 1, 1,-1,-1,-1,-1,-1/
      DATA (NHEL(IHEL,  98),IHEL=1, 7) / 1, 1,-1,-1,-1,-1, 1/
      DATA (NHEL(IHEL,  99),IHEL=1, 7) / 1, 1,-1,-1,-1, 1,-1/
      DATA (NHEL(IHEL, 100),IHEL=1, 7) / 1, 1,-1,-1,-1, 1, 1/
      DATA (NHEL(IHEL, 101),IHEL=1, 7) / 1, 1,-1,-1, 1,-1,-1/
      DATA (NHEL(IHEL, 102),IHEL=1, 7) / 1, 1,-1,-1, 1,-1, 1/
      DATA (NHEL(IHEL, 103),IHEL=1, 7) / 1, 1,-1,-1, 1, 1,-1/
      DATA (NHEL(IHEL, 104),IHEL=1, 7) / 1, 1,-1,-1, 1, 1, 1/
      DATA (NHEL(IHEL, 105),IHEL=1, 7) / 1, 1,-1, 1,-1,-1,-1/
      DATA (NHEL(IHEL, 106),IHEL=1, 7) / 1, 1,-1, 1,-1,-1, 1/
      DATA (NHEL(IHEL, 107),IHEL=1, 7) / 1, 1,-1, 1,-1, 1,-1/
      DATA (NHEL(IHEL, 108),IHEL=1, 7) / 1, 1,-1, 1,-1, 1, 1/
      DATA (NHEL(IHEL, 109),IHEL=1, 7) / 1, 1,-1, 1, 1,-1,-1/
      DATA (NHEL(IHEL, 110),IHEL=1, 7) / 1, 1,-1, 1, 1,-1, 1/
      DATA (NHEL(IHEL, 111),IHEL=1, 7) / 1, 1,-1, 1, 1, 1,-1/
      DATA (NHEL(IHEL, 112),IHEL=1, 7) / 1, 1,-1, 1, 1, 1, 1/
      DATA (NHEL(IHEL, 113),IHEL=1, 7) / 1, 1, 1,-1,-1,-1,-1/
      DATA (NHEL(IHEL, 114),IHEL=1, 7) / 1, 1, 1,-1,-1,-1, 1/
      DATA (NHEL(IHEL, 115),IHEL=1, 7) / 1, 1, 1,-1,-1, 1,-1/
      DATA (NHEL(IHEL, 116),IHEL=1, 7) / 1, 1, 1,-1,-1, 1, 1/
      DATA (NHEL(IHEL, 117),IHEL=1, 7) / 1, 1, 1,-1, 1,-1,-1/
      DATA (NHEL(IHEL, 118),IHEL=1, 7) / 1, 1, 1,-1, 1,-1, 1/
      DATA (NHEL(IHEL, 119),IHEL=1, 7) / 1, 1, 1,-1, 1, 1,-1/
      DATA (NHEL(IHEL, 120),IHEL=1, 7) / 1, 1, 1,-1, 1, 1, 1/
      DATA (NHEL(IHEL, 121),IHEL=1, 7) / 1, 1, 1, 1,-1,-1,-1/
      DATA (NHEL(IHEL, 122),IHEL=1, 7) / 1, 1, 1, 1,-1,-1, 1/
      DATA (NHEL(IHEL, 123),IHEL=1, 7) / 1, 1, 1, 1,-1, 1,-1/
      DATA (NHEL(IHEL, 124),IHEL=1, 7) / 1, 1, 1, 1,-1, 1, 1/
      DATA (NHEL(IHEL, 125),IHEL=1, 7) / 1, 1, 1, 1, 1,-1,-1/
      DATA (NHEL(IHEL, 126),IHEL=1, 7) / 1, 1, 1, 1, 1,-1, 1/
      DATA (NHEL(IHEL, 127),IHEL=1, 7) / 1, 1, 1, 1, 1, 1,-1/
      DATA (NHEL(IHEL, 128),IHEL=1, 7) / 1, 1, 1, 1, 1, 1, 1/
      DATA (  IC(IHEL,  1),IHEL=1, 7) / 1, 2, 3, 4, 5, 6, 7/
      DATA (IDEN(IHEL),IHEL=  1,  1) /  36/
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
      ANS(IPROC) = 0d0
      write(hel_buff,'(16i5)') (0,i=1,NEXTERNAL_REAL)
      IF (ISUM_HEL .EQ. 0 .OR. NTRY .LT. 10) THEN
          DO IHEL=1,NCOMB
             IF (GOODHEL(IHEL,IPROC) .OR. NTRY .LT. 2) THEN
                 T=ddx_epemddxg(P ,NHEL(1,IHEL),JC(1))            
               DO JJ=1,nincoming
                 IF(POL(JJ).NE.1d0.AND.
     &              NHEL(JJ,IHEL).EQ.INT(SIGN(1d0,POL(JJ)))) THEN
                   T=T*ABS(POL(JJ))
                 ELSE IF(POL(JJ).NE.1d0)THEN
                   T=T*(2d0-ABS(POL(JJ)))
                 ENDIF
               ENDDO
               ANS(IPROC)=ANS(IPROC)+T
               IF (T .NE. 0d0 .AND. .NOT.    GOODHEL(IHEL,IPROC)) THEN
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
              T=ddx_epemddxg(P ,NHEL(1,IHEL),JC(1))            
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
          XTOT=0d0
          DO IHEL=1,MAPCONFIG(0)
              XTOT=XTOT+AMP2(MAPCONFIG(IHEL))
          ENDDO
          IF (XTOT.NE.0d0) THEN
              ANS(IPROC)=ANS(IPROC)*AMP2(MAPCONFIG(ICONFIG))/XTOT
          ELSE
              ANS(IPROC)=0d0
          ENDIF
      ENDIF
      ANS(IPROC)=ANS(IPROC)/real(IDEN(IPROC))
      ENDDO
      END
       
       
      double precision FUNCTION ddx_epemddxg(P,NHEL,IC)
C  
C Generated by MadGraph II                                              
C RETURNS AMPLITUDE SQUARED SUMMED/AVG OVER COLORS
C FOR THE POINT WITH EXTERNAL LINES W(0:6,NEXTERNAL_REAL)
C  
C FOR PROCESS : d d~ -> e+ e- d d~ g  
C  
      IMPLICIT NONE
C  
C CONSTANTS
C  
      INTEGER    NGRAPHS,    NEIGEN 
      PARAMETER (NGRAPHS=  96,NEIGEN=  8) 
      include "../genps.inc"
      include "NEXTERNAL_REAL.inc"
      include "maxamps.inc"
      INTEGER    NWAVEFUNCS     , NCOLOR
      PARAMETER (NWAVEFUNCS= 106, NCOLOR=   8) 
      double precision     ZERO
      PARAMETER (ZERO=0d0)
C  
C ARGUMENTS 
C  
      double precision P(0:3,NEXTERNAL_REAL)
      INTEGER NHEL(NEXTERNAL_REAL), IC(NEXTERNAL_REAL)
C  
C LOCAL VARIABLES 
C  
      INTEGER I,J
      double complex ZTEMP
      double precision DENOM(NCOLOR), CF(NCOLOR,NCOLOR)
      double complex AMP(NGRAPHS), JAMP(NCOLOR)
      double complex W(18,NWAVEFUNCS)
C  
C GLOBAL VARIABLES
C  
      Double Precision amp2(maxamps), jamp2(0:maxamps)
      common/to_amps_ddx_epemddxg/  amp2,       jamp2
      include "../coupl.inc"
C  
C COLOR DATA
C  
      DATA Denom(1  )/            9/                                       
      DATA (CF(i,1  ),i=1  ,6  ) /    24,   -3,   21,   -6,   -8,    1/    
      DATA (CF(i,1  ),i=7  ,8  ) /     1,   10/                            
C               T[ 5, 1, 7]T[ 2, 6]                                        
      DATA Denom(2  )/            9/                                       
      DATA (CF(i,2  ),i=1  ,6  ) /    -3,   24,   -6,   21,    1,   -8/    
      DATA (CF(i,2  ),i=7  ,8  ) /    10,    1/                            
C               T[ 5, 1]T[ 2, 6, 7]                                        
      DATA Denom(3  )/            9/                                       
      DATA (CF(i,3  ),i=1  ,6  ) /    21,   -6,   24,   -3,    1,   10/    
      DATA (CF(i,3  ),i=7  ,8  ) /    -8,    1/                            
C               T[ 2, 6]T[ 5, 1, 7]                                        
      DATA Denom(4  )/            9/                                       
      DATA (CF(i,4  ),i=1  ,6  ) /    -6,   21,   -3,   24,   10,    1/    
      DATA (CF(i,4  ),i=7  ,8  ) /     1,   -8/                            
C               T[ 5, 1]T[ 2, 6, 7]                                        
      DATA Denom(5  )/            9/                                       
      DATA (CF(i,5  ),i=1  ,6  ) /    -8,    1,    1,   10,   24,   21/    
      DATA (CF(i,5  ),i=7  ,8  ) /    -3,   -6/                            
C               T[ 5, 6]T[ 2, 1, 7]                                        
      DATA Denom(6  )/            9/                                       
      DATA (CF(i,6  ),i=1  ,6  ) /     1,   -8,   10,    1,   21,   24/    
      DATA (CF(i,6  ),i=7  ,8  ) /    -6,   -3/                            
C               T[ 5, 6]T[ 2, 1, 7]                                        
      DATA Denom(7  )/            9/                                       
      DATA (CF(i,7  ),i=1  ,6  ) /     1,   10,   -8,    1,   -3,   -6/    
      DATA (CF(i,7  ),i=7  ,8  ) /    24,   21/                            
C               T[ 2, 1]T[ 5, 6, 7]                                        
      DATA Denom(8  )/            9/                                       
      DATA (CF(i,8  ),i=1  ,6  ) /    10,    1,    1,   -8,   -6,   -3/    
      DATA (CF(i,8  ),i=7  ,8  ) /    21,   24/                            
C               T[ 5, 6, 7]T[ 2, 1]                                        
C ----------
C BEGIN CODE
C ----------
      CALL IXXXXX(P(0,1   ),ZERO ,NHEL(1   ),+1*IC(1   ),W(1,1   ))        
      CALL OXXXXX(P(0,2   ),ZERO ,NHEL(2   ),-1*IC(2   ),W(1,2   ))        
      CALL IXXXXX(P(0,3   ),ZERO ,NHEL(3   ),-1*IC(3   ),W(1,3   ))        
      CALL OXXXXX(P(0,4   ),ZERO ,NHEL(4   ),+1*IC(4   ),W(1,4   ))        
      CALL OXXXXX(P(0,5   ),ZERO ,NHEL(5   ),+1*IC(5   ),W(1,5   ))        
      CALL IXXXXX(P(0,6   ),ZERO ,NHEL(6   ),-1*IC(6   ),W(1,6   ))        
      CALL VXXXXX(P(0,7   ),ZERO ,NHEL(7   ),+1*IC(7   ),W(1,7   ))        
      CALL JIOXXX(W(1,3   ),W(1,4   ),GAL ,ZERO    ,AWIDTH  ,W(1,8   ))    
      CALL FVIXXX(W(1,1   ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,9   ))     
      CALL FVOXXX(W(1,2   ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,10  ))    
      CALL JIOXXX(W(1,9   ),W(1,10  ),GG ,ZERO    ,ZERO    ,W(1,11  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,11  ),GG ,AMP(1   ))             
      CALL JIOXXX(W(1,3   ),W(1,4   ),GZL ,ZMASS   ,ZWIDTH  ,W(1,12  ))    
      CALL FVOXXX(W(1,2   ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,13  ))    
      CALL JIOXXX(W(1,9   ),W(1,13  ),GG ,ZERO    ,ZERO    ,W(1,14  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,14  ),GG ,AMP(2   ))             
      CALL FVOXXX(W(1,2   ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,15  ))     
      CALL FVOXXX(W(1,15  ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,16  ))    
      CALL JIOXXX(W(1,1   ),W(1,16  ),GG ,ZERO    ,ZERO    ,W(1,17  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,17  ),GG ,AMP(3   ))             
      CALL FVOXXX(W(1,15  ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,18  ))    
      CALL JIOXXX(W(1,1   ),W(1,18  ),GG ,ZERO    ,ZERO    ,W(1,19  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,19  ),GG ,AMP(4   ))             
      CALL FVOXXX(W(1,5   ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,20  ))     
      CALL JIOXXX(W(1,1   ),W(1,10  ),GG ,ZERO    ,ZERO    ,W(1,21  ))     
      CALL IOVXXX(W(1,6   ),W(1,20  ),W(1,21  ),GG ,AMP(5   ))             
      CALL JIOXXX(W(1,1   ),W(1,13  ),GG ,ZERO    ,ZERO    ,W(1,22  ))     
      CALL IOVXXX(W(1,6   ),W(1,20  ),W(1,22  ),GG ,AMP(6   ))             
      CALL FVOXXX(W(1,5   ),W(1,21  ),GG ,ZERO    ,ZERO    ,W(1,23  ))     
      CALL IOVXXX(W(1,6   ),W(1,23  ),W(1,7   ),GG ,AMP(7   ))             
      CALL FVOXXX(W(1,5   ),W(1,22  ),GG ,ZERO    ,ZERO    ,W(1,24  ))     
      CALL IOVXXX(W(1,6   ),W(1,24  ),W(1,7   ),GG ,AMP(8   ))             
      CALL FVOXXX(W(1,10  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,25  ))     
      CALL JIOXXX(W(1,1   ),W(1,25  ),GG ,ZERO    ,ZERO    ,W(1,26  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,26  ),GG ,AMP(9   ))             
      CALL FVOXXX(W(1,13  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,27  ))     
      CALL JIOXXX(W(1,1   ),W(1,27  ),GG ,ZERO    ,ZERO    ,W(1,28  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,28  ),GG ,AMP(10  ))             
      CALL JVVXXX(W(1,7   ),W(1,21  ),G ,ZERO    ,ZERO    ,W(1,29  ))      
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,29  ),GG ,AMP(11  ))             
      CALL JVVXXX(W(1,7   ),W(1,22  ),G ,ZERO    ,ZERO    ,W(1,30  ))      
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,30  ),GG ,AMP(12  ))             
      CALL FVIXXX(W(1,9   ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,31  ))    
      CALL JIOXXX(W(1,31  ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,32  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,32  ),GG ,AMP(13  ))             
      CALL FVIXXX(W(1,9   ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,33  ))    
      CALL JIOXXX(W(1,33  ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,34  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,34  ),GG ,AMP(14  ))             
      CALL FVIXXX(W(1,1   ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,35  ))    
      CALL JIOXXX(W(1,35  ),W(1,15  ),GG ,ZERO    ,ZERO    ,W(1,36  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,36  ),GG ,AMP(15  ))             
      CALL FVIXXX(W(1,1   ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,37  ))    
      CALL JIOXXX(W(1,37  ),W(1,15  ),GG ,ZERO    ,ZERO    ,W(1,38  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,38  ),GG ,AMP(16  ))             
      CALL JIOXXX(W(1,35  ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,39  ))     
      CALL IOVXXX(W(1,6   ),W(1,20  ),W(1,39  ),GG ,AMP(17  ))             
      CALL JIOXXX(W(1,37  ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,40  ))     
      CALL IOVXXX(W(1,6   ),W(1,20  ),W(1,40  ),GG ,AMP(18  ))             
      CALL FVOXXX(W(1,5   ),W(1,39  ),GG ,ZERO    ,ZERO    ,W(1,41  ))     
      CALL IOVXXX(W(1,6   ),W(1,41  ),W(1,7   ),GG ,AMP(19  ))             
      CALL FVOXXX(W(1,5   ),W(1,40  ),GG ,ZERO    ,ZERO    ,W(1,42  ))     
      CALL IOVXXX(W(1,6   ),W(1,42  ),W(1,7   ),GG ,AMP(20  ))             
      CALL FVIXXX(W(1,35  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,43  ))     
      CALL JIOXXX(W(1,43  ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,44  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,44  ),GG ,AMP(21  ))             
      CALL FVIXXX(W(1,37  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,45  ))     
      CALL JIOXXX(W(1,45  ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,46  ))     
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,46  ),GG ,AMP(22  ))             
      CALL JVVXXX(W(1,7   ),W(1,39  ),G ,ZERO    ,ZERO    ,W(1,47  ))      
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,47  ),GG ,AMP(23  ))             
      CALL JVVXXX(W(1,7   ),W(1,40  ),G ,ZERO    ,ZERO    ,W(1,48  ))      
      CALL IOVXXX(W(1,6   ),W(1,5   ),W(1,48  ),GG ,AMP(24  ))             
      CALL FVOXXX(W(1,5   ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,49  ))    
      CALL JIOXXX(W(1,9   ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,50  ))     
      CALL IOVXXX(W(1,6   ),W(1,49  ),W(1,50  ),GG ,AMP(25  ))             
      CALL FVOXXX(W(1,5   ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,51  ))    
      CALL IOVXXX(W(1,6   ),W(1,51  ),W(1,50  ),GG ,AMP(26  ))             
      CALL JIOXXX(W(1,1   ),W(1,15  ),GG ,ZERO    ,ZERO    ,W(1,52  ))     
      CALL IOVXXX(W(1,6   ),W(1,49  ),W(1,52  ),GG ,AMP(27  ))             
      CALL IOVXXX(W(1,6   ),W(1,51  ),W(1,52  ),GG ,AMP(28  ))             
      CALL JIOXXX(W(1,1   ),W(1,2   ),GG ,ZERO    ,ZERO    ,W(1,53  ))     
      CALL FVOXXX(W(1,20  ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,54  ))    
      CALL IOVXXX(W(1,6   ),W(1,54  ),W(1,53  ),GG ,AMP(29  ))             
      CALL FVOXXX(W(1,20  ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,55  ))    
      CALL IOVXXX(W(1,6   ),W(1,55  ),W(1,53  ),GG ,AMP(30  ))             
      CALL FVOXXX(W(1,49  ),W(1,53  ),GG ,ZERO    ,ZERO    ,W(1,56  ))     
      CALL IOVXXX(W(1,6   ),W(1,56  ),W(1,7   ),GG ,AMP(31  ))             
      CALL FVOXXX(W(1,51  ),W(1,53  ),GG ,ZERO    ,ZERO    ,W(1,57  ))     
      CALL IOVXXX(W(1,6   ),W(1,57  ),W(1,7   ),GG ,AMP(32  ))             
      CALL JVVXXX(W(1,7   ),W(1,53  ),G ,ZERO    ,ZERO    ,W(1,58  ))      
      CALL IOVXXX(W(1,6   ),W(1,49  ),W(1,58  ),GG ,AMP(33  ))             
      CALL IOVXXX(W(1,6   ),W(1,51  ),W(1,58  ),GG ,AMP(34  ))             
      CALL FVOXXX(W(1,49  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,59  ))     
      CALL IOVXXX(W(1,6   ),W(1,59  ),W(1,53  ),GG ,AMP(35  ))             
      CALL FVOXXX(W(1,51  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,60  ))     
      CALL IOVXXX(W(1,6   ),W(1,60  ),W(1,53  ),GG ,AMP(36  ))             
      CALL FVOXXX(W(1,5   ),W(1,50  ),GG ,ZERO    ,ZERO    ,W(1,61  ))     
      CALL IOVXXX(W(1,6   ),W(1,61  ),W(1,8   ),GAD ,AMP(37  ))            
      CALL IOVXXX(W(1,6   ),W(1,61  ),W(1,12  ),GZD ,AMP(38  ))            
      CALL FVOXXX(W(1,5   ),W(1,52  ),GG ,ZERO    ,ZERO    ,W(1,62  ))     
      CALL IOVXXX(W(1,6   ),W(1,62  ),W(1,8   ),GAD ,AMP(39  ))            
      CALL IOVXXX(W(1,6   ),W(1,62  ),W(1,12  ),GZD ,AMP(40  ))            
      CALL FVOXXX(W(1,20  ),W(1,53  ),GG ,ZERO    ,ZERO    ,W(1,63  ))     
      CALL IOVXXX(W(1,6   ),W(1,63  ),W(1,8   ),GAD ,AMP(41  ))            
      CALL IOVXXX(W(1,6   ),W(1,63  ),W(1,12  ),GZD ,AMP(42  ))            
      CALL FVOXXX(W(1,5   ),W(1,53  ),GG ,ZERO    ,ZERO    ,W(1,64  ))     
      CALL FVOXXX(W(1,64  ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,65  ))    
      CALL IOVXXX(W(1,6   ),W(1,65  ),W(1,7   ),GG ,AMP(43  ))             
      CALL FVOXXX(W(1,64  ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,66  ))    
      CALL IOVXXX(W(1,6   ),W(1,66  ),W(1,7   ),GG ,AMP(44  ))             
      CALL FVOXXX(W(1,5   ),W(1,58  ),GG ,ZERO    ,ZERO    ,W(1,67  ))     
      CALL IOVXXX(W(1,6   ),W(1,67  ),W(1,8   ),GAD ,AMP(45  ))            
      CALL IOVXXX(W(1,6   ),W(1,67  ),W(1,12  ),GZD ,AMP(46  ))            
      CALL FVOXXX(W(1,64  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,68  ))     
      CALL IOVXXX(W(1,6   ),W(1,68  ),W(1,8   ),GAD ,AMP(47  ))            
      CALL IOVXXX(W(1,6   ),W(1,68  ),W(1,12  ),GZD ,AMP(48  ))            
      CALL JIOXXX(W(1,9   ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,69  ))     
      CALL FVOXXX(W(1,2   ),W(1,69  ),GG ,ZERO    ,ZERO    ,W(1,70  ))     
      CALL IOVXXX(W(1,6   ),W(1,70  ),W(1,8   ),GAD ,AMP(49  ))            
      CALL IOVXXX(W(1,6   ),W(1,70  ),W(1,12  ),GZD ,AMP(50  ))            
      CALL JIOXXX(W(1,1   ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,71  ))     
      CALL FVOXXX(W(1,15  ),W(1,71  ),GG ,ZERO    ,ZERO    ,W(1,72  ))     
      CALL IOVXXX(W(1,6   ),W(1,72  ),W(1,8   ),GAD ,AMP(51  ))            
      CALL IOVXXX(W(1,6   ),W(1,72  ),W(1,12  ),GZD ,AMP(52  ))            
      CALL JIOXXX(W(1,1   ),W(1,20  ),GG ,ZERO    ,ZERO    ,W(1,73  ))     
      CALL FVOXXX(W(1,2   ),W(1,73  ),GG ,ZERO    ,ZERO    ,W(1,74  ))     
      CALL IOVXXX(W(1,6   ),W(1,74  ),W(1,8   ),GAD ,AMP(53  ))            
      CALL IOVXXX(W(1,6   ),W(1,74  ),W(1,12  ),GZD ,AMP(54  ))            
      CALL FVOXXX(W(1,2   ),W(1,71  ),GG ,ZERO    ,ZERO    ,W(1,75  ))     
      CALL FVOXXX(W(1,75  ),W(1,8   ),GAD ,ZERO    ,ZERO    ,W(1,76  ))    
      CALL IOVXXX(W(1,6   ),W(1,76  ),W(1,7   ),GG ,AMP(55  ))             
      CALL FVOXXX(W(1,75  ),W(1,12  ),GZD ,ZERO    ,ZERO    ,W(1,77  ))    
      CALL IOVXXX(W(1,6   ),W(1,77  ),W(1,7   ),GG ,AMP(56  ))             
      CALL FVOXXX(W(1,75  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,78  ))     
      CALL IOVXXX(W(1,6   ),W(1,78  ),W(1,8   ),GAD ,AMP(57  ))            
      CALL IOVXXX(W(1,6   ),W(1,78  ),W(1,12  ),GZD ,AMP(58  ))            
      CALL JVVXXX(W(1,7   ),W(1,71  ),G ,ZERO    ,ZERO    ,W(1,79  ))      
      CALL FVOXXX(W(1,2   ),W(1,79  ),GG ,ZERO    ,ZERO    ,W(1,80  ))     
      CALL IOVXXX(W(1,6   ),W(1,80  ),W(1,8   ),GAD ,AMP(59  ))            
      CALL IOVXXX(W(1,6   ),W(1,80  ),W(1,12  ),GZD ,AMP(60  ))            
      CALL IOVXXX(W(1,6   ),W(1,10  ),W(1,69  ),GG ,AMP(61  ))             
      CALL IOVXXX(W(1,6   ),W(1,13  ),W(1,69  ),GG ,AMP(62  ))             
      CALL IOVXXX(W(1,6   ),W(1,16  ),W(1,71  ),GG ,AMP(63  ))             
      CALL IOVXXX(W(1,6   ),W(1,18  ),W(1,71  ),GG ,AMP(64  ))             
      CALL IOVXXX(W(1,6   ),W(1,10  ),W(1,73  ),GG ,AMP(65  ))             
      CALL IOVXXX(W(1,6   ),W(1,13  ),W(1,73  ),GG ,AMP(66  ))             
      CALL FVOXXX(W(1,10  ),W(1,71  ),GG ,ZERO    ,ZERO    ,W(1,81  ))     
      CALL IOVXXX(W(1,6   ),W(1,81  ),W(1,7   ),GG ,AMP(67  ))             
      CALL FVOXXX(W(1,13  ),W(1,71  ),GG ,ZERO    ,ZERO    ,W(1,82  ))     
      CALL IOVXXX(W(1,6   ),W(1,82  ),W(1,7   ),GG ,AMP(68  ))             
      CALL IOVXXX(W(1,6   ),W(1,25  ),W(1,71  ),GG ,AMP(69  ))             
      CALL IOVXXX(W(1,6   ),W(1,27  ),W(1,71  ),GG ,AMP(70  ))             
      CALL IOVXXX(W(1,6   ),W(1,10  ),W(1,79  ),GG ,AMP(71  ))             
      CALL IOVXXX(W(1,6   ),W(1,13  ),W(1,79  ),GG ,AMP(72  ))             
      CALL JIOXXX(W(1,31  ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,83  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,83  ),GG ,AMP(73  ))             
      CALL JIOXXX(W(1,33  ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,84  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,84  ),GG ,AMP(74  ))             
      CALL JIOXXX(W(1,35  ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,85  ))     
      CALL IOVXXX(W(1,6   ),W(1,15  ),W(1,85  ),GG ,AMP(75  ))             
      CALL JIOXXX(W(1,37  ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,86  ))     
      CALL IOVXXX(W(1,6   ),W(1,15  ),W(1,86  ),GG ,AMP(76  ))             
      CALL JIOXXX(W(1,35  ),W(1,20  ),GG ,ZERO    ,ZERO    ,W(1,87  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,87  ),GG ,AMP(77  ))             
      CALL JIOXXX(W(1,37  ),W(1,20  ),GG ,ZERO    ,ZERO    ,W(1,88  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,88  ),GG ,AMP(78  ))             
      CALL FVOXXX(W(1,2   ),W(1,85  ),GG ,ZERO    ,ZERO    ,W(1,89  ))     
      CALL IOVXXX(W(1,6   ),W(1,89  ),W(1,7   ),GG ,AMP(79  ))             
      CALL FVOXXX(W(1,2   ),W(1,86  ),GG ,ZERO    ,ZERO    ,W(1,90  ))     
      CALL IOVXXX(W(1,6   ),W(1,90  ),W(1,7   ),GG ,AMP(80  ))             
      CALL JIOXXX(W(1,43  ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,91  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,91  ),GG ,AMP(81  ))             
      CALL JIOXXX(W(1,45  ),W(1,5   ),GG ,ZERO    ,ZERO    ,W(1,92  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,92  ),GG ,AMP(82  ))             
      CALL JVVXXX(W(1,7   ),W(1,85  ),G ,ZERO    ,ZERO    ,W(1,93  ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,93  ),GG ,AMP(83  ))             
      CALL JVVXXX(W(1,7   ),W(1,86  ),G ,ZERO    ,ZERO    ,W(1,94  ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,94  ),GG ,AMP(84  ))             
      CALL JIOXXX(W(1,9   ),W(1,49  ),GG ,ZERO    ,ZERO    ,W(1,95  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,95  ),GG ,AMP(85  ))             
      CALL JIOXXX(W(1,9   ),W(1,51  ),GG ,ZERO    ,ZERO    ,W(1,96  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,96  ),GG ,AMP(86  ))             
      CALL JIOXXX(W(1,1   ),W(1,49  ),GG ,ZERO    ,ZERO    ,W(1,97  ))     
      CALL IOVXXX(W(1,6   ),W(1,15  ),W(1,97  ),GG ,AMP(87  ))             
      CALL JIOXXX(W(1,1   ),W(1,51  ),GG ,ZERO    ,ZERO    ,W(1,98  ))     
      CALL IOVXXX(W(1,6   ),W(1,15  ),W(1,98  ),GG ,AMP(88  ))             
      CALL JIOXXX(W(1,1   ),W(1,54  ),GG ,ZERO    ,ZERO    ,W(1,99  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,99  ),GG ,AMP(89  ))             
      CALL JIOXXX(W(1,1   ),W(1,55  ),GG ,ZERO    ,ZERO    ,W(1,100 ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,100 ),GG ,AMP(90  ))             
      CALL FVOXXX(W(1,2   ),W(1,97  ),GG ,ZERO    ,ZERO    ,W(1,101 ))     
      CALL IOVXXX(W(1,6   ),W(1,101 ),W(1,7   ),GG ,AMP(91  ))             
      CALL FVOXXX(W(1,2   ),W(1,98  ),GG ,ZERO    ,ZERO    ,W(1,102 ))     
      CALL IOVXXX(W(1,6   ),W(1,102 ),W(1,7   ),GG ,AMP(92  ))             
      CALL JIOXXX(W(1,1   ),W(1,59  ),GG ,ZERO    ,ZERO    ,W(1,103 ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,103 ),GG ,AMP(93  ))             
      CALL JIOXXX(W(1,1   ),W(1,60  ),GG ,ZERO    ,ZERO    ,W(1,104 ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,104 ),GG ,AMP(94  ))             
      CALL JVVXXX(W(1,7   ),W(1,97  ),G ,ZERO    ,ZERO    ,W(1,105 ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,105 ),GG ,AMP(95  ))             
      CALL JVVXXX(W(1,7   ),W(1,98  ),G ,ZERO    ,ZERO    ,W(1,106 ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,106 ),GG ,AMP(96  ))             
      JAMP(   1) = -AMP(   1)-AMP(   2)-AMP(  11)-AMP(  12)-AMP(  13)
     &             -AMP(  14)-AMP(  21)-AMP(  22)-AMP(  23)-AMP(  24)
     &             -AMP(  25)-AMP(  26)-AMP(  33)-AMP(  34)-AMP(  37)
     &             -AMP(  38)-AMP(  45)-AMP(  46)
      JAMP(   2) = -AMP(   3)-AMP(   4)-AMP(   9)-AMP(  10)+AMP(  11)
     &             +AMP(  12)-AMP(  15)-AMP(  16)+AMP(  23)+AMP(  24)
     &             -AMP(  27)-AMP(  28)+AMP(  33)+AMP(  34)-AMP(  39)
     &             -AMP(  40)+AMP(  45)+AMP(  46)
      JAMP(   3) = -AMP(   5)-AMP(   6)-AMP(  17)-AMP(  18)-AMP(  29)
     &             -AMP(  30)-AMP(  35)-AMP(  36)-AMP(  41)-AMP(  42)
      JAMP(   4) = -AMP(   7)-AMP(   8)-AMP(  19)-AMP(  20)-AMP(  31)
     &             -AMP(  32)-AMP(  43)-AMP(  44)-AMP(  47)-AMP(  48)
      JAMP(   5) = +AMP(  49)+AMP(  50)+AMP(  61)+AMP(  62)+AMP(  71)
     &             +AMP(  72)+AMP(  73)+AMP(  74)+AMP(  81)+AMP(  82)
     &             +AMP(  83)+AMP(  84)+AMP(  85)+AMP(  86)+AMP(  95)
     &             +AMP(  96)
      JAMP(   6) = +AMP(  51)+AMP(  52)+AMP(  59)+AMP(  60)+AMP(  63)
     &             +AMP(  64)+AMP(  69)+AMP(  70)+AMP(  75)+AMP(  76)
     &             +AMP(  87)+AMP(  88)
      JAMP(   7) = +AMP(  53)+AMP(  54)+AMP(  65)+AMP(  66)-AMP(  71)
     &             -AMP(  72)+AMP(  77)+AMP(  78)-AMP(  83)-AMP(  84)
     &             +AMP(  89)+AMP(  90)+AMP(  93)+AMP(  94)-AMP(  95)
     &             -AMP(  96)
      JAMP(   8) = +AMP(  55)+AMP(  56)+AMP(  57)+AMP(  58)-AMP(  59)
     &             -AMP(  60)+AMP(  67)+AMP(  68)+AMP(  79)+AMP(  80)
     &             +AMP(  91)+AMP(  92)
      ddx_epemddxg = 0.d0 
      DO I = 1, NCOLOR
          ZTEMP = (0.d0,0.d0)
          DO J = 1, NCOLOR
              ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
          ENDDO
          ddx_epemddxg =ddx_epemddxg+ZTEMP*conjg(JAMP(I))/DENOM(I)   
      ENDDO
      Do I = 1, NGRAPHS
          amp2(i)=amp2(i)+amp(i)*conjg(amp(i))
      Enddo
      Do I = 1, NCOLOR
          Jamp2(i)=Jamp2(i)+Jamp(i)*conjg(Jamp(i))
      Enddo
C      CALL GAUGECHECK(JAMP,ZTEMP,EIGEN_VEC,EIGEN_VAL,NCOLOR,NEIGEN) 
      END
       
       
