data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
days = data[66637:69516,]
days = within(days, { DateTime=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })

png(filename = "plot1.png")

hist(days$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()