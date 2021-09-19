##read data from file .txt
energyData <- read.table(file = "household_power_consumption.txt", header = TRUE,
                   sep = ";")

energyData$Date <- as.Date(energyData$Date, format = "%d/%m/%Y")
##data just from the dates 2007-02-01 and 2007-02-02
required_data <- subset(energyData, Date == "2007-02-01" | Date == "2007-02-02")
##convert from integer to numeric
required_data$Global_active_power <- as.numeric(as.character(required_data$Global_active_power))
##plot with histogram
par(mar = c(5,5,3,1))
hist(required_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")
##save to file png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
