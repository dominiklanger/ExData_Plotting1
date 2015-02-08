source("loadAndPrepareData.R")

filePath <- "./data/household_power_consumption.txt"
destFileName <- "plot1.png"

# Load data...
relevantData <- loadAndPrepareData(filePath)

# Create plot file...
png(filename = destFileName, width = 480, height = 480, units = "px") #Set graphics device to PNG.
par(bg = "transparent")
hist(relevantData$Global_active_power, col= "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off() #Leave PNG graphics device again.