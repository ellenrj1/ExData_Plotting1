data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
days = data[66637:69516,]
days = within(days, { DateTime=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })

png(filename = "plot2.png")

plot(days$DateTime, days$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()