
library(tidyverse)
library(sangerseqR)
library(plotly)

#########################################################################
seq1 <- sangerseq(read.abif('HaganSarahSeq/1_HHSB_A04.ab1'))



  chromatogram(seq1, width = 80, height = 3, trim5 = 0, 
             trim3 =600, showcalls = 'primary' )
 

###########################################################################
seq2 <- sangerseq(read.abif('HaganSarahSeq/2_HHSB_B04.ab1'))



chromatogram(seq2, width = 80, height = 3, trim5 = 0, 
             trim3 =400, showcalls = 'primary' )
########################################################################
seq3 <- sangerseq(read.abif('HaganSarahSeq/3_HHSB_C04.ab1'))



chromatogram(seq3, width = 80, height = 3, trim5 = 0, 
             trim3 =700, showcalls = 'primary' )


#######################################################################
seq4 <- sangerseq(read.abif('HaganSarahSeq/4_HHSB_D04.ab1'))



chromatogram(seq4, width = 80, height = 3, trim5 = 0, 
             trim3 =500, showcalls = 'both' )
#######################################################################
seq5 <- sangerseq(read.abif('HaganSarahSeq/5_HHSB_E04.ab1'))



chromatogram(seq5, width = 80, height = 3, trim5 = 0, 
             trim3 =600, showcalls = 'primary' )
#######################################################################
seq7 <- sangerseq(read.abif('HaganSarahSeq/7_HHSB_F04.ab1'))



chromatogram(seq7, width = 80, height = 3, trim5 = 0, 
             trim3 =550, showcalls = 'primary' )
#######################################################################
seq8 <- sangerseq(read.abif('HaganSarahSeq/8_HHSB_G04.ab1'))



chromatogram(seq8, width = 80, height = 3, trim5 = 0, 
             trim3 =640, showcalls = 'primary' )

#######################################################################
seq9 <- sangerseq(read.abif('HaganSarahSeq/9_HHSB_H04.ab1'))



chromatogram(seq9, width = 80, height = 3, trim5 = 0, 
             trim3 =600, showcalls = 'primary' )
#######################################################################
seq10 <- sangerseq(read.abif('HaganSarahSeq/10_HHSB_A05.ab1'))



chromatogram(seq10, width = 80, height = 3, trim5 = 0, 
             trim3 =370, showcalls = 'primary' )
#######################################################################
seq12 <- sangerseq(read.abif('HaganSarahSeq/12_HHSB_B05.ab1'))



chromatogram(seq12, width = 80, height = 3, trim5 = 0, 
             trim3 =370, showcalls = 'primary' )
#######################################################################
seq13 <- sangerseq(read.abif('HaganSarahSeq/13_HHSB_C05.ab1'))



chromatogram(seq13, width = 80, height = 3, trim5 = 0, 
             trim3 =370, showcalls = 'primary' )

#######################################################################
seq14 <- sangerseq(read.abif('HaganSarahSeq/14_HHSB_D05.ab1'))



chromatogram(seq14, width = 80, height = 3, trim5 = 0, 
             trim3 =370, showcalls = 'primary' )
#######################################################################
seq15 <- sangerseq(read.abif('HaganSarahSeq/15_HHSB_E05.ab1'))



chromatogram(seq15, width = 80, height = 3, trim5 = 0, 
             trim3 =270, showcalls = 'primary' )
#######################################################################
seq16 <- sangerseq(read.abif('HaganSarahSeq/16_HHSB_F05.ab1'))



chromatogram(seq16, width = 80, height = 3, trim5 = 0, 
             trim3 =910, showcalls = 'primary' )
#######################################################################
seq17 <- sangerseq(read.abif('HaganSarahSeq/17_HHSB_G05.ab1'))



chromatogram(seq17, width = 80, height = 3, trim5 = 0, 
             trim3 =370, showcalls = 'primary' )

#######################################################################
seq19 <- sangerseq(read.abif('HaganSarahSeq/19_HHSB_H05.ab1'))



chromatogram(seq19, width = 80, height = 3, trim5 = 0, 
             trim3 =370, showcalls = 'primary' )
#######################################################################
seq20 <- sangerseq(read.abif('HaganSarahSeq/20_HHSB_A06.ab1'))



chromatogram(seq20, width = 80, height = 3, trim5 = 0, 
             trim3 =420, showcalls = 'primary' )
