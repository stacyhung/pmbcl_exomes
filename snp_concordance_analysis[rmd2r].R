#' ---	
#' title: "PMBCL exome analysis"	
#' author: "Stacy Hung"	
#' date: "February 26, 2017"	
#' output: html_document	
#' ---	
#'   	
#' 	
	
setwd("~/Documents/projects/PMBCL_exomes/batch2_20170217/varScan/all.singles.varscan/")	
singles_data <- read.table("all.snps.rs_id.cut.txt", sep="\t", header=TRUE)	
	
# coverage is a problem for some of the samples, so filter for SNPs that have > 30x coverage in *all* cases	
singles_data.filtered <- subset(singles_data, singles_data$GEN.0..DP > 30)	
	
# remove duplicates (e.g. due to multiple annotations, etc.)	
singles_data.filtered.unique <- unique(singles_data.filtered)	
	
# get table for snps across patients	
rs_counts <- t(table(singles_data.filtered.unique$SAMPLE, singles_data.filtered.unique$ID))	
	
# there are 186662 rows in this matrix	
write.table(rs_counts, "rs_counts.txt", sep = "\t", quote = FALSE, row.names = FALSE)	
	
# heatmap.2 function from gplots package	
library(gplots)	
my_palette <- colorRampPalette(c("white", "blue", "blue"))(n = 2)	
	
# plot heatmap in increments of 10,000 rows at a time to 186,662...	
# 1:10000	
# 10001:20000	
# ...	
	
heatmap.2(rs_counts[176662:186662,], 	
          col=my_palette, 	
          labRow="", 	
          trace="none", 	
          key=F, 	
          dendrogram = "column",	
          sepcolor="white", colsep = c(1,2,3,4),	
          cexCol = 1	
          )	
#' 	
