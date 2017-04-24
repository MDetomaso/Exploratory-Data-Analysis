##########
# plot 3 #
##########

#read household consumption data and convert Date into "date" format
household_power_consumption <- read.csv("C:/Users/MDetomaso/Desktop/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
household_power_consumption$datetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <-strptime(household_power_consumption$Date, format="%d/%m/%Y")

#subset data
household_data<-household_power_consumption[household_power_consumption$Date >="2007-02-01" & household_power_consumption$Date <="2007-02-02",]

#build plot3
par(mfrow=c(1,1), mar=c(3,5,2,2))
household_data$Sub_metering_1 <- as.numeric(household_data$Sub_metering_1)
household_data$Sub_metering_2 <- as.numeric(household_data$Sub_metering_2)
household_data$Sub_metering_3 <- as.numeric(household_data$Sub_metering_3)
plot(household_data$datetime, household_data$Sub_metering_1,  type="l", ylab="Energy sub metering", xlab="")
lines(household_data$datetime, household_data$Sub_metering_2, col="red")
lines(household_data$datetime, household_data$Sub_metering_3, col="blue")
legend("topright", pch = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)

#export plot3 to png file
dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off() 
