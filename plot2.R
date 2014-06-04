## Read 5 rows and get classes for full read
power5rows <- read.table("household_power_consumption.txt",  sep = ";",header = TRUE, nrows = 5)
classes <- sapply(power5rows, class)
## Read data
powerData <- read.table("household_power_consumption.txt",  sep = ";", header = TRUE, colClasses = classes, na.strings = c("?"), nrows = 2075259)
## Subset needed dates
powerData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]
## Format DateTime
dateTime <- paste( powerData$Date, powerData$Time )
powerData$DateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")

## Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(
    powerData$DateTime, 
    powerData$Global_active_power, 
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)")
dev.off()
