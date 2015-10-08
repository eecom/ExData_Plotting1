alldata = read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime = strptime(paste(as.character(data$Date), as.character(data$Time), sep = " "),"%d/%m/%Y %H:%M:%S")

windows(5,5)
with(data, plot(DateTime, Sub_metering_1, type="n", cex.lab=0.8, cex.axis=0.8, xlab="", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1, col = "black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), cex=0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

