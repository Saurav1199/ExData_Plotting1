stewd("C:/Users/Saurav/Desktop/Coursera")
tabAll <- read.table("household_power_consumption.txt",sep=";", header = TRUE, colClasses ="character")
tabAll$Date<-as.character(as.Date(tabAll$Date,format="%d/%m/%Y"))
tabAll_1<-tabAll[tabAll$Date=="2007-02-01",]
tabAll_2<-tabAll[tabAll$Date=="2007-02-02",]
tabAll_req<-rbind(tabAll_1,tabAll_2)
tabAll_req$Global_active_power<-as.numeric(tabAll_req$Global_active_power)
class(tabAll_req$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480,
    units = "px")
hist(tabAll_req$Global_active_power,col="red",plot=TRUE,main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)")
dev.off()