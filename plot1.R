## load the data
data <- read.csv("household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data
datasub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 1
hist(as.numeric(as.character(datasub$Global_active_power)), 
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, "plot1.png")
dev.off()
