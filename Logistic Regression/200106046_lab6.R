#Name - Milind Lakhwani           Roll No. - 200106046

# Response variable - spider
# spider = 1 , present
# spider = 0 , not present
# Predictors = grain size


# Read training data -----  

train <- read.csv("spider_train.csv")


# Plotting malignancy vs size data ----

plot(train$size, train$spider, xlab = "Grain Size", ylab = "Probability of spider being present or not",
     col = "red", pch = 1, cex = 2)


# Logistic regression to classify using area measure ----
# We are calculating a and b from data

logit.size <- glm(spider ~ size, data = train, family = "binomial")
summary(logit.size)



# Plot the regression line ----

# Create vector for 'area'
sv = seq(0.2,1.1,0.01)

# Create vector for 'probability'
# We are using the predict() function that takes a 
# data frame as input. 
# Convert the area vector to a data frame and add correct header

size.data <- data.frame(sv)
names(size.data) <- "size"

# Predict the values of probability

pv <- predict(logit.size, size.data, type = 'response')

# plot area vs pv

lines(sv, pv, col = "blue", lwd = 2)


# Evaluate the model on test data ----

test <- read.csv("spider_test.csv")
colnames(test)[1] <- "size"

# Predict the probabilities for test data
p.test <- predict(logit.size, test, type = 'response')


# Classify based on Probability
# consider probability P = 0.3 as cut-off for
# classification
c.test1 <- ifelse(p.test > 0.3, 1, 0)

# consider probability P = 0.5 as cut-off for
c.test2 <- ifelse(p.test > 0.5, 1, 0)

# consider probability P = 0.7 as cut-off for
c.test3 <- ifelse(p.test > 0.7, 1, 0)


# Create confusion matrices
tab.test1 <- table(Predicted = c.test1, Actual = test$spider)

tab.test2 <- table(Predicted = c.test2, Actual = test$spider)

tab.test3 <- table(Predicted = c.test3, Actual = test$spider)

cv <- data.frame(tab.test1)



# Sensitivity/ Recall / Hit rate/ True positive rate
# sn = TP/(TP + FN)

sn.test1 <- tab.test1[2,2]/sum(tab.test1[ ,2])
sn.test2 <- tab.test2[2,2]/sum(tab.test2[ ,2])
sn.test3 <- tab.test3[2,2]/sum(tab.test3[ ,2])

x_axis=c(0.3,0.5,0.7)
y_axis=c(sn.test1,sn.test2,sn.test3)
barplot(y_axis,names.arg=x_axis,xlab="Cutoff",ylab="Sensitivity")

barplot() 
