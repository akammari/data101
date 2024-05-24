# install and import necessary libraries
install.packages("devtools")
library(devtools)
devtools::install_github("janish-parikh/ZTest")
library(HypothesisTesting)

### example ###
traffic <- read.csv("https://raw.githubusercontent.com/dev7796/data101_tutorial/main/files/dataset/Traffic2022.csv")

# permutation test
p <- permutation_test(traffic, "TUNNEL", "VOLUME_PER_MINUTE", 10000, "Holland", "Lincoln")
cat("The p-value of the hypothesis is equal to:", p)

# z-test
p <- z_test_from_data(traffic, "TUNNEL", "VOLUME_PER_MINUTE", "Holland", "Lincoln")
cat("The p-value of the hypothesis is equal to:", p)
