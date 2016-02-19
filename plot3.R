if(!file.exists('household_power_consumption.txt')) {
  stop('You not the source data for this program. You can get them at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.') 
}

data <- read.table('household_power_consumption.txt', sep=';', na.strings='?', as.is=TRUE, header=TRUE)

data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %X')
filtered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png('plot3.png', width=480, height=480, bg="white")

plot(x=filtered$DateTime, y=filtered$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=filtered$DateTime, y=filtered$Sub_metering_2, col="red")
lines(x=filtered$DateTime, y=filtered$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))

dev.off()
