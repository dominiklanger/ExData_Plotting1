source("loadAndPrepareData.R")

filePath <- "./data/household_power_consumption.txt"
destFileName <- "plot2.png"

# Load data:
relevantData <- loadAndPrepareData(filePath)

# Create plot file...
originalLocale = Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")  # Set the locale to English to make sure that weekdays are in the proper language:
png(filename = destFileName, width = 480, height = 480, units = "px") #Set graphics device to PNG.
par(bg = "transparent")
with(relevantData, plot(Time, Global_active_power, type = "l", main ="", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off() #Leave PNG graphics device again.
Sys.setlocale("LC_TIME", originalLocale) # Set locale back to original