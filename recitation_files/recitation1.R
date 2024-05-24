# Table
# Making a table of that counts the number of students for each GPA
gpa <- table(moody$GPA)
gpa
score <- table(moody$Score)
score
# Joint distribution of Major and GPA
table(moody$Major, moody$GPA)
table(moody$GPA, moody$Major)

# tapply(numfilter , catfilter, function)
tapply(moody$Score , moody$Grade , min)

tapply(moody[moody$Seniority == 'Freshman',]$Score , moody[moody$Seniority == 'Freshman' ,]$Grade , mean)
# another example
# Sample data
values <- c(12, 15, 8, 10, 14, 9)
groups <- c("A", "B", "A", "B", "A", "B")
# not meaningful.
table(values, groups)
mean_by_group <- tapply(values, groups, mean)
mean_by_group