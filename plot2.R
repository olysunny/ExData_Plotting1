png("plot2.png", width=480, height=480)
library(dplyr)
#read data and filt
data<-read.table("household_power_consumption.txt",nrow=1000000,sep=";",head=T,na.strings="?")
data3<-mutate(data,time2=paste(Date,Time))
data3$Date<-as.POSIXct(strptime(data3$time2,"%d/%m/%Y %H:%M:%S"))
data3<-data3[(data3$Date >= "2007-02-01" 
             & data3$Date <="2007-02-03"),]
#plot
plot(data3$Date,as.numeric(data3$Global_active_power),
     type="l",xlab = NA,ylab = "Global Active Power (kilowattz)")
dev.off()    
     
     
     