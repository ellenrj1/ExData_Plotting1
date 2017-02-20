data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
days = data[66637:69516,]
days = within(days, { DateTime=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })

png(filename = "plot4.png")

par(mfrow = c(2,2))
plot(days$DateTime, days$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(days$DateTime, days$Voltage, type = "l",
     ylab = "Voltage", xlab = "DateTime")

plot(days$DateTime, days$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(days$DateTime, days$Sub_metering_2, col = "red")
lines(days$DateTime, days$Sub_metering_3, col = "blue")

plot(days$DateTime, days$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power", xlab = "DateTime")

dev.off()