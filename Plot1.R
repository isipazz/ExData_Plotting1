# Cargar datos y filtrar fechas del 1 y 2 de febrero de 2007
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
sub_data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot1.png
png(filename = "plot1.png", width = 480, height = 480)
hist(sub_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()