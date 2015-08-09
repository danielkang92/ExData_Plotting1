
#Read in the data and subset the needed data
dat<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = FALSE)
data<-subset(dat,Date=="1/2/2007" | Date=="2/2/2007" )

#Do necessary Conversions 
data$CombinedDate = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S") 
data$Global_active_power = as.double(data$Global_active_power)
data$Voltage = as.double(data$Voltage)
data$Global_reactive_power = as.double(data$Global_reactive_power)

#Question 2
windows()
#Necessay for my computer is set in other lanugage
Sys.setlocale("LC_TIME", "English") 
with(data,plot(CombinedDate, Global_active_power, type="l",
               xlab="",ylab="Global Active Power(kilowatts)"))
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()