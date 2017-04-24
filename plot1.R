##########
# plot 1 #
##########

#read household consumption data and convert Date into "date" format
household_power_consumption <- read.csv("C:/Users/MDetomaso/Desktop/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
household_power_consumption$datetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <-strptime(household_power_consumption$Date, format="%d/%m/%Y")

#subset data
household_data<-household_power_consumption[household_power_consumption$Date >="2007-02-01" & household_power_consumption$Date <="2007-02-02",]

#build plot1
hist(household_data$Global_active_power, col="red", xlab = "Global Active Power", main = "Global Active Power")

#export plo1 to png file
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off() 
