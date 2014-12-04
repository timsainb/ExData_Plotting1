# The files url
fileURL <- "household_power_consumption.txt"
# read the data
data <- read.table(fileURL, header = TRUE, sep=";", na.strings="?")
# subset to the days we are dealing with
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

rm(data)

# make the first variable sortable
Global_active_power <- as.numeric(newdata$Global_active_power)
png("plot1.png", width=480, height=480)

#create the first histogram
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off()

