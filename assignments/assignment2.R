moody_data <- read.csv("moody2023F1.csv",fileEncoding='latin1',check.names=F)
View(moody_data)

# Summary statistics
summary(moody_data)

# Data structure
str(moody_data)

# Histogram of Score
hist(moody_data$Row, main = "Row Histogram", xlab = "Row")

# Bar plot for Attendance
barplot(table(moody_data$Attendance), main = "Attendance Distribution")

# Box plot of Score by Grade****
boxplot(moody_data$Score ~ moody_data$Grade, main = "Score by Grade", xlab = "Grade", ylab = "Score")

# Box plot of Score by Attendance**
boxplot(moody_data$Score ~ moody_data$Attendance, main = "Score by Attendance", xlab = "Attendance", ylab = "Score")

# Bar plot of Pass/Fail by Section
mosaicplot(table(moody_data$Section, moody_data$Grade), main = "Pass/Fail by Section")

# Bar plot of Pass/Fail by Row
mosaicplot(table(moody_data$Row, moody_data$Grade), main = "Pass/Fail by Row")

# Chi-squared test for independence (attendance and grades)
chi_sq_result <- chisq.test(table(moody_data$Attendance, moody_data$Grade))
print(chi_sq_result)

