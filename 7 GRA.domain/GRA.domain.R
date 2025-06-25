#install.packages("gggenes")

library(ggplot2)
library(gggenes)

setwd("E:/1-Analysis_Record/Eimeria-Genome/GRA")
df <- read.table("SP_TM_Domain_result.txt",header = F,sep = "\t", check.names = F)
colnames(df) <- c("gene","domain","domain_start","domain_end","gene_start","gene_end")
gene_sort <- read.table("Length.txt",header = F,sep = "\t", check.names = F)

gene_level <- gene_sort[,1]
df$gene <- factor(df$gene,level = rev(gene_level))

str(df)
p1 <- ggplot(df, aes(xmin = gene_start, xmax = gene_end, y=gene)) +
  geom_gene_arrow(arrowhead_height = unit(0, "mm"),
                  arrowhead_width = unit(0,"mm"))+
  geom_subgene_arrow(arrowhead_height = unit(0, "mm"),
                     arrowhead_width = unit(0,"mm"),
                     data = df,aes(xsubmin = domain_start,xsubmax = domain_end, fill = domain))+
  labs(y=NULL)+
  scale_fill_brewer(palette = "Set3") +
  theme_classic() +
  theme( 
    axis.text.y=element_text(color="black"),
    axis.text.x=element_text(color="black"),
    legend.title = element_blank(),
    legend.spacing.x=unit(0.1,'cm'),
    legend.key.width=unit(0.4,'cm'),
    legend.position = "top",
    legend.text=element_text(color="black",size=8),
    legend.key.height=unit(0.4,'cm'),
    plot.margin=unit(c(0,0,0,0),units="cm"))+
  guides(fill = guide_legend(direction = "horizontal"))+
  guides(fill=guide_legend(nrow=1, byrow=TRUE))
p1

ggsave("GRA.domain.pdf",p1,width = 14,height = 8,dpi = 300 )
ggsave("GRA.domain.png",p1,width = 14,height = 8,dpi = 300 )
