household_power_consumption <- read.csv("D:/household_power_consumption.txt", sep=";") #Loading data from txt file
household_power_consumption[household_power_consumption == "?"] <- NA #Replacing the ? with NA
household_power_consumption <- na.omit(household_power_consumption) #Removing the NA values
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power)) #converting factor to numeric
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format ='%d/%m/%Y') #Converting Factor to date 
power_set <- household_power_consumption[household_power_consumption$Date==("2007-02-01") |household_power_consumption$Date==("2007-02-02"),] #creating a subset with given conditions
power_set$Date <- paste(power_set$Date,power_set$Time,sep = " ") #Concatenation
power_set$Date <- strptime(power_set$Date,"%Y-%m-%d %H:%M:%S")#Formating Date
with(power_set,plot(power_set$Date,Global_active_power,xlab="",ylab="Global Active Power",type="n")) #Ploting 
with(power_set,lines(power_set$Date,power_set$Global_active_power))
dev.copy(png,"plot2.png",width=480,height=480,units='px') # Creating png file
dev.off()
