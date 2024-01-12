#Name - Milind Lakhwani         Roll No. - 200106046

# Read data file
exp.data <- read.csv("exp.csv", row.names = 1, header = TRUE)

# Create data matrix
d <- data.matrix(exp.data, rownames.force = TRUE)

# Create spatial heatmap ----
# Clustering the gene expression

heatmap(d[46:55, 1:10 ], Colv = NA, 
        scale = "column",
        xlab = "Samples",
        ylab = "Genes",
        margins = c(6,8))
