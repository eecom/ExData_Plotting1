alldata = read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime = strptime(paste(as.character(data$Date), as.character(data$Time), sep = " "),"%d/%m/%Y %H:%M:%S")

windows(5,5)
par(mfrow = c(2, 2), mar = c(1, 1, 1))
with(data, {
	plot(DateTime, Global_active_power, type="n", cex.lab=0.7, cex.axis=0.7, xlab="", ylab="Global Active Power (kilowatts)")
	lines(DateTime, Global_active_power, type="l")
})
with(data, {
	plot(DateTime, Voltage, type="n", cex.lab=0.7, cex.axis=0.7, xlab="datetime", ylab="Voltage")
	lines(DateTime, Voltage, type="l")
})
with(data, {
	plot(DateTime, Sub_metering_1, type="n", cex.lab=0.7, cex.axis=0.7, xlab="", ylab="Energy sub metering")
	lines(DateTime, Sub_metering_1, col = "black")
	lines(DateTime, Sub_metering_2, col = "red")
	lines(DateTime, Sub_metering_3, col = "blue")
})
legend("topright", lty=1, col = c("black", "red", "blue"), cex=0.7, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
with(data, {
	plot(DateTime, Global_reactive_power, type="n", cex.lab=0.7, cex.axis=0.7, xlab="datetime")
	lines(DateTime, Global_reactive_power, type="l")
})
