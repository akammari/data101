cars <- read.csv("https://raw.githubusercontent.com/dev7796/data101_tutorial/main/files/dataset/Cars2022.csv")
View(cars)

#mean of all of the car maker brands buyer age to see who has the highest mean buyer age
mean_by_category <- tapply(cars$Buyer_Age, cars$Car, mean)
max_mean_category <- names(mean_by_category[which.max(mean_by_category)])
C <- mean(cars[cars$Car=='Ram',]$Buyer_Age)
cat("Category with the highest mean is", max_mean_category, "with a mean buyer age of", C)

#p-test with other brands
cat("nissan:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Nissan"))
cat("ford:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Ford"))
cat("kia:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Kia"))
cat("jeep:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Jeep"))
cat("subaru:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Subaru"))
cat("toyota:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Toyota"))
cat("honda:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Honda"))
cat("hyundai:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Hyundai"))
cat("gmc:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "GMC"))
cat("chevrolet:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ram", "Chevrolet"))

cat("nissan:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Nissan", "Ram"))
cat("ford:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Ford", "Ram"))
cat("kia:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Kia", "Ram"))
cat("jeep:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Jeep", "Ram"))
cat("subaru:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Subaru", "Ram"))
cat("toyota:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Toyota", "Ram"))
cat("honda:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Honda", "Ram"))
cat("hyundai:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Hyundai", "Ram"))
cat("gmc:", permutation_test(cars, "Car", "Buyer_Age", 1000, "GMC", "Ram"))
cat("chevrolet:", permutation_test(cars, "Car", "Buyer_Age", 1000, "Chevrolet", "Ram"))


#mean of all other car brands 
cat("nissan:", mean(cars[cars$Car=='Nissan',]$Buyer_Age))
cat("ford:", mean(cars[cars$Car=='Ford',]$Buyer_Age))
cat("kia:", mean(cars[cars$Car=='Kia',]$Buyer_Age))
cat("jeep:", mean(cars[cars$Car=='Jeep',]$Buyer_Age))
cat("subaru:", mean(cars[cars$Car=='Subaru',]$Buyer_Age))
cat("toyota:", mean(cars[cars$Car=='Toyota',]$Buyer_Age))
cat("honda:", mean(cars[cars$Car=='Honda',]$Buyer_Age))
cat("hyundai:", mean(cars[cars$Car=='Hyundai',]$Buyer_Age))
cat("gmc:", mean(cars[cars$Car=='GMC',]$Buyer_Age))
cat("chevrolet:", mean(cars[cars$Car=='Chevrolet',]$Buyer_Age))

