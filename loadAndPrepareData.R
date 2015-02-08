
## loadAndPrepareData loads the file specified by the argument filePath, assuming that it
## contains the "Individual household electric power consumption Data Set".
## It also tidies 

loadAndPrepareData <- function(filePath) {     
      # Determine the data types to speed of loading...
      initial <- read.table(filePath, header = TRUE, sep = ";", na.strings = "?", nrows = 100)
      classes <- sapply(initial, class)
      # Load the data from file:
      tabAll <- read.table(filePath, header = TRUE, colClasses = classes, sep = ";", na.strings = "?", nrows = 2075259)
       
      ## Improve date and time formatting...
      tabAll$Time <- strptime(paste(tabAll$Date, tabAll$Time), format = "%d/%m/%Y %H:%M:%S")
      tabAll$Date <- as.Date(tabAll$Date, format = "%d/%m/%Y")
      
      # Return only the data from February 1 to February 2, 2007:
      relevantData <- tabAll[tabAll$Date == as.Date("2007-02-01") | tabAll$Date == as.Date("2007-02-02"),]
      relevantData
}