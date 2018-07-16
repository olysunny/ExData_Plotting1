png("plot3.png", width=480, height=480)
library(dplyr)

#read and select
data<-read.table("household_power_consumption.txt",nrow=1000000,sep=";",head=T,na.strings="?")
data3<-mutate(data,time2=paste(Date,Time))
data3$Date<-as.POSIXct(strptime(data3$time2,"%d/%m/%Y %H:%M:%S"))
data3<-data3[(data3$Date >= "2007-02-01" 
              & data3$Date <="2007-02-03"),]

#plot
plot(data3$Date,as.numeric(data3$Sub_metering_1),col="black",
     type="l",xlab = NA,ylab = "Energy sub metering")
lines(data3$Date,as.numeric(data3$Sub_metering_2),col="red")
lines(data3$Date,as.numeric(data3$Sub_metering_3),col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1,
       lty=1)
dev.off()