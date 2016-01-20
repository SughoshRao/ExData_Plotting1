#Please use: source("plot4.R") in R to recreate plot4.png after placing this file in current working directory

#reading data from file
dataFile <- "household_power_consumption.txt"
reqdData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #assuming that the txt file is present in current working directory
subSetData <- reqdData[reqdData$Date %in% c("1/2/2007","2/2/2007") ,]

#setting variables
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering_1 <- as.numeric(subSetData$Sub_metering_1)
subMetering_2 <- as.numeric(subSetData$Sub_metering_2)
subMetering_3 <- as.numeric(subSetData$Sub_metering_3)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plotting graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()