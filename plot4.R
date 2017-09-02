## load the data
data <- read.csv("household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data
datasub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Create datetime column
datasub$datetime <- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot 4 
par(mfrow = c(2,2))
plot(datasub$datetime, as.numeric(as.character(datasub$Global_active_power)), type = "l", 
     xlab = "", ylab = "Global Active Power")
plot(datasub$datetime, as.numeric(as.character(datasub$Voltage)), type = "l", 
     xlab = "datetime", ylab = "Voltage")
plot(datasub$datetime, datasub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(datasub$datetime, datasub$Sub_metering_2, type = "l", col = "red")
points(datasub$datetime, datasub$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))
View(datasub)
plot(datasub$datetime, as.numeric(as.character(datasub$Global_reactive_power)), type = "l", 
       xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, "plot4.png")
dev.off()
