source("loadAndPrepareData.R")

filePath <- "./data/household_power_consumption.txt"
destFileName <- "plot3.png"

# Load data...
relevantData <- loadAndPrepareData(filePath)

# Create plot file...
originalLocale = Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")  # Set the locale to English to make sure that weekdays are in the proper language:
png(filename = destFileName, width = 480, height = 480, units = "px") #Set graphics device to PNG.
par(bg = "transparent")
with(relevantData, {
      plot(Time, Sub_metering_1, type = "l", main ="", xlab = "", ylab = "Energy sub metering")
      lines(Time, Sub_metering_2, type = "l", col = "red")
      lines(Time, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() #Leave PNG graphics device again.
Sys.setlocale("LC_TIME", originalLocale) # Set locale back to original