source("loadAndPrepareData.R")

filePath <- "./data/household_power_consumption.txt"
destFileName <- "plot4.png"

# Load data...
relevantData <- loadAndPrepareData(filePath)

# Create plot file...
originalLocale = Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")  # Set the locale to English to make sure that weekdays are in the proper language:
png(filename = destFileName, width = 480, height = 480, units = "px") #Set graphics device to PNG.
par(mfrow = c(2,2), bg = "transparent") # Set the multi-graph layout (2 times 2).
with(relevantData, {
      plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
      plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
      plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
      lines(Time, Sub_metering_2, type = "l", col = "red")
      lines(Time, Sub_metering_3, type = "l", col = "blue")
      legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off() #Leave PNG graphics device again.
Sys.setlocale("LC_TIME", originalLocale) # Set locale back to original