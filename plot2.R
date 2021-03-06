alldata = read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime = strptime(paste(as.character(data$Date), as.character(data$Time), sep = " "),"%d/%m/%Y %H:%M:%S")

windows(5,5)
par(bg="white")

with(data, {
	plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
	lines(DateTime, Global_active_power, type="l")
})

dev.copy(png, file = "plot2.png")
dev.off()
