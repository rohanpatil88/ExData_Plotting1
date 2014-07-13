household_power_consumption <- read.csv("D:/household_power_consumption.txt", sep=";")
household_power_consumption[household_power_consumption == "?"] <- NA
household_power_consumption <- na.omit(household_power_consumption)
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format ='%d/%m/%Y')
power_set <- household_power_consumption[household_power_consumption$Date==("2007-02-01") |household_power_consumption$Date==("2007-02-02"),]
power_set$Date <- paste(power_set$Date,power_set$Time,sep = " ")
power_set$Date <- strptime(power_set$Date,"%Y-%m-%d %H:%M:%S")
power_set$Sub_metering_1 <- as.numeric(as.character(power_set$Sub_metering_1))
power_set$Sub_metering_2 <- as.numeric(as.character(power_set$Sub_metering_2))
power_set$Sub_metering_3 <- as.numeric(as.character(power_set$Sub_metering_3))
with(power_set,plot(power_set$Date,power_set$Sub_metering_1,xlab="",ylab="Energy Sub metering",type="n"))
with(power_set,lines(power_set$Date,power_set$Sub_metering_1,col = "black"))
with(power_set,lines(power_set$Date,power_set$Sub_metering_2,col = "Red"))
with(power_set,lines(power_set$Date,power_set$Sub_metering_3,col = "Blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.col="black",bty = "o",cex = 0.8,border = "black",box.lty = 1,box.lwd = 1,pt.cex = 0.5)
dev.copy(png,"plot3.png",width=480,height=480,units='px')
dev.off()

