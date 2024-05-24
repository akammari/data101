# Load necessary libraries
library(caret)
library(randomForest)
library(ModelMetrics)

LoanTrain <- read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/LoanTrain2023b.csv')
LoanTest <- read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/LoanTest2023b.csv')

mse_values <- t(replicate(10, {
  v <- sample(1:nrow(LoanTrain))
  trainScrambled <- LoanTrain[v, ]
  
  trainSample <- trainScrambled[nrow(trainScrambled) - n:nrow(trainScrambled), ]
  testSample <- trainScrambled[1:n, ]
  
  set.seed(1)  
  model <- train(Amount ~ Income + Debt + Car + Home, data = trainSample, method = "rf", trControl = trainControl(method = "cv", number = 10))
  
  predictions <- predict(model, newdata = LoanTest)
  
  mse_value <- mse(LoanTest$Amount, predictions)
  
  cat("Iteration:", i, "MSE:", mse_value, "\n")
  
  mse_value
}))

cat("Overall Mean MSE:", mean(mse_values), "\n")
