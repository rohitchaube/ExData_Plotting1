plot4 <- function(data_file) {

data <- data.frame()
combine_date_time <- data.frame()

file_read <- file(data_file)
data <- read.csv.sql( sql="select * from file_read where Date = '1/2/2007' or Date = '2/2/2007'",
			    sep = ";",
                      header=TRUE)

close(file_read)

## Combine Date and Time 
combine_date_time <- paste(data$Date, data$Time)

## Convert 
combine_date_time <- strptime(combine_date_time, "%d/%m/%Y  %H:%M:%S")

## Output PNG file 
png(file = "plot4.png")

## Have 4 graphs on the same PNG file creating the layout 
par(mfrow = c(2, 2))

## Plot 1 - upper leftmost corner 
plot(combine_date_time, data$Global_active_power, type="l", xlab = " ", ylab ="Global Active Power (kilowatts) ")

## Plot 2 - upper rightmost corner  
plot(combine_date_time, data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

## Plot 3 - lower leftmost corner  
plot(combine_date_time, data$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering")
lines(combine_date_time, data$Sub_metering_2, type="l", xlab = " ", col = "red")
lines(combine_date_time, data$Sub_metering_3, type="l", xlab = " ", col = "blue")
legend("topright", lwd = 2, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## Plot 4 - lower rightmost corner  
plot(combine_date_time, data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")


## Close the PNG Device
dev.off()

}