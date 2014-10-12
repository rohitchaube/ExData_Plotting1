plot1 <- function(data_file) {

data <- data.frame()

data <- read.csv.sql( file=data_file,
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)

png(file = "plot1.png")

##with(data, hist(data$Global_active_power, col=c("red"),xlab="Global Active Power (kilowatts)", main="Global Active Power"))
hist(data$Global_active_power, col=c("red"),xlab="Global Active Power (kilowatts)", main="Global Active Power")


## Copy plot to plot1.png file 
##dev.copy(png, file = "plot1.png")

## Close the PNG Device
dev.off()

}