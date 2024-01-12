#Name - Milind Lakhwani          Roll No. - 200106046

# Linear model:
# D = b1*A + b2*B + b3*C + a

# Read data ----
data <- read.csv("data1.csv")

# Perform regression using lm() ----
# All coefficients and intercept are considered
reg <- lm(D ~ A + B + C, data = data)

summary(reg)
# p value for F-test is very small. So we reject null hypothesis that all beta in the population model = 0

# P-value for intercept is greater than 0.05. So we accept the null hypothesis and make intercept = 0

# Perform regression removing intercept ----
# All coefficients are considered and intercept is removed
reg2 <- lm(D ~ A + B + C + 0, data = data)

summary(reg2)

# confidence interval for each coefficient ----

confint(reg2)
