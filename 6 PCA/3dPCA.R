#install.packages("scatterplot3d")

setwd("E:\1-Analysis_Record/Eimeria-Genome/pathway_analysis/")
df <- read.table("pca-gene-ratio-input.txt",header = T,row.names = 1)

data <- df[which(rowSums(df) > 0.3),]
condition <- factor(c(rep("Rabbit",5),rep("Mouse",1),rep("Human",1),rep("Avian",7),rep("Others",4)))
coldata <-data.frame(row.names = colnames(data),condition)

pca <- prcomp(data,scale = T)
summary(pca)
plot(pca)
loadings <- pca$rotation


library(scatterplot3d)
cols <- c(rep("#d53f4d",5),rep("#524398",1), rep("#40af35",1), rep("#319ad0",7), rep("grey",4))

p1 = scatterplot3d(loadings[,1:3],angle=15,color = cols, pch = 16)
text(p1$xyz.convert(loadings[,1:3]), labels = rownames(loadings),
     cex= 0.7, col = "black")
legend("bottom", legend = levels(coldata$condition),
       col = c("#319ad0","#524398","#40af35","grey","#d53f4d"), pch = 16,inset = -0.5,xpd = TRUE, horiz = TRUE)

