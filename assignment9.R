movies <- read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/movies2023Tr.csv')

library(rpart)

# Assuming the target variable is "RATING" and the predictor variables are all other columns
model <- rpart(RATING ~ ., data = movies, method = "class")

library(rpart.plot)
rpart.plot(model)

test_data <- read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/movies2023Test_Student.csv')
predictions <- predict(model, newdata = test_data, type = "class")


# Split the data into training and validation sets
set.seed(123)  # Set seed for reproducibility
indices <- sample(1:nrow(movies), 0.4 * nrow(movies))  # 80% for training, 20% for validation
train_data <- movies[indices, ]
validation_data <- movies[-indices, ]

# Build the Decision Tree Model
library(rpart)
model <- rpart(RATING ~ ., data = train_data, method = "class")

# Predict on the validation set
predictions <- predict(model, newdata = validation_data, type = "class")

# Evaluate Accuracy
accuracy <- sum(predictions == validation_data$RATING) / nrow(validation_data)
print(paste("Validation Accuracy:", round(accuracy, 10)))

moviesT<-read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/movies2023Test_Student.csv')
submission<-read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/submissionMovies2023.csv')
library(rpart)
#Assume that you build a simple model using rpart - the so called 3-line solution
tree<-rpart(RATING~.,data=movies, method='class')
pre<-predict(tree, newdata =moviesT, type='class')
submission$RATING <-pre
#First 10 rows of submisison. Do not worry about the first column of numbers. This has two columns only
colnames(submission)
submission[1:10,]
#Run it on your R studio
write.csv(submission, 'mysubmission2.csv', row.names = FALSE)
