data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
sub_data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
sub_data$DateTime <- as.POSIXct(paste(sub_data$Date, sub_data$Time))

# Plot2.png
png(filename = "plot2.png", width = 480, height = 480)
plot(sub_data$DateTime, sub_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()