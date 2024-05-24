install.packages("devtools")
library(devtools)
devtools::install_github("janish-parikh/ZTest")
library(HypothesisTesting)


elect <- read.csv("https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/electMidterm.csv")
View(elect)

#task a: finding these subsets
democrat <- elect[elect$Party == 'Democrat',]
View(democrat)

republican <- elect[elect$Party == 'Republican',]
View(republican)

#prediction

decision <- rep('Democrat', nrow(elect))

# Finding subsets based on patterns
# Example conditions based on 'NetWorth' and 'Education' columns
# You should tailor these conditions based on your data exploration
decision[elect$Location == "Central" & elect$Age == "<50"] <- "Republican"
decision[elect$Location == "WestCoast" & elect$Age == "<60"] <- "Democrat"

# Check accuracy
accuracy <- mean(decision == elect$Party)
cat('Accuracy of the model:', accuracy)


#task b: 

# Subset with mean age at least 18 years more than the overall mean age
subset_18_more <- elect[elect$Age >= (mean(elect$Age) + 18), ]
View(subset_18_more)

# Perform a hypothesis test (z-test or permutation test) on subset_18_more
# Conduct your test and compare the subset mean with the overall mean
# Example Permutation Test:
 permutation_test(subset_18_more, "Party", "Age", 1000, "Republican", "Democrat")

 
 
 # Subset with mean age at least 20 years less than the overall mean age
 subset_20_less <- elect[elect$Age <= (mean(elect$Age) - 20), ]
 
 # Perform a hypothesis test (z-test or permutation test) on subset_20_less
 # Conduct your test and compare the subset mean with the overall mean
 # Example Permutation Test:
 permutation_test(subset_20_less, "Party", "Age", 1000, "Democrat", "Republican") 

 
 #task c:
 
 Net<-unique(elect$NetWorth)
 Edu <-unique(elect$Education) 
 Loc<-unique(elect$Location)
 Party<-unique(elect$Party)
 
 Netseq <- sample(Net, 20000, replace = TRUE)
 Eduseq<-sample(Edu, 20000, replace = TRUE)
 Locseq<-sample(Loc, 20000, replace = TRUE)
 Partseq<-sample(Party, 20000, replace = TRUE)
 Ageseq<- runif(20000, 18, 100)
 colnames(elect)
 electR<-data.frame(NetWorth=Netseq, Age=Ageseq, Education=Eduseq,Location=Locseq, Party=Partseq)
 
 
 # Repeatedly sample subsets and check the proportion of Republican and Democratic voters
 num_iterations <- 10  # Number of iterations
 
 for (i in 1:num_iterations) {
   Netseq <- sample(Net, 20000, replace = TRUE)
   Eduseq <- sample(Edu, 20000, replace = TRUE)
   Locseq <- sample(Loc, 20000, replace = TRUE)
   Partseq <- sample(Party, 20000, replace = TRUE)
   Ageseq <- runif(20000, 18, 100)
   
   electR <- data.frame(NetWorth = Netseq, Age = Ageseq, Education = Eduseq, Location = Locseq, Party = Partseq)
   
   count_republican <- sum(electR$Party == "Republican")
   count_democrat <- sum(electR$Party == "Democrat")
   total_voters <- nrow(electR)
   percentage_republican <- count_republican / total_voters
   percentage_democrat <- count_democrat / total_voters
   
   cat("Iteration", i, "- Percentage Republican:", percentage_republican, ", Percentage Democrat:", percentage_democrat, "\n")
 }
 
 #The point is to illustrate that if the subset 'S' obtained from the 'electR' dataset was merely a random fluke and not a consistent pocket of Republican or Democratic votes, then in each iteration of the random subset creation, the percentages of Republican and Democratic voters will vary significantly. The proportions across multiple iterations would demonstrate inconsistency, indicating that there is no persistent overwhelming favoritism towards any specific party within the subsets.

 #part d: market data set
 market <- read.csv("https://raw.githubusercontent.com/dev7796/data101_tutorial/main/files/dataset/HomeworkMarket2022.csv")
 View(market)
 
 #d1) Check for independence between Beer and Location
 contingency_table <- table(market$Beer, market$Location)
 chi_squared_test <- chisq.test(contingency_table)
 p_value <- chi_squared_test$p.value
 
 if (p_value < 0.05) {
   print("Reject the independence hypothesis")
 } else {
   print("Cannot reject the independence hypothesis")
 }
 
 print(paste("P-value:", p_value))
 
 # d2) Calculate the expected contingency table for Beer and Location
 expected_table <- outer(rowSums(contingency_table), colSums(contingency_table)) / sum(contingency_table)
 print("Expected Contingency Table for Beer and Location:")
 print(expected_table)
 
 # d3) Calculate the observed contingency table for Beer and Location
 print("Observed Contingency Table for Beer and Location:")
 print(contingency_table)
 
 # d4) 
 additional_items <- c("SoftDrinks", "Sweets", "Wine", "Snacks")
 
 for (item in additional_items) {
   test_table <- table(market$Beer, market$Location, market[[item]])
   chi_test <- chisq.test(test_table)
   p_val <- chi_test$p.value
   
   if (p_val < 0.05) {
     print(paste("With", item, "the p-value is:", p_val))
   }
 }
 
 
 # d5) Expected contingency table for subset of attributes Beer, Location, and Sweets
 subset_contingency_table <- table(market$Beer, market$Location, market$Sweets)
 expected_table_subset <- outer(rowSums(subset_contingency_table), colSums(subset_contingency_table)) / sum(subset_contingency_table)
 print("Expected Contingency Table for Subset (Beer, Location, Sweets):")
 print(expected_table_subset)
 
 
 