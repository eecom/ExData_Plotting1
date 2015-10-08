alldata = read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime = strptime(paste(as.character(data$Date), as.character(data$Time), sep = " "),"%d/%m/%Y %H:%M:%S")

windows(5,5)
par(bg="white", mfrow = c(2, 2))
with(data, {
	plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power")
	lines(DateTime, Global_active_power, type="l")

	plot(DateTime, Voltage, type="n", xlab="datetime", ylab="Voltage")
	lines(DateTime, Voltage, type="l")

	plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
	lines(DateTime, Sub_metering_1, col = "black")
	lines(DateTime, Sub_metering_2, col = "red")
	lines(DateTime, Sub_metering_3, col = "blue")
	legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

	plot(DateTime, Global_reactive_power, type="n", xlab="datetime")
	lines(DateTime, Global_reactive_power, type="l")
})

dev.copy(png, file = "plot4.png")
dev.off()

