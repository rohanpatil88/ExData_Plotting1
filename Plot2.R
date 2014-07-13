household_power_consumption <- read.csv("D:/household_power_consumption.txt", sep=";")
household_power_consumption[household_power_consumption == "?"] <- NA
household_power_consumption <- na.omit(household_power_consumption)
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format ='%d/%m/%Y')
power_set <- household_power_consumption[household_power_consumption$Date==("2007-02-01") |household_power_consumption$Date==("2007-02-02"),]
power_set$Date <- paste(power_set$Date,power_set$Time,sep = " ")
power_set$Date <- strptime(power_set$Date,"%Y-%m-%d %H:%M:%S")
with(power_set,plot(power_set$Date,Global_active_power,xlab="",ylab="Global Active Power",type="n"))
with(power_set,lines(power_set$Date,power_set$Global_active_power))
dev.copy(png,"plot2.png",width=480,height=480,units='px')
dev.off()
