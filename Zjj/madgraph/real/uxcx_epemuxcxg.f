      SUBROUTINE Suxcx_epemuxcxg(P1,ANS)
C  
C Generated by MadGraph II                                              
C RETURNS AMPLITUDE SQUARED SUMMED/AVG OVER COLORS
C AND HELICITIES
C FOR THE POINT IN PHASE SPACE P(0:3,NEXTERNAL_REAL)
C  
C FOR PROCESS : u~ c~ -> e+ e- u~ c~ g  
C  
C Crossing   1 is u~ c~ -> e+ e- u~ c~ g  
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
      double precision uxcx_epemuxcxg
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
      common/to_amps_uxcx_epemuxcxg/  amp2,       jamp2

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
      DATA NGRAPHS /   48/          
      DATA jamp2(0) /   4/          
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
                 T=uxcx_epemuxcxg(P ,NHEL(1,IHEL),JC(1))            
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
              T=uxcx_epemuxcxg(P ,NHEL(1,IHEL),JC(1))            
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
       
       
      double precision FUNCTION uxcx_epemuxcxg(P,NHEL,IC)
C  
C Generated by MadGraph II                                              
C RETURNS AMPLITUDE SQUARED SUMMED/AVG OVER COLORS
C FOR THE POINT WITH EXTERNAL LINES W(0:6,NEXTERNAL_REAL)
C  
C FOR PROCESS : u~ c~ -> e+ e- u~ c~ g  
C  
      IMPLICIT NONE
C  
C CONSTANTS
C  
      INTEGER    NGRAPHS,    NEIGEN 
      PARAMETER (NGRAPHS=  48,NEIGEN=  4) 
      include "../genps.inc"
      include "NEXTERNAL_REAL.inc"
      include "maxamps.inc"
      INTEGER    NWAVEFUNCS     , NCOLOR
      PARAMETER (NWAVEFUNCS=  68, NCOLOR=   4) 
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
      common/to_amps_uxcx_epemuxcxg/  amp2,       jamp2
      include "../coupl.inc"
C  
C COLOR DATA
C  
      DATA Denom(1  )/            3/                                       
      DATA (CF(i,1  ),i=1  ,4  ) /     8,   -2,   -1,    7/                
C               T[ 2, 5]T[ 1, 6, 7]                                        
      DATA Denom(2  )/            3/                                       
      DATA (CF(i,2  ),i=1  ,4  ) /    -2,    8,    7,   -1/                
C               T[ 1, 6]T[ 2, 5, 7]                                        
      DATA Denom(3  )/            3/                                       
      DATA (CF(i,3  ),i=1  ,4  ) /    -1,    7,    8,   -2/                
C               T[ 2, 5, 7]T[ 1, 6]                                        
      DATA Denom(4  )/            3/                                       
      DATA (CF(i,4  ),i=1  ,4  ) /     7,   -1,   -2,    8/                
