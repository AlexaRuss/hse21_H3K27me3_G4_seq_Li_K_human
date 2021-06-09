if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ChIPseeker")
n

BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
a
install.packages(org.Hs.eg.db) 

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("org.Hs.eg.db")
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

library(ggplot2)
library(dplyr)
library(tidyr)   
library(tibble)

#NAME <- 'G4_seq_Li_K'
NAME <- 'H3K27me3_H9.intersect_with_G4_seq_Li_K'
BED_FN <- paste0('C:/Users/Home/Desktop/Bioinformatics/Project Bioinf/', NAME, '.bed')

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0('C:/Users/Home/Desktop/Bioinformatics/Project Bioinf/', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()
