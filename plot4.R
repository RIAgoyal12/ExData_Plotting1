power_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
data_filtered <- subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02")
data_filtered$DateTime <- strptime(paste(data_filtered$Date, data_filtered$Time), format="%Y-%m-%d %H:%M:%S")

# Load necessary libraries
data_filtered <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
data_filtered$Date <- as.Date(data_filtered$Date, format="%d/%m/%Y")
data_filtered <- subset(data_filtered, Date >= "2007-02-01" & Date <= "2007-02-02")
data_filtered$DateTime <- strptime(paste(data_filtered$Date, data_filtered$Time), format="%Y-%m-%d %H:%M:%S")

# Create a 2x2 grid for the plots
png("plot3.png", width=480, height=480)
par(mfrow=c(2,2))  # 2 rows and 2 columns layout

# Plot 1: Global Active Power Histogram
hist(data_filtered$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Plot 2: Global Active Power over Time
plot(data_filtered$DateTime, data_filtered$Global_active_power, type="l", col="black", xlab="DateTime", ylab="Global Active Power (kilowatts)")

# Plot 3: Voltage over Time
plot(data_filtered$DateTime, data_filtered$Sub_metering_1, type="l", col="black", xlab="DateTime", ylab="Energy Sub-metering (watt-hour)")
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
# Plot 4: Global Reactive Power over Time (Global Reactive Power vs DateTime)
plot(data_filtered$DateTime, data_filtered$Global_reactive_power, type="l", col="black", xlab="DateTime", ylab="Global_Reactive_Power")

# Close the PNG device
dev.off()
