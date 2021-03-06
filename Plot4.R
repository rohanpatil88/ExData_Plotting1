household_power_consumption <- read.csv("D:/household_power_consumption.txt", sep=";") #Loading data from txt file
household_power_consumption[household_power_consumption == "?"] <- NA #Replacing the ? with NA
household_power_consumption <- na.omit(household_power_consumption) #Removing the NA values
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power)) #converting factor to numeric
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format ='%d/%m/%Y') #Converting Factor to date 
power_set <- household_power_consumption[household_power_consumption$Date==("2007-02-01") |household_power_consumption$Date==("2007-02-02"),] #creating a subset with given conditions
power_set$Date <- paste(power_set$Date,power_set$Time,sep = " ") #Concatenation
power_set$Date <- strptime(power_set$Date,"%Y-%m-%d %H:%M:%S")#Formating Date
power_set$Sub_metering_1 <- as.numeric(as.character(power_set$Sub_metering_1))#Converting factor into numeric
power_set$Sub_metering_2 <- as.numeric(as.character(power_set$Sub_metering_2))#Converting factor into numeric
power_set$Sub_metering_3 <- as.numeric(as.character(power_set$Sub_metering_3))#Converting factor into numeric
par(mar = c(4.1,4.1,2.2,2.2)) #editing margins
par(mfrow = c(2,2)) #setting partitions
with(power_set,plot(power_set$Date,Global_active_power,xlab="",ylab="Global Active Power",type="n"))
with(power_set,lines(power_set$Date,power_set$Global_active_power))
power_set$Voltage <- as.numeric(as.character(power_set$Voltage))#converting factor into numeric
with(power_set,plot(power_set$Date,Voltage,xlab="datetime",ylab="Voltage",type="n"))
with(power_set,lines(power_set$Date,power_set$Voltage))
with(power_set,plot(power_set$Date,power_set$Sub_metering_1,xlab="",ylab="Energy Sub metering",type="n"))
with(power_set,lines(power_set$Date,power_set$Sub_metering_1,col = "black"))
with(power_set,lines(power_set$Date,power_set$Sub_metering_2,col = "Red"))
with(power_set,lines(power_set$Date,power_set$Sub_metering_3,col = "Blue"))
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.3 ,pt.cex = 5,lwd = 1,inset = 0.05,bty = "n")
power_set$Global_reactive_power <- as.numeric(as.character(power_set$Global_reactive_power))
with(power_set,plot(power_set$Date,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n"))
with(power_set,lines(power_set$Date,power_set$Global_reactive_power))
dev.copy(png,"plot4.png",width=480,height=480,units='px')#creating png file
dev.off()
