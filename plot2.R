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

## Open plot2.png
png("plot2.png", height = 480, width = 480)

## Plot 2
plot(data$Global_active_power~SSDateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Close the png file
dev.off()