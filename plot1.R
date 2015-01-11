## This code assumes the unzipped file - 'household_power_consumption.txt' exists in the same location as the R code

install.packages("sqldf")
library(sqldf)

## Selecting data from the dates 2007-02-01 and 2007-02-02
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", sql)

## Open plot1.png
png("plot1.png", height = 480, width = 480)

## Plot 1
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Close the ong file
dev.off()