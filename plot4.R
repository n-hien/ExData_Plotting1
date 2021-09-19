##read data from file .txt
energyData <- read.table(file = "household_power_consumption.txt", header = TRUE,
                         sep = ";")

energyData$Date <- as.Date(energyData$Date, format = "%d/%m/%Y")
##data just from the dates 2007-02-01 and 2007-02-02
required_data <- subset(energyData, Date == "2007-02-01" | Date == "2007-02-02")
##convert from integer to numeric
required_data$Global_active_power <- as.numeric(as.character(required_data$Global_active_power))
##convert the Date and Time variables to datetime
required_data$datetime <- paste(required_data$Date, required_data$Time)
required_data$datetime  <- strptime(required_data$datetime, format = "%Y-%m-%d %H:%M:%OS")
#plot
par(mfrow = c(2,2), mar = c(5,2,2,2))
#lefttop plot
plot(required_data$datetime, required_data$Global_active_power, 
     ylab = "Global Active Power", xlab = "", type = "l")
#righttop plot
with(required_data, plot (datetime, Voltage, type = "l"))
#leftbottom plot
with(required_data, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "",))
lines(required_data$datetime, required_data$Sub_metering_2, col = "red")
lines(required_data$datetime, required_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, cex = 0.7)
#rightbottom plot
with(required_data, plot (datetime, Global_reactive_power, type = "l"))
#save to png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()