
if(!file.exists('household_power_consumption.txt')) {
  stop('You not the source data for this program. You can get them at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.') 
}

data <- read.table('household_power_consumption.txt', sep=';', na.strings='?', as.is=TRUE, header=TRUE)

data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %X')
dateFrom <- as.POSIXct("2007-02-01")
dateTo <- as.POSIXct("2007-02-02")
interval <- interval(dateFrom, dateTo)
filtered = data[data$DateTime %within% int,]

png('plot1.png', width=480, height=480, bg="white")

# Plot 1
hist(filtered$Global_active_power,  xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

dev.off()
