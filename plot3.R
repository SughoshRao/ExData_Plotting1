#Please use: source("plot3.R") in R to recreate plot3.png after placing this file in current working directory

#reading data from file
dataFile <- "household_power_consumption.txt"
reqdData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #assuming that the txt file is present in current working directory
subSetData <- reqdData[reqdData$Date %in% c("1/2/2007","2/2/2007") ,]


globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering_1 <- as.numeric(subSetData$Sub_metering_1)
subMetering_2 <- as.numeric(subSetData$Sub_metering_2)
subMetering_3 <- as.numeric(subSetData$Sub_metering_3)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plotting graph
png("plot3.png", width=480, height=480)
plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()