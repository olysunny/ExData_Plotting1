png("plot1.png", width=480, height=480)
data<-read.table("household_power_consumption.txt",nrow=1000000,sep=";",head=T,na.strings="?")

data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))
data2<-data[data$Date %in% c(as.Date("2007-02-02"),as.Date("2007-02-01")),]
hist(as.numeric(data2$Global_active_power),col="red",main="Global Active Power", xlab = "Global Active Power (kilowattz)")
dev.off()