C               T[ 2, 5]T[ 1, 6, 7]                                        
C ----------
C BEGIN CODE
C ----------
      CALL OXXXXX(P(0,1   ),ZERO ,NHEL(1   ),-1*IC(1   ),W(1,1   ))        
      CALL OXXXXX(P(0,2   ),ZERO ,NHEL(2   ),-1*IC(2   ),W(1,2   ))        
      CALL IXXXXX(P(0,3   ),ZERO ,NHEL(3   ),-1*IC(3   ),W(1,3   ))        
      CALL OXXXXX(P(0,4   ),ZERO ,NHEL(4   ),+1*IC(4   ),W(1,4   ))        
      CALL IXXXXX(P(0,5   ),ZERO ,NHEL(5   ),-1*IC(5   ),W(1,5   ))        
      CALL IXXXXX(P(0,6   ),ZERO ,NHEL(6   ),-1*IC(6   ),W(1,6   ))        
      CALL VXXXXX(P(0,7   ),ZERO ,NHEL(7   ),+1*IC(7   ),W(1,7   ))        
      CALL JIOXXX(W(1,3   ),W(1,4   ),GAL ,ZERO    ,AWIDTH  ,W(1,8   ))    
      CALL FVOXXX(W(1,1   ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,9   ))     
      CALL JIOXXX(W(1,5   ),W(1,9   ),GG ,ZERO    ,ZERO    ,W(1,10  ))     
      CALL FVOXXX(W(1,2   ),W(1,10  ),GG ,ZERO    ,ZERO    ,W(1,11  ))     
      CALL IOVXXX(W(1,6   ),W(1,11  ),W(1,8   ),GAU ,AMP(1   ))            
      CALL JIOXXX(W(1,3   ),W(1,4   ),GZL ,ZMASS   ,ZWIDTH  ,W(1,12  ))    
      CALL IOVXXX(W(1,6   ),W(1,11  ),W(1,12  ),GZU ,AMP(2   ))            
      CALL JIOXXX(W(1,5   ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,13  ))     
      CALL FVOXXX(W(1,2   ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,14  ))     
      CALL FVOXXX(W(1,14  ),W(1,13  ),GG ,ZERO    ,ZERO    ,W(1,15  ))     
      CALL IOVXXX(W(1,6   ),W(1,15  ),W(1,8   ),GAU ,AMP(3   ))            
      CALL IOVXXX(W(1,6   ),W(1,15  ),W(1,12  ),GZU ,AMP(4   ))            
      CALL FVIXXX(W(1,5   ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,16  ))     
      CALL JIOXXX(W(1,16  ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,17  ))     
      CALL FVOXXX(W(1,2   ),W(1,17  ),GG ,ZERO    ,ZERO    ,W(1,18  ))     
      CALL IOVXXX(W(1,6   ),W(1,18  ),W(1,8   ),GAU ,AMP(5   ))            
      CALL IOVXXX(W(1,6   ),W(1,18  ),W(1,12  ),GZU ,AMP(6   ))            
      CALL FVOXXX(W(1,2   ),W(1,13  ),GG ,ZERO    ,ZERO    ,W(1,19  ))     
      CALL FVOXXX(W(1,19  ),W(1,8   ),GAU ,ZERO    ,ZERO    ,W(1,20  ))    
      CALL IOVXXX(W(1,6   ),W(1,20  ),W(1,7   ),GG ,AMP(7   ))             
      CALL FVOXXX(W(1,19  ),W(1,12  ),GZU ,ZERO    ,ZERO    ,W(1,21  ))    
      CALL IOVXXX(W(1,6   ),W(1,21  ),W(1,7   ),GG ,AMP(8   ))             
      CALL FVOXXX(W(1,19  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,22  ))     
      CALL IOVXXX(W(1,6   ),W(1,22  ),W(1,8   ),GAU ,AMP(9   ))            
      CALL IOVXXX(W(1,6   ),W(1,22  ),W(1,12  ),GZU ,AMP(10  ))            
      CALL JVVXXX(W(1,7   ),W(1,13  ),G ,ZERO    ,ZERO    ,W(1,23  ))      
      CALL FVOXXX(W(1,2   ),W(1,23  ),GG ,ZERO    ,ZERO    ,W(1,24  ))     
      CALL IOVXXX(W(1,6   ),W(1,24  ),W(1,8   ),GAU ,AMP(11  ))            
      CALL IOVXXX(W(1,6   ),W(1,24  ),W(1,12  ),GZU ,AMP(12  ))            
      CALL FVOXXX(W(1,2   ),W(1,8   ),GAU ,ZERO    ,ZERO    ,W(1,25  ))    
      CALL IOVXXX(W(1,6   ),W(1,25  ),W(1,10  ),GG ,AMP(13  ))             
      CALL FVOXXX(W(1,2   ),W(1,12  ),GZU ,ZERO    ,ZERO    ,W(1,26  ))    
      CALL IOVXXX(W(1,6   ),W(1,26  ),W(1,10  ),GG ,AMP(14  ))             
      CALL FVOXXX(W(1,14  ),W(1,8   ),GAU ,ZERO    ,ZERO    ,W(1,27  ))    
      CALL IOVXXX(W(1,6   ),W(1,27  ),W(1,13  ),GG ,AMP(15  ))             
      CALL FVOXXX(W(1,14  ),W(1,12  ),GZU ,ZERO    ,ZERO    ,W(1,28  ))    
      CALL IOVXXX(W(1,6   ),W(1,28  ),W(1,13  ),GG ,AMP(16  ))             
      CALL IOVXXX(W(1,6   ),W(1,25  ),W(1,17  ),GG ,AMP(17  ))             
      CALL IOVXXX(W(1,6   ),W(1,26  ),W(1,17  ),GG ,AMP(18  ))             
      CALL FVOXXX(W(1,25  ),W(1,13  ),GG ,ZERO    ,ZERO    ,W(1,29  ))     
      CALL IOVXXX(W(1,6   ),W(1,29  ),W(1,7   ),GG ,AMP(19  ))             
      CALL FVOXXX(W(1,26  ),W(1,13  ),GG ,ZERO    ,ZERO    ,W(1,30  ))     
      CALL IOVXXX(W(1,6   ),W(1,30  ),W(1,7   ),GG ,AMP(20  ))             
      CALL FVOXXX(W(1,25  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,31  ))     
      CALL IOVXXX(W(1,6   ),W(1,31  ),W(1,13  ),GG ,AMP(21  ))             
      CALL FVOXXX(W(1,26  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,32  ))     
      CALL IOVXXX(W(1,6   ),W(1,32  ),W(1,13  ),GG ,AMP(22  ))             
      CALL IOVXXX(W(1,6   ),W(1,25  ),W(1,23  ),GG ,AMP(23  ))             
      CALL IOVXXX(W(1,6   ),W(1,26  ),W(1,23  ),GG ,AMP(24  ))             
      CALL FVOXXX(W(1,9   ),W(1,8   ),GAU ,ZERO    ,ZERO    ,W(1,33  ))    
      CALL JIOXXX(W(1,5   ),W(1,33  ),GG ,ZERO    ,ZERO    ,W(1,34  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,34  ),GG ,AMP(25  ))             
      CALL FVOXXX(W(1,9   ),W(1,12  ),GZU ,ZERO    ,ZERO    ,W(1,35  ))    
      CALL JIOXXX(W(1,5   ),W(1,35  ),GG ,ZERO    ,ZERO    ,W(1,36  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,36  ),GG ,AMP(26  ))             
      CALL FVOXXX(W(1,1   ),W(1,8   ),GAU ,ZERO    ,ZERO    ,W(1,37  ))    
      CALL JIOXXX(W(1,5   ),W(1,37  ),GG ,ZERO    ,ZERO    ,W(1,38  ))     
      CALL IOVXXX(W(1,6   ),W(1,14  ),W(1,38  ),GG ,AMP(27  ))             
      CALL FVOXXX(W(1,1   ),W(1,12  ),GZU ,ZERO    ,ZERO    ,W(1,39  ))    
      CALL JIOXXX(W(1,5   ),W(1,39  ),GG ,ZERO    ,ZERO    ,W(1,40  ))     
      CALL IOVXXX(W(1,6   ),W(1,14  ),W(1,40  ),GG ,AMP(28  ))             
      CALL JIOXXX(W(1,16  ),W(1,37  ),GG ,ZERO    ,ZERO    ,W(1,41  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,41  ),GG ,AMP(29  ))             
      CALL JIOXXX(W(1,16  ),W(1,39  ),GG ,ZERO    ,ZERO    ,W(1,42  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,42  ),GG ,AMP(30  ))             
      CALL FVOXXX(W(1,2   ),W(1,38  ),GG ,ZERO    ,ZERO    ,W(1,43  ))     
      CALL IOVXXX(W(1,6   ),W(1,43  ),W(1,7   ),GG ,AMP(31  ))             
      CALL FVOXXX(W(1,2   ),W(1,40  ),GG ,ZERO    ,ZERO    ,W(1,44  ))     
      CALL IOVXXX(W(1,6   ),W(1,44  ),W(1,7   ),GG ,AMP(32  ))             
      CALL FVOXXX(W(1,37  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,45  ))     
      CALL JIOXXX(W(1,5   ),W(1,45  ),GG ,ZERO    ,ZERO    ,W(1,46  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,46  ),GG ,AMP(33  ))             
      CALL FVOXXX(W(1,39  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,47  ))     
      CALL JIOXXX(W(1,5   ),W(1,47  ),GG ,ZERO    ,ZERO    ,W(1,48  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,48  ),GG ,AMP(34  ))             
      CALL JVVXXX(W(1,7   ),W(1,38  ),G ,ZERO    ,ZERO    ,W(1,49  ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,49  ),GG ,AMP(35  ))             
      CALL JVVXXX(W(1,7   ),W(1,40  ),G ,ZERO    ,ZERO    ,W(1,50  ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,50  ),GG ,AMP(36  ))             
      CALL FVIXXX(W(1,5   ),W(1,8   ),GAU ,ZERO    ,ZERO    ,W(1,51  ))    
      CALL JIOXXX(W(1,51  ),W(1,9   ),GG ,ZERO    ,ZERO    ,W(1,52  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,52  ),GG ,AMP(37  ))             
      CALL FVIXXX(W(1,5   ),W(1,12  ),GZU ,ZERO    ,ZERO    ,W(1,53  ))    
      CALL JIOXXX(W(1,53  ),W(1,9   ),GG ,ZERO    ,ZERO    ,W(1,54  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,54  ),GG ,AMP(38  ))             
      CALL JIOXXX(W(1,51  ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,55  ))     
      CALL IOVXXX(W(1,6   ),W(1,14  ),W(1,55  ),GG ,AMP(39  ))             
      CALL JIOXXX(W(1,53  ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,56  ))     
      CALL IOVXXX(W(1,6   ),W(1,14  ),W(1,56  ),GG ,AMP(40  ))             
      CALL FVIXXX(W(1,16  ),W(1,8   ),GAU ,ZERO    ,ZERO    ,W(1,57  ))    
      CALL JIOXXX(W(1,57  ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,58  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,58  ),GG ,AMP(41  ))             
      CALL FVIXXX(W(1,16  ),W(1,12  ),GZU ,ZERO    ,ZERO    ,W(1,59  ))    
      CALL JIOXXX(W(1,59  ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,60  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,60  ),GG ,AMP(42  ))             
      CALL FVOXXX(W(1,2   ),W(1,55  ),GG ,ZERO    ,ZERO    ,W(1,61  ))     
      CALL IOVXXX(W(1,6   ),W(1,61  ),W(1,7   ),GG ,AMP(43  ))             
      CALL FVOXXX(W(1,2   ),W(1,56  ),GG ,ZERO    ,ZERO    ,W(1,62  ))     
      CALL IOVXXX(W(1,6   ),W(1,62  ),W(1,7   ),GG ,AMP(44  ))             
      CALL FVIXXX(W(1,51  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,63  ))     
      CALL JIOXXX(W(1,63  ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,64  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,64  ),GG ,AMP(45  ))             
      CALL FVIXXX(W(1,53  ),W(1,7   ),GG ,ZERO    ,ZERO    ,W(1,65  ))     
      CALL JIOXXX(W(1,65  ),W(1,1   ),GG ,ZERO    ,ZERO    ,W(1,66  ))     
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,66  ),GG ,AMP(46  ))             
      CALL JVVXXX(W(1,7   ),W(1,55  ),G ,ZERO    ,ZERO    ,W(1,67  ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,67  ),GG ,AMP(47  ))             
      CALL JVVXXX(W(1,7   ),W(1,56  ),G ,ZERO    ,ZERO    ,W(1,68  ))      
      CALL IOVXXX(W(1,6   ),W(1,2   ),W(1,68  ),GG ,AMP(48  ))             
      JAMP(   1) = -AMP(   1)-AMP(   2)-AMP(  13)-AMP(  14)+AMP(  23)
     &             +AMP(  24)-AMP(  25)-AMP(  26)-AMP(  33)-AMP(  34)
     &             +AMP(  35)+AMP(  36)-AMP(  37)-AMP(  38)+AMP(  47)
     &             +AMP(  48)
      JAMP(   2) = -AMP(   3)-AMP(   4)-AMP(  11)-AMP(  12)-AMP(  15)
     &             -AMP(  16)-AMP(  21)-AMP(  22)-AMP(  27)-AMP(  28)
     &             -AMP(  39)-AMP(  40)
      JAMP(   3) = -AMP(   5)-AMP(   6)-AMP(  17)-AMP(  18)-AMP(  23)
     &             -AMP(  24)-AMP(  29)-AMP(  30)-AMP(  35)-AMP(  36)
     &             -AMP(  41)-AMP(  42)-AMP(  45)-AMP(  46)-AMP(  47)
     &             -AMP(  48)
      JAMP(   4) = -AMP(   7)-AMP(   8)-AMP(   9)-AMP(  10)+AMP(  11)
     &             +AMP(  12)-AMP(  19)-AMP(  20)-AMP(  31)-AMP(  32)
     &             -AMP(  43)-AMP(  44)
      uxcx_epemuxcxg = 0.d0 
      DO I = 1, NCOLOR
          ZTEMP = (0.d0,0.d0)
          DO J = 1, NCOLOR
              ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
          ENDDO
          uxcx_epemuxcxg =uxcx_epemuxcxg+ZTEMP*conjg(JAMP(I))/DENOM(I)   
      ENDDO
      Do I = 1, NGRAPHS
          amp2(i)=amp2(i)+amp(i)*conjg(amp(i))
      Enddo
      Do I = 1, NCOLOR
          Jamp2(i)=Jamp2(i)+Jamp(i)*conjg(Jamp(i))
      Enddo
C      CALL GAUGECHECK(JAMP,ZTEMP,EIGEN_VEC,EIGEN_VAL,NCOLOR,NEIGEN) 
      END
       
       
