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
##plot with type = l (line)
par(mar = c(3,5,2,2))
plot(required_data$datetime, required_data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
#save to png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()