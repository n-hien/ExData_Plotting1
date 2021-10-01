#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter the data of Baltimore City, Maryland (fips == "24510") with emissions from motor vehicle sources 
Baltimore_motor <- NEI[NEI$fips == "24510" & NEI$type =="ON-ROAD",]

#calculate the total emissions of each year
total_Bal_motor <- aggregate(Emissions ~ year, Baltimore_motor, sum)
#plot
with(total_Bal_motor, plot(year, Emissions, type = "o", main = "PM25 Emissions from motor vehicle sources in Baltimore",
                           col = "red", lwd = 2))
#save to file png
dev.copy(png, file="plot5.png", width=600, height=480 )
dev.off()