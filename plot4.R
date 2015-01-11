## This code assumes the unzipped file - 'household_power_consumption.txt' exists in the same location as the R code

install.packages("sqldf")
library(sqldf)

## Selecting data from the dates 2007-02-01 and 2007-02-02
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", sql)

## Converting dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Open plot4.png
png("plot4.png", height = 480, width = 480)

# multiplot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime, col='Red')
    lines(Sub_metering_3~Datetime, col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=0.5, bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
})

## Close the png file
dev.off()