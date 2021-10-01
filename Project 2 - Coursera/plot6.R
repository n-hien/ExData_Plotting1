#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter the data of Baltimore City (fips == "24510") and Los Angeles County, California (fips == "06037") 
# with emissions from motor vehicle sources 
fip <- c("24510", "06037")
Bal_Los_motor <- NEI[NEI$fips %in% fip & NEI$type =="ON-ROAD",]
#calculate the total emissions of each year
total_motor <- aggregate(Emissions ~ year + fips, Bal_Los_motor, sum)

library(ggplot2)
#plot
ggplot(total_motor, aes(year, Emissions, col = fips)) +
 geom_point() + geom_line() +  labs(title = "PM2.5 Emissions from motor vehicle source in Baltimore and Los Angeles ") +
 scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
 theme_bw(base_family = "Times")

#save to file png
dev.copy(png, file="plot6.png", width=600, height=480 )
dev.off()