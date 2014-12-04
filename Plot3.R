fileURL <- "household_power_consumption.txt"
# read the data
data <- read.table(fileURL, header = TRUE, sep=";", na.strings="?")
# subset to the days we are dealing with
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

rm(data)

png("plot3.png", width=480, height=480)

# gets the date and time
datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# makes the power info numeric
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

plot(datetime,newdata$Sub_metering_1,type="l",col="black", ylab="Energy sub metering", xlab = "")
lines(datetime,newdata$Sub_metering_2,type="l",col="red")
lines(datetime,newdata$Sub_metering_3,type="l",col="blue")
#adds a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
