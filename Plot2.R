fileURL <- "household_power_consumption.txt"
# read the data
data <- read.table(fileURL, header = TRUE, sep=";", na.strings="?")
# subset to the days we are dealing with
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

rm(data)

#makes numeric

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Global_active_power <- as.numeric(newdata$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)")

dev.off()