plot2 <- function(data_file) {

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

png(file = "plot2.png")

## Finally plot it with type - lines 
plot(combine_date_time, data$Global_active_power, type="l", xlab = " ", ylab ="Global Active Power (kilowatts) ")

## Close the PNG Device
dev.off()

}