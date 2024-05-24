lettuce <- read.csv("lettuceBig.csv",fileEncoding='latin1',check.names=F)
#View(lettuce)

# Create a scatterplot between two numeric variables (x and y)
plot(lettuce$`Growth Days`, lettuce$`Temperature (°C)`, main = "Scatterplot", xlab = "Growth Days", ylab = "Temperature (C)", col = "blue", pch = 19)

# Create a boxplot for a numeric variable
boxplot(lettuce$`Humidity (%)`, main = "Boxplot", ylab = "Humidity")

# Load the ggplot2 library
library(ggplot2)

# Create a boxplot using ggplot2
#ggplot(lettuce, aes(x = lettuce$`Humidity (%)`, y = lettuce$`pH Level`)) +  # x = "" places all boxes in one group
  #geom_boxplot(fill = "lightblue", color = "blue") +
  #labs(title = "Boxplot", x = "", y = "Value")  # x = "" removes x-axis label

# Create a barplot for a categorical variable
counts <- table(lettuce$`TDS Value (ppm)`)
barplot(counts, main = "Barplot", xlab = "TDS value (PPM)", ylab = "Counts", col = "lightblue")


