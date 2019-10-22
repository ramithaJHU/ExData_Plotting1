# Create a histogram of Global Active Power Consumption Vs. Time    
#read data from .txt file located in project folder
powerConsumption <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

#subset dataset to extract data in date range of 2007-02-01 to 2007-02-02
subsetData <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

#remove rows having NA values
energyData <-na.omit(energyData)

# histogram of global active power 
png("plot1.png", width=680, height=480)
lobalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hist(lobalActivePower, xlab="Global Active Power (kW)",ylab="Frequency (Hz)",main="Fig01: Histogram of Global Active Power Consumption Between 2007-02-01 and 2007-02-02", col="red", border="black")
dev.off()