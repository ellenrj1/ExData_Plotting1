data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
days = data[66637:69516,]
days = within(days, { DateTime=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })

png(filename = "plot3.png")

plot(days$DateTime, days$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(days$DateTime, days$Sub_metering_2, col = "red")
lines(days$DateTime, days$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()