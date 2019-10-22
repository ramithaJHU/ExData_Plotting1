# Create a plot of Global Active Power Consumption Vs. Time    
#read data from .txt file located in project folder
powerConsumption <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

#subset dataset to extract data in date range of 2007-02-01 to 2007-02-02
subsetDates <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset to extract only the Active Power Data
globalActivePower <- as.numeric(subsetDates$Global_active_power)

# Subset to extract time data and format them
dateData <- subsetDates$Date
timeData <- subsetDates$Time
dateTime <- strptime(paste(dateData, timeData, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot of global active power Vs. time 
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()