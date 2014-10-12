plot3 <- function(data_file) {

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

png(file = "plot3.png")

## Finally plot - Sub_metering_1  
plot(combine_date_time, data$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering")

## Add Sub_metering_2
lines(combine_date_time, data$Sub_metering_2, type="l", xlab = " ", col = "red")

## Add Sub_metering_3
lines(combine_date_time, data$Sub_metering_3, type="l", xlab = " ", col = "blue")

## Adding Legend for the plotted graph 
legend("topright", lwd = 2, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Close the PNG Device
dev.off()

}