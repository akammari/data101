set <- read.csv("datascience_salaries.csv")
View(set)

install.packages("ggplot2")
library(ggplot2)

install.packages("devtools")
library(devtools)
devtools::install_github("janish-parikh/ZTest")
library(HypothesisTesting)


#box plot 
ggplot(set, aes(x = experience_level, y = salary)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Salary vs Experience Level", x = "Experience Level", y = "Salary")

#bar plot
barplot(table(set$salary), main = "Salary Distribution")

#mean values
entry <- mean(set[set$experience_level == 'Entry',]$salary)
executive <- mean(set[set$experience_level == 'Executive',]$salary)
mid <- mean(set[set$experience_level == 'Mid',]$salary)
senior <- mean(set[set$experience_level == 'Senior',]$salary)

#p-test
p <- permutation_test(set, "experience_level", "salary", 1000, "Entry", "Mid")
p

#Bayesian odds and posterior odds from recitation files
# Observation is that a data scientist earns less income than the mean mid-level experienced data scientist.
# Belief is that the data scientist earns an entry level income

np<-nrow(set[set$experience_level=='Entry',])
np

n<-nrow(set)
n

Prior<-np/n
Prior

PriorOdds<-round(Prior/(1-Prior),2)
PriorOdds

TruePositive<-round(nrow(set[set$salary<mid & set$experience_level=='Entry',])/nrow(set[set$experience_level == 'Entry',]),2)
TruePositive

FalsePositive<-round(nrow(set[set$salary<mid & set$experience_level!='Entry',])/nrow(set[set$experience_level != 'Entry',]),2)
FalsePositive

LikelihoodRatio<-round(TruePositive/FalsePositive,2)
LikelihoodRatio

PosteriorOdds<-LikelihoodRatio * PriorOdds
PosteriorOdds

Posterior<-PosteriorOdds/(1+PosteriorOdds)
Posterior
