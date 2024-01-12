# Name - Milind Lakhwani
# Roll No. - 200106046

library(ggplot2)

data <- read.csv("vData_2.csv")

ggplot()

ggplot(data)

p1 <- ggplot(data, aes( x = log2FoldChange, y = -log10(pvalue))) +
  
  geom_point() +
  
  geom_hline(yintercept = -log10(0.05) , color = "blue") + 
  
  geom_vline(xintercept = c(1 , -1) , color = "blue")  +
  
  theme_classic() +
  
  labs(x = "Fold Change (log2)" , y = "p-value (-log10)", color = "", title = "Volcano Plot for vData_2.csv") 


p1