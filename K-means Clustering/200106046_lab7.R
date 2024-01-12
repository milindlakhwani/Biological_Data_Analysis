#Name - Milind Lakhwani           Roll No. - 200106046

# Read data ----
data <- read.csv("facs.csv")

# Plot to look for clusters ----
plot(data, pch = 1, cex = 2)

# Perform k-means clustering ----
# Use kmeans() function

# Set seed for random number generator
set.seed(1) 

# Result ----
# Compare clustering with different k

# Perform clustering different k in a for loop

k_clusters <- list()

for (k in 2:6){
  
  k_clusters[[k]] <- kmeans(data, k, nstart = 100)
  
}

# Collect Within cluster sum of squares for all clsutering

wcss <- rep(0,5)

for (k in 2:6){
  wcss[k-1] <- k_clusters[[k]]$tot.withinss
}

# Create a barplot for WCSS

barplot(wcss, names = seq(2,6), xlab = "k", 
        ylab = " Within cluster SS")

# plot the result for selected k 
# Here we are using k = 4

# Comparison between FL2.H vs FL3. H
plot(data[2:3], col = k_clusters[[4]]$cluster,pch = 20, cex = 3)

# Comparison between FL3.H vs FL4.H
plot(data[3:4], col = k_clusters[[4]]$cluster,pch = 20, cex = 3)
