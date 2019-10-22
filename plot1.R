# Create a histogram of Global Active Power Consumption between 2007-02-01 and 2007-02-02
#read data from .txt file located in project folder
powerConsumption <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

#subset dataset to extract data in date range of 2007-02-01 to 2007-02-02
dates_subset <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset to extract only the Active Power Data
global_active_power <- as.numeric(dates_subset$Global_active_power)

#remove rows having NA values
global_active_power <-na.omit(global_active_power)

# histogram of global active power 
png("plot1.png", width=480, height=480)

hist(global_active_power, xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power", col="red", border="black")
dev.off()