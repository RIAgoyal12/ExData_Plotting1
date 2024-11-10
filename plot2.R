power_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
data_filtered <- subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02")
data_filtered$DateTime <- strptime(paste(data_filtered$Date, data_filtered$Time), format="%Y-%m-%d %H:%M:%S")
# Plot 2: Global Active Power over Time
png("plot2.png", width=480, height=480)
plot(data_filtered$DateTime, data_filtered$Global_active_power, type="l", col="black", xlab="DateTime", ylab="Global Active Power (kilowatts)", main="Global Active Power over Time")
dev.off()
