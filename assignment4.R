party <- read.csv("https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/party2023.csv")
View(party)

#Part A
#1 
carolsalsa<-mean(party[party$Music=='Salsa' & party$DJ=='Carol',]$Attendance)
caroltechno<-mean(party[party$Music=='Techno' & party$DJ=='Carol',]$Attendance)
cat("Carol's mean attendance for Techno is higher than her mean attendance for Salsa, at ",caroltechno, "vs. ", carolsalsa)

#2
alex<-mean(party[party$DJ=='Alex',]$Rating)
ania<-mean(party[party$DJ=='Ania',]$Rating)
cat("Ania has a higher mean rating than Alex, at ", ania, "vs. ", alex)

#3
hiphop<-sd(party[party$Music=='HipHop' & party$Day=='Saturday',]$Ticket)
rock<-sd(party[party$Music=='Rock' & party$Day=='Friday',]$Ticket)
cat("The standard deviation for HipHop ticket prices on Saturday is higher than Rock ticket prices on Friday, at ", hiphop, "vs. ", rock)


#Part B 
attalex<- mean(party[party$DJ=='Alex',]$Attendance)
attrohit<- mean(party[party$DJ=='Rohit',]$Attendance)
C <- permutation_test(party, "DJ", "Attendance", 1000, "Alex", "Rohit")
cat("The mean attendance for Rohit is", attrohit, "and the mean attendance for Alex is", attalex, ", with a p-score of", C)

attsalsa<- mean(party[party$Music=='Salsa',]$Attendance)
atttechno<- mean(party[party$Music=='Techno',]$Attendance)
B <- permutation_test(party, "Music", "Attendance", 1000, "Salsa", "Techno")
cat("The mean attendance for Salsa is", attsalsa, "and the mean attendance for Techno is", atttechno, ", with a p-score of", B)

attmski<- mean(party[party$DJ=='Mski',]$Attendance)
A <- permutation_test(party, "DJ", "Attendance", 100, "Alex", "Mski")
cat("The mean attendance for Alex is", attalex, "and the mean attendance for Mski is", attmski, ", with a p-score of", A)

