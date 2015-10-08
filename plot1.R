alldata = read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime = strptime(paste(as.character(data$Date), as.character(data$Time), sep = " "),"%d/%m/%Y %H:%M:%S")
windows(5,5)
hist(data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

