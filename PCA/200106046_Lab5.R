# Principal Component Analysis: Step-by-step


# Read data ----

data = read.csv('image.csv')

# Center and scale the data ----

data.scaled <- scale(data[, 2:14], center = TRUE, scale = TRUE)

# Get the covariance matrix ----
# of the data

cov.d.s <- cov(data.scaled)

# Get eigenvalues and eigenvectors ----
# of the covariance matrix 

ev <-eigen(cov.d.s)


# Get eigenvalues & plot scree plot ----

L <- ev$values 

L.s <- L/sum(L)

barplot(L.s,
        names.arg = c(paste0("L" , seq(1,13))),
        ylab = 'Relative Variance' , xlab = 'Dimensions')  

# Get eigenvectors ----

V <- ev$vectors

# scale the eigenvectors wrt +1

V <- -V

# Prepare Loading matrix ----
# V is the loading matrix.
# Add row and column names for clarity (optional)

#rownames(V) <- c("Drug 1", "Drug 2", "Drug 3")
rownames(V) <- c(colnames(data.scaled))
colnames(V) <- c(paste0("PC" , seq(1,13)))

# Generate Scores matrix ----
# Project the data on the eigenvectors

P <- data.scaled %*% V

# Add column and row names to P (Optional)

colnames(P) <- c(paste0("PC" , seq(1,13)))
#rownames(P) <- c(colnames(data.scaled))

# Plot the projected data for PC1 & PC2 ----

plot(P[ ,1:2], xlim = c(-8,9),  ylim = c(-8,5))
