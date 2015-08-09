
#Read in the data and subset the needed data
dat<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = FALSE)
data<-subset(dat,Date=="1/2/2007" | Date=="2/2/2007" )

#Do necessary Conversions 
data$CombinedDate = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S") 
data$Global_active_power = as.double(data$Global_active_power)
data$Voltage = as.double(data$Voltage)
data$Global_reactive_power = as.double(data$Global_reactive_power)

windows()
par(mfrow=c(2,2))
with(data,plot(CombinedDate, Global_active_power,type="l",
               xlab="",ylab="Global Active Power"))
with(data,plot(CombinedDate, Voltage,type="l",
               xlab="datetime",ylab="Voltage"))
with(data, plot(CombinedDate, Sub_metering_1, type="l", 
                xlab="",ylab="Energy sub metering",col="black"))
with(data, lines(CombinedDate, Sub_metering_2,type="l",col="red"))
with(data, lines(CombinedDate, Sub_metering_3,type="l",col="blue"))
legend(x="topright",col=c("black","red","blue"),lty=rep(1,3),box.lty=0,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(data, plot(CombinedDate,Global_reactive_power,type="l",
                xlab="datetime",ylab="Global_reactive_power"))
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()