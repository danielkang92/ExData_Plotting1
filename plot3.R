
#Read in the data and subset the needed data
dat<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = FALSE)
data<-subset(dat,Date=="1/2/2007" | Date=="2/2/2007" )

#Do necessary Conversions 
data$CombinedDate = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S") 
data$Global_active_power = as.double(data$Global_active_power)
data$Voltage = as.double(data$Voltage)
data$Global_reactive_power = as.double(data$Global_reactive_power)

windows()
with(data, plot(CombinedDate, Sub_metering_1, type="l", 
                xlab="",ylab="Energy sub metering",col="black"))
with(data, lines(CombinedDate, Sub_metering_2,type="l",col="red"))
with(data, lines(CombinedDate, Sub_metering_3,type="l",col="blue"))
legend(x="topright",col=c("black","red","blue"),lty=rep(1,3),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()