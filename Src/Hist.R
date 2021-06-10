library(ggplot2)
library(dplyr)
library(tidyr)   
library(tibble)  

###

#NAME <- 'H3K27me3_H9.ENCFF851PCG.hg19'
#NAME <- 'H3K27me3_H9.ENCFF680AKW.hg38'
#NAME <- 'H3K27me3_H9.ENCFF680AKW.hg19'
#NAME <- 'H3K27me3_H9.ENCFF851PCG.hg38'

###

bed_df <- read.delim(paste0('~/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)


bed_df <- read.delim(paste0('~/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)
nrow(bed_df)

bed_df <- bed_df %>%
  arrange(-len) %>%
  filter(len < 5000)
nrow(bed_df)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()

bed_df %>%
  select(-len) %>%
  write.table(file='C:/Users/Home/Desktop/Bioinformatics/Project Bioinf/H3K27me3_H9.ENCFF680AKW.hg19.filtered.bed',
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)

