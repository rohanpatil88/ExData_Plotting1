household_power_consumption <- read.csv("D:/household_power_consumption.txt", sep=";") #Loading data from txt file
household_power_consumption[household_power_consumption == "?"] <- NA #Replacing the ? with NA
household_power_consumption <- na.omit(household_power_consumption) #Removing the NA values
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power)) #converting factor to numeric
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format ='%d/%m/%Y') #Converting Factor to date 
power_set <- household_power_consumption[household_power_consumption$Date==("2007-02-01") |household_power_consumption$Date==("2007-02-02"),] #creating a subset with given conditions
power_set$Date <- paste(power_set$Date,power_set$Time,sep = " ") #Concatenation
power_set$Date <- strptime(power_set$Date,"%Y-%m-%d %H:%M:%S")#formating Date  
hist(power_set$Global_active_power,xlab = "Global Active Power(kilowatts)",main = "Global Active Power",col = "Red") #Plotting histogram
dev.copy(png,"plot1.png",width=480,height=480,units='px') #creating png file
dev.off()
