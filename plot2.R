setwd("C:/Users/Saurav/Desktop/Coursera")
tabAll <- read.table("household_power_consumption.txt",sep=";", header = TRUE, colClasses ="character")
tabAll$Date<-as.character(as.Date(tabAll$Date,format="%d/%m/%Y"))
tabAll_1<-tabAll[tabAll$Date=="2007-02-01",]
tabAll_2<-tabAll[tabAll$Date=="2007-02-02",]
tabAll_req<-rbind(tabAll_1,tabAll_2)
tabAll_req$Global_active_power<-as.numeric(tabAll_req$Global_active_power)

tabAll_req$Date<-as.Date(tabAll_req$Date,format="%Y-%m-%d")
tabAll_req$Datetime<-as.POSIXct(strptime(paste(tabAll_req$Date,tabAll_req$Time), "%Y-%m-%d %H:%M:%S"))


png(filename = "plot2.png", width = 480, height = 480,
    units = "px")

plot(tabAll_req$Datetime,tabAll_req$Global_active_power,type="l",main="",ylab="Global Active Power (Kilowatts)",xlab="")
dev.off()