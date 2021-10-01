library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter the data of Baltimore City, Maryland (fips == "24510")
Baltimore <- NEI[NEI$fips == "24510",]
#calculate the total emissions of each year, type in Baltimore Citz, Maryland
Baltimore_total3 <- aggregate(Emissions ~ year + type, data = Baltimore, sum)
#plot
ggplot(Baltimore_total3, aes(year, Emissions, col = type)) +
  geom_point() + geom_line() +  labs(title = "PM2.5 Emissions in Baltimore City by type ") + 
  theme_bw(base_family = "Times")
#save to file png
dev.copy(png, file="plot3.png", width=600, height=480 )
dev.off()