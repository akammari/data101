Cars <- read.csv("Cars2023c.csv",fileEncoding='latin1',check.names=F)
View(Cars)

mean_all <- mean(Cars[]$Buyer_Income)
cat("The mean income over the entire dataset is: $",mean_all)

#query_more<-mean(Cars[Cars$Buyer=='Female',]$Buyer_Income)

#at least $3000 more:
q1<-mean(Cars[Cars$Buyer_Age=='24' & Cars$Car=='Ram',]$Buyer_Income)
cat("Q1: The mean income of buyers who are 24 and buy a Ram is: $",q1)
cat("The difference in the mean income of buyers who are 24 and buy a Ram is vs the mean income of everyone included in the data set is: $",q1 - mean_all)

#at least $3000 less
q2<-mean(Cars[Cars$Buyer_Age=='65' & Cars$Season=='Winter',]$Buyer_Income)
cat("Q2: The mean income of buyers who are 65 and buy a car in Winter is: $",q2)
cat("The difference in the mean income of buyers who are 65 and buy a car in Winter vs the mean income of everyone included in the data set is: $",q2 - mean_all)


#crossvalidation:

#Creating 2 subsets of the data
Cars1<-Cars[1:25000,]
Cars2<-Cars[25001:50000,]

#mean of Cars1
mean_c1 <- mean(Cars1[]$Buyer_Income)
mean_c2 <- mean(Cars1[]$Buyer_Income)

cat("The mean income in Cars1 is:",mean_c1)
cat("The mean income in Cars2 is:",mean_c2)
cat("The difference between the mean income of everyone in the dataset vs those in Cars1 is: $",mean_all - mean_c1)
cat("The difference between the mean income of everyone in the dataset vs those in Cars2 is: $",mean_all - mean_c2)

#Q1 over Cars1
c1q1<-mean(Cars1[Cars1$Buyer_Age=='24' & Cars1$Car=='Ram',]$Buyer_Income)
cat("Cars1 Q1: The mean income of buyers who are 24 and buy a Ram In Cars1 is: $",c1q1, "in comparision to Q1, which is: $", q1)
cat("The difference in the mean income of buyers who are 24 and buy a Ram is vs the mean income of everyone included in the data set is: $",c1q1 - mean_all)
cat("The difference in the mean income of buyers who are 24 and buy a Ram is vs the mean income of those in Cars1: $",c1q1 - mean_c1)

#Q2 over Cars1
c1q2<-mean(Cars1[Cars1$Buyer_Age=='65' & Cars1$Season=='Winter',]$Buyer_Income)
cat("Cars1 Q2: The mean income of buyers who are 65 and buy a car in Winter in Cars1 is: $",c1q2, "in comparision to Q2, which is: $", q2)
cat("The difference in the mean income of everyone included in the data set vs the mean income of buyers who are 65 and buy a car in Winter is: $",mean_all - c1q2)
cat("The difference in the mean income of everyone included in Cars1 vs the mean income of buyers who are 65 and buy a car in Winter is: $",mean_c1 - c1q2)

#Q1 over Cars2
c2q1<-mean(Cars2[Cars2$Buyer_Age=='24' & Cars2$Car=='Ram',]$Buyer_Income)
cat("Cars2 Q1: The mean income of buyers who are 24 and buy a Ram in Cars2 is: $",c2q1, "in comparision to Q1, which is: $", q1)
cat("The difference in the mean income of buyers who are 24 and buy a Ram is vs the mean income of everyone included in the data set is: $",c2q1 - mean_all)
cat("The difference in the mean income of buyers who are 24 and buy a Ram is vs the mean income of those in Cars2: $",c2q1 - mean_c2)

#Q2 over Cars2
c2q2<-mean(Cars1[Cars1$Buyer_Age=='65' & Cars1$Season=='Winter',]$Buyer_Income)
cat("Cars2 Q2: The mean income of buyers who are 65 and buy a car in Winter in Cars2 is: $",c2q2, "in comparision to Q2, which is: $", q2)
cat("The difference in the mean income of everyone included in the data set vs the mean income of buyers who are 65 and buy a car in Winter is: $",mean_all - c2q2)
cat("The difference in the mean income of everyone included in Cars2 vs the mean income of buyers who are 65 and buy a car in Winter is: $",mean_c2 - c2q2)

