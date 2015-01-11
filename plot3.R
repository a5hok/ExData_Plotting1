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

## Open plot3.png
png("plot3.png", height = 480, width = 480)
with(data, {
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="", col='black')
    lines(Sub_metering_2~Datetime, col='red')
    lines(Sub_metering_3~Datetime, col='blue')
})
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c('black','red','blue'), lty = 1, lwd = 1)

## Close the png file
dev.off()