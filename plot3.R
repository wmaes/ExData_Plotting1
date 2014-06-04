## Read 5 rows and get classes for full read
power5rows <- read.table("household_power_consumption.txt",  sep = ";",header = TRUE, nrows = 5)
classes <- sapply(power5rows, class)
## Read data
powerData <- read.table("household_power_consumption.txt",  sep = ";", header = TRUE, colClasses = classes, na.strings = c("?"), nrows = 2075259)
## Subset needed dates
powerData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]
## Format DateTime
dateTime <- paste( powerData$Date, powerData$Time )
powerData$DateTime <- strptime( dateTime, format = "%d/%m/%Y %H:%M:%S" )

## Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(powerData$DateTime, 
     powerData$Sub_metering_1, 
     type = "n",
     xlab = "", 
     ylab = "Energy sub metering" 
)

## Add lines
lines(powerData$DateTime, powerData$Sub_metering_1, col = "black")
lines(powerData$DateTime, powerData$Sub_metering_2, col = "red")
lines(powerData$DateTime, powerData$Sub_metering_3, col = "blue")

## Add legend
legend(
    "topright", 
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    lty = c(1, 1, 1), 
    lwd = c(2, 2, 2),
    col = c("black", "red", "blue")
)
dev.off()
