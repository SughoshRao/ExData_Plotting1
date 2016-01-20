#Please use: source("plot2.R") in R to recreate plot2.png after placing this file in current working directory

#reading data from file
dataFile <- "household_power_consumption.txt"
reqdData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #assuming that the txt file is present in current working directory
subSetData <- reqdData[reqdData$Date %in% c("1/2/2007","2/2/2007") ,]

#setting variables
globalActivePower <- as.numeric(subSetData$Global_active_power)

#plotting graph
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()