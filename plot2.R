# Create a plot of Global Active Power Consumption Vs. Time    
#read data from .txt file located in project folder
powerConsumption <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

#subset dataset to extract data in date range of 2007-02-01 to 2007-02-02
dates_subset <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset to extract only the Active Power Data
global_active_power <- as.numeric(dates_subset$Global_active_power)

# Subset to extract time data and format them
dateData <- dates_subset$Date
timeData <- dates_subset$Time
date_and_time <- strptime(paste(dateData, timeData, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot of global active power Vs. time 
png("plot2.png", width=480, height=480)
plot(date_and_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()