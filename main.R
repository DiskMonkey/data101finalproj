library(ggplot2)

data <- read.csv("./Final Proj/WineQT.csv")

data$quality = as.factor(data$quality)

ggplot(data, aes(x=quality)) + geom_histogram()

ggplot(data, aes(x = quality , y =  volatile.acidity)) + geom_jitter(aes(color = pH))

ggplot(data, aes(x = free.sulfur.dioxide , y = total.sulfur.dioxide)) + geom_point(aes(colour = factor(quality)))
 
ggplot(data, aes(x = volatile.acidity , y = total.sulfur.dioxide)) + geom_point(aes(colour = factor(quality)))

# now doing rpart and naive bayes 
library(klaR)
library(naivebayes)
library(rsample)
library(rpart)
library(rpart.plot)
library(caret)

set.seed(1234)

# I will use 3/4 of the data for training.
data_split <- initial_split(data, prop = 0.75)
train <- training(data_split)
test <- testing(data_split)
#summary(train)
#summary(test)


nb <- NaiveBayes(quality ~ ., data=train)
pred <- predict(nb, test)


#Generate Confusion Matrix
tab_nb <- table(pred$class, test$quality)
cat("\nnaive bayes below:\n")
print(caret::confusionMatrix(tab_nb))


#Now doing rpart:
rpart_mod <- rpart(quality ~ ., data=train, method="class")
library(rpart.plot)
rpart.plot(rpart_mod)

pred_rpart=predict(rpart_mod, test, type="class")
#
#Generate Confusion Matrix
tab_rpart = table(pred_rpart,test$quality)
cat("\nrpart below:\n")
print(caret::confusionMatrix(tab_rpart))
























