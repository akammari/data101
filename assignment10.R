# Load necessary libraries
library(Metrics)

# Load the training and testing datasets
training <- read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/incomeTrain2023.csv')
testing <- read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/IncomeTest2023_Kaggle.csv')

# Create linear regression models for each major
STEM_model <- lm(Salary ~ GPA, data = subset(training, Major == "STEM"))
Humanities_model <- lm(Salary ~ GPA, data = subset(training, Major == "Humanities"))
Vocational_model <- lm(Salary ~ GPA, data = subset(training, Major == "Vocational"))
Professional_model <- lm(Salary ~ GPA, data = subset(training, Major == "Professional"))


# Combine the predictions for the training set
training_predictions <- c(
  predict(STEM_model, newdata = subset(training, Major == "STEM")),
  predict(Humanities_model, newdata = subset(training, Major == "Humanities")),
  predict(Vocational_model, newdata = subset(training, Major == "Vocational")),
  predict(Professional_model, newdata = subset(training, Major == "Professional"))
)

# Calculate MSE on the training set
training_mse <- mse(training$Salary, training_predictions)
cat("Training Mean Squared Error:", training_mse, "\n")

# Combine the predictions for the testing set
testing_predictions <- c(
  predict(STEM_model, newdata = testing),
  predict(Humanities_model, newdata = testing),
  predict(Vocational_model, newdata = testing),
  predict(Professional_model, newdata = testing)
)

# Prepare predictions for submission
submission <- data.frame(id = testing$ID, Salary = testing_predictions)

# Write the submission file
write.csv(submission, file = "kaggle_submission3.csv", row.names = FALSE)
