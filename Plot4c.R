data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
sub_data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
sub_data$DateTime <- as.POSIXct(paste(sub_data$Date, sub_data$Time))

# Plot4.png (Panel 2x2)
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Gráfico 1
plot(sub_data$DateTime, sub_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Gráfico 2
plot(sub_data$DateTime, sub_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Gráfico 3
plot(sub_data$DateTime, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sub_data$DateTime, sub_data$Sub_metering_2, col = "red")
lines(sub_data$DateTime, sub_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# Gráfico 4
plot(sub_data$DateTime, sub_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()