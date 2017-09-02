
## load the data
data <- read.csv("household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data
datasub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Create datetime column
datasub$datetime <- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot 2
plot(datasub$datetime, as.numeric(as.character(datasub$Global_active_power)), type = "l", 
  xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()
