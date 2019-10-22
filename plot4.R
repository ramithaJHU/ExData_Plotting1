# Create 4 plots GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time in a single plot space  
# read data from .txt file located in project folder
powerConsumption <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

# subset dataset to extract data in date range of 2007-02-01 to 2007-02-02
dates_subset <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset to extract only the Global Active Power Data
global_active_power <- as.numeric(dates_subset$Global_active_power)

# Subset to extract only the Global Rective Power Data
global_reactive_power <- as.numeric(dates_subset$Global_reactive_power)

# Subset to extract Voltage Data
voltage <- as.numeric(dates_subset$Voltage)

# Subset to extract time data and format them
date_data <- dates_subset$Date
time_data <- dates_subset$Time
date_and_time <- strptime(paste(dateData, timeData, sep=" "), "%d/%m/%Y %H:%M:%S")

# Format plotting area size and splitting into 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Create plots
plot(date_and_time, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_and_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_and_time, sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(date_and_time, sub_metering_2, type="l", col="red")
lines(date_and_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_and_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
