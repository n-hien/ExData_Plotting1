#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter the data of Baltimore City, Maryland (fips == "24510")
Baltimore <- NEI[NEI$fips ==24510,]
#calculate the total emissions of each year in Baltimore Citz, Maryland
Baltimore_total <- aggregate(Emissions ~ year, data = Baltimore, sum)
#plot
with(Baltimore_total, plot(year, Emissions, type = "o", main = "Total PM2.5 emission from 1999 to 2008 of Baltimore City, Maryland",
                     xlab = "Year", ylab = "cum.  PM2.5 Emissions", col = "red", lwd = 2))
#save to file png
dev.copy(png, file="plot2.png", width=600, height=480 )
dev.off()