library(openxlsx)
confirmed.corona= read.xlsx("YOURE LOCAL DISK\\corona data.xlsx",sheet=1, startRow=1, colNames = TRUE )
View(confirmed.corona)

continent.vec= confirmed.corona[,1]

Continent= c()
for (i in 1:185) {
  x= rep(continent.vec[i], 85)
  Continent= append(Continent,x)
}

country.vec= confirmed.corona[,2]

Country= c()
for (i in 1:185) {
  x= rep(country.vec[i], 85)
  Country= append(Country,x)
}

Days= rep(1:85, 185)

#take confirmed data
Confirmed= c()
for (i in 1:185){
  x=confirmed.corona[i,]
  x =x[-c(1:4)]
  x= t(x)
  Confirmed=append(Confirmed,x)
}
Confirmed

#take deaths data
death.corona= read.xlsx("D:\\UII (STATISTIKA)\\SEMESTER 6\\DATVIS\\UTS\\data corona UTS.xlsx",sheet=2, startRow=1, colNames = TRUE )
Death= c()
for (i in 1:185){
  x=death.corona[i,]
  x =x[-c(1:4)]
  x= t(x)
  Death=append(Death,x)
}
Death

#take recovered data
recovered.corona= read.xlsx("D:\\UII (STATISTIKA)\\SEMESTER 6\\DATVIS\\UTS\\data corona UTS.xlsx",sheet=3, startRow=1, colNames = TRUE )
Recovered= c()
for (i in 1:185){
  x=recovered.corona[i,]
  x =x[-c(1:4)]
  x= t(x)
  Recovered=append(Recovered,x)
}
Recovered

covid_frame=data.frame(Continent,Country,Days,Confirmed,Death,Recovered)

#download data
colnames(covid_frame)= c("Continent","Country","Days","Confirmed","Death", "Recovered")
write.csv(covid_frame,file = "YOURE LOCAL DISK\\Coronavirus.csv",row.names = TRUE)

