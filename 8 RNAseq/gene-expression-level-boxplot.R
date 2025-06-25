library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(ggsignif)

setwd("E:/1-Analysis_Record/Eimeria-Genome/RNAseq/rsem/")
df <- read.table("input-boxplot-expression.txt",header = T)
df_long <- gather(df, key = Group,-Type,-Gene, value = log2TPM)
my_colors <- c("log2TPM_spo" = "#E57373", "log2TPM_unspo" = "grey60") 


df_long$Type <- factor(df_long$Type, levels = c("Hypothetical_SAGs","MICs","ROPs","RONs","GRAs"))
df_long$Group <- factor(df_long$Group, levles = c("log2TPM_spo","log2TPM_unspo"))
str(df_long$Group)
str(df_long$Type)

p <- ggplot(df_long, aes(x = Group, y = log2TPM))+
  stat_boxplot(geom = "errorbar",width=0.2)+
  geom_jitter(aes(color = Group),alpha=1,size=1.5,position=position_jitter(width = 0.2))+
  geom_boxplot(aes(fill = Group),alpha=0.3,outlier.shape = NA) +
  facet_wrap(~Type,scales = "free_x",nrow = 1,strip.position = "bottom")+
  scale_fill_manual(name = "Group", values = my_colors,
                    breaks = c("log2TPM_spo", "log2TPM_unspo"),
                    labels = c("Sporulated", "Unsporulated")) +
  scale_color_manual(name = "Group", values = my_colors,
                     breaks = c("log2TPM_spo", "log2TPM_unspo"),
                     labels = c("Sporulated", "Unsporulated")) +
  geom_signif(comparisons = list(c("log2TPM_spo","log2TPM_unspo")),
              test = wilcox.test,y_position = c(11),
              tip_length = c(c(0.05,0.05)),
              size=0.3,color="black")+
  
  ylab("log2TPM") +
  xlab("")+
  theme_classic() +
  theme(
    legend.position="right",
    legend.title = element_text(size=12),
    legend.text = element_text(size=12),
    axis.ticks.x = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_text(size = 12,color="black"),
    axis.title.x = element_text(size = 12,color="black"),
    axis.title.y = element_text(size = 12,color="black"),
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )
p
ggsave("boxplot_RNAseq.png",p,device = png,width = 10,height = 3.5)
ggsave("boxplot_RNAseq.pdf",p,device = pdf,width = 10,height = 3.5)

