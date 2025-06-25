library(ggplot2)
library(dplyr)
library(pheatmap)
setwd("E:/1-Analysis_Record/Eimeria-Genome/RNAseq/rsem/")
df <- read.table("input-expression.txt",header = T,row.names = 1)

anno <- read.table("anno.txt",header = T,row.names = 1)
anno <- as.data.frame(anno)
anno$Type
ann_colors <- list(
  Type = c(Hypothetical_SAGs = "#2E7D32", GRA = "#0277BD", ROP = "#E57373", MIC = "#5D4037", RON = "#EF6C00"))
p1 <- pheatmap(as.matrix(df),
               show_colnames = T, show_rownames = F,
               annotation_row = anno,
               annotation_colors = ann_colors,
               annotation_names_row = T,
               cluster_cols = F,
               border_color = "NA",
               cellwidth =20, 
               #cellheight=10,
               treeheight_row = 20,
               treeheight_col = 20,
               color = colorRampPalette(colors = c("#386cb0","#212121","#B71C1C"))(100)
)

ggsave("heatmap.png",p1,device = png,width = 4,height = 10)
ggsave("heatmap.pdf",p1,device = pdf,width = 4,height = 10)

dfSAG <- read.table("SAG-input-expression.txt",header = T,row.names = 1)
colnames(dfSAG) <- c("Sporulated","Unsporulated")
p_SAG <- pheatmap(as.matrix(dfSAG),
               show_colnames = T, show_rownames = T,
               angle_col = 45,
               cluster_cols = F,
               border_color = "NA",
               cellwidth =20, cellheight=10,
               treeheight_row = 20,
               treeheight_col = 20,
               main = "Hypothetical SAGs (RbE-SAGs)",
               color = colorRampPalette(colors = c("#386cb0","#212121","#B71C1C"))(100)
)
p_SAG
ggsave("heatmap_SAG.png",p_SAG,device = png,width = 4,height = 10)
ggsave("heatmap_SAG.pdf",p_SAG,device = pdf,width = 4,height = 10)

dfGRA <- read.table("GRA-input-expression.txt",header = T,row.names = 1)
colnames(dfGRA) <- c("Sporulated","Unsporulated")

p_GRA <- pheatmap(as.matrix(dfGRA),
                  show_colnames = T, show_rownames = T,
                  angle_col = 45,
                  cluster_cols = F,
                  border_color = "NA",
                  cellwidth =20, cellheight=10,
                  treeheight_row = 20,
                  treeheight_col = 20,
                  main = "GRAs",
                  color = colorRampPalette(colors = c("#386cb0","#212121","#B71C1C"))(100)
)
p_GRA
ggsave("heatmap_GRA.png",p_GRA,device = png,width = 4,height = 2)
ggsave("heatmap_GRA.pdf",p_GRA,device = pdf,width = 4,height = 2)

dfROP <- read.table("ROP-input-expression.txt",header = T,row.names = 1)
colnames(dfROP) <- c("Sporulated","Unsporulated")

p_ROP <- pheatmap(as.matrix(dfROP),
                  show_colnames = T, show_rownames = T,
                  angle_col = 45,
                  cluster_cols = F,
                  border_color = "NA",
                  cellwidth =20, cellheight=10,
                  treeheight_row = 20,
                  treeheight_col = 20,
                  main = "ROPs",
                  color = colorRampPalette(colors = c("#386cb0","#212121","#B71C1C"))(100)
)
p_ROP
ggsave("heatmap_ROP.png",p_ROP,device = png,width = 4,height = 4)
ggsave("heatmap_ROP.pdf",p_ROP,device = pdf,width = 4,height = 4)

dfRON <- read.table("RON-input-expression.txt",header = T,row.names = 1)
colnames(dfRON) <- c("Sporulated","Unsporulated")

p_RON <- pheatmap(as.matrix(dfRON),
                  show_colnames = T, show_rownames = T,
                  angle_col = 45,
                  cluster_cols = F,
                  border_color = "NA",
                  cellwidth =20, cellheight=10,
                  treeheight_row = 20,
                  treeheight_col = 20,
                  main = "RONs",
                  color = colorRampPalette(colors = c("#386cb0","#212121","#B71C1C"))(100)
)
p_RON
ggsave("heatmap_RON.png",p_RON,device = png,width = 4,height = 4)
ggsave("heatmap_RON.pdf",p_RON,device = pdf,width = 4,height = 4)

dfMIC <- read.table("MIC-input-expression.txt",header = T,row.names = 1)
colnames(dfMIC) <- c("Sporulated","Unsporulated")

p_MIC <- pheatmap(as.matrix(dfMIC),
                  show_colnames = T, show_rownames = T,
                  angle_col = 45,
                  cluster_cols = F,
                  border_color = "NA",
                  cellwidth =20, cellheight=10,
                  treeheight_row = 20,
                  treeheight_col = 20,
                  main = "MICs",
                  color = colorRampPalette(colors = c("#386cb0","#212121","#B71C1C"))(100)
)
p_MIC
ggsave("heatmap_MIC.png",p_MIC,device = png,width = 4,height = 5)
ggsave("heatmap_MIC.pdf",p_MIC,device = pdf,width = 4,height = 5)

