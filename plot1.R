
#Read in the data and subset the needed data
dat<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = FALSE)
data<-subset(dat,Date=="1/2/2007" | Date=="2/2/2007" )

#Do necessary Conversions 
data$CombinedDate = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S") 
data$Global_active_power = as.double(data$Global_active_power)
data$Voltage = as.double(data$Voltage)
data$Global_reactive_power = as.double(data$Global_reactive_power)


#Question 1
windows()
hist(data$Global_active_power, breaks = 12, col="red", 
     xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()