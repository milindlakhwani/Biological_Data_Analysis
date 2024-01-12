# Name - Milind Lakhwani    Roll No. - 200106046

#Read the data: ----

d = read.csv("data2.csv")


# Assign to variables: ----

x <- d$g1
y <- d$g2


#Plot the data: ----

plot(x, y, xlab = "g1", ylab = "g2", col = "red")

# Check correlation ----

cor(x,y, method = 'pearson')

# Perform linear regression: ----

reg <- lm(y ~ x, data = d)

# Check the results:

summary(reg)

# Linear regression without intercept ----

reg2 <- lm(y ~ x + 0, data = d) 

# Check the results:

summary(reg2)

# Plotting the data: ----

# Including the library
library(ggplot2)

# Running ggplot on raw data and providing Linear Regression data
plt_1 <- ggplot(d, aes(x = g1, y = g2)) +
  geom_point() +
  geom_abline(slope = reg2$coefficients[1], 
              intercept = 0, 
              color = 'blue')

plt_1

# Running ggplot with geom_smooth and using lm method to compute linear regression model.
plt_2 <- ggplot(d, aes(x = g1, y = g2)) +
  geom_point() +
  geom_smooth(method = 'lm') + 
  labs(title = "Plot of Relation between Gene Expressions" , x = "Gene 1 (g1)" , y = "Gene 2 (g2)") + 
  theme_classic()

plt_2