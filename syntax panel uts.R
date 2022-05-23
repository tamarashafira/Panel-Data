library(openxlsx)
confirmed.corona= read.xlsx("D:\\UII (STATISTIKA)\\SEMESTER 6\\DATVIS\\UTS\\data corona UTS.xlsx",sheet=1, startRow=1, colNames = TRUE )
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

#mengambil data confirmed
Confirmed= c()
for (i in 1:185){
  x=confirmed.corona[i,]
  x =x[-c(1:4)]
  x= t(x)
  Confirmed=append(Confirmed,x)
}
Confirmed

#mengmbil data  kematian
death.corona= read.xlsx("D:\\UII (STATISTIKA)\\SEMESTER 6\\DATVIS\\UTS\\data corona UTS.xlsx",sheet=2, startRow=1, colNames = TRUE )
Death= c()
for (i in 1:185){
  x=death.corona[i,]
  x =x[-c(1:4)]
  x= t(x)
  Death=append(Death,x)
}
Death

#mengmbil data  sembuh
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

#donlot data
colnames(covid_frame)= c("Continent","Country","Days","Confirmed","Death", "Recovered")
write.csv(covid_frame,file = "D:\\UII (STATISTIKA)\\SEMESTER 6\\DATVIS\\UTS\\Coronavirus.csv",row.names = TRUE)

