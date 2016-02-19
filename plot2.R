
if(!file.exists('household_power_consumption.txt')) {
  stop('You not the source data for this program. You can get them at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.') 
}

data <- read.table('household_power_consumption.txt', sep=';', na.strings='?', as.is=TRUE, header=TRUE)

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
filtered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png('plot2.png', width=480, height=480, bg="white")

plot(x=filtered$DateTime, y=filtered$Global_active_power, type="l",
     xlab='',
     ylab="Global Active Power (kilowatts)")
 

dev.off()
