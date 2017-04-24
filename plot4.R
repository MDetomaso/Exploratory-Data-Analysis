##########
# plot 4 #
##########

#read household consumption data and convert Date into "date" format
household_power_consumption <- read.csv("C:/Users/MDetomaso/Desktop/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
household_power_consumption$datetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <-strptime(household_power_consumption$Date, format="%d/%m/%Y")

#subset data
household_data<-household_power_consumption[household_power_consumption$Date >="2007-02-01" & household_power_consumption$Date <="2007-02-02",]

#build plot4
par(mfcol=c(2,2), mar=c(4,5,1,1))
plot(household_data$datetime, household_data$Global_active_power,  type="l", ylab="Global Active Power", xlab="")

household_data$Sub_metering_1 <- as.numeric(household_data$Sub_metering_1)
household_data$Sub_metering_2 <- as.numeric(household_data$Sub_metering_2)
household_data$Sub_metering_3 <- as.numeric(household_data$Sub_metering_3)
plot(household_data$datetime, household_data$Sub_metering_1,  type="l", ylab="Energy sub metering", xlab="")
lines(household_data$datetime, household_data$Sub_metering_2, col="red")
lines(household_data$datetime, household_data$Sub_metering_3, col="blue")
legend("topright", pch = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), ex.cs1, adj = c(0, 0.1), cex=0.50)

plot(household_data$datetime, household_data$Voltage,  type="l", ylab="Voltage", xlab="datetime")

plot(household_data$datetime, household_data$Global_reactive_power,  type="l", ylab="Global_reactive_power", xlab="datetime")

#export plot4 to png file
dev.copy(png, file="plot4.png")
dev.off() 
