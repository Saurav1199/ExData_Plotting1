setwd("C:/Users/Saurav/Desktop/Coursera")
tabAll <- read.table("household_power_consumption.txt",sep=";", header = TRUE, colClasses ="character")
tabAll$Date<-as.character(as.Date(tabAll$Date,format="%d/%m/%Y"))
tabAll_1<-tabAll[tabAll$Date=="2007-02-01",]
tabAll_2<-tabAll[tabAll$Date=="2007-02-02",]
tabAll_req<-rbind(tabAll_1,tabAll_2)
tabAll_req$Global_active_power<-as.numeric(tabAll_req$Global_active_power)
tabAll_req$Sub_metering_1<-as.numeric(tabAll_req$Sub_metering_1)
tabAll_req$Sub_metering_2<-as.numeric(tabAll_req$Sub_metering_2)
tabAll_req$Sub_metering_3<-as.numeric(tabAll_req$Sub_metering_3)
tabAll_req$Date<-as.Date(tabAll_req$Date,format="%Y-%m-%d")
tabAll_req$Datetime<-as.POSIXct(strptime(paste(tabAll_req$Date,tabAll_req$Time), "%Y-%m-%d %H:%M:%S"))
tabAll_req$Voltage<-as.numeric(tabAll_req$Voltage)
tabAll_req$Global_reactive_power<-as.numeric(tabAll_req$Global_reactive_power)


png(filename = "plot4.png", width = 480, height = 480,
    units = "px")
par(mfrow=c(2,2))
plot(tabAll_req$Datetime,tabAll_req$Global_active_power,type="l",main="",ylab="Global Active Power (Killowats)",xlab="")
plot(tabAll_req$Datetime,tabAll_req$Voltage,type="l",main="",ylab="Voltage",xlab="datetime")

plot(tabAll_req$Datetime,tabAll_req$Sub_metering_1,type="l",main="",ylab="Global Active Power (Killowats)",xlab="",pch=1)
#par(new=T,ann=FALSE)
lines(tabAll_req$Datetime,tabAll_req$Sub_metering_2,col="red",type="l")
lines(tabAll_req$Datetime,tabAll_req$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(tabAll_req$Datetime,tabAll_req$Global_reactive_power,type="l",main="",ylab="Global_reactive_power",xlab="datetime")

dev.off()