NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#calculate the total emissions of each year
NEI_total <- aggregate(Emissions ~ year, data = NEI, sum)
#plot
with(NEI_total, plot(year, Emissions, type = "o", main = "Total PM2.5 emission from 1999 to 2008",
                     xlab = "Year", ylab = "cum.  PM2.5 Emissions", col = "red", lwd = 2))
#save to file png
dev.copy(png, file="plot1.png", width=600, height=480 )
dev.off()