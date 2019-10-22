# Create a plot of Energy Sub Metering Vs. Time    
# read data from .txt file located in project folder
powerConsumption <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

# subset dataset to extract data in date range of 2007-02-01 to 2007-02-02
dates_subset <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset to extract time data and format them
dateData <- dates_subset$Date
timeData <- dates_subset$Time
date_and_time <- strptime(paste(dateData, timeData, sep=" "), "%d/%m/%Y %H:%M:%S")

# Subset to extract sub metering data 
sub_metering_1 <- as.numeric(dates_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(dates_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(dates_subset$Sub_metering_3)
    
# plot of global active power Vs. time 
png("plot3.png", width=480, height=480)
plot(date_and_time, sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(date_and_time, sub_metering_2, type="l", col="red")
lines(date_and_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3.5, col=c("black", "red", "blue"))
dev.off()
