#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# list of SCC with coal
scc_coal <- SCC[grepl("Coal", SCC$Short.Name),]
#filter NEI with SCC from coal combustion-related sources
NEI_coal <- NEI[NEI$SCC %in% scc_coal$SCC,]
#calculate sum of PM25 emissions from 1999 to 2008
total_NEI_coal <- aggregate(Emissions ~ year, data = NEI_coal, sum)
#plot
with(total_NEI_coal, plot(year, Emissions, type = "o", main = "PM25 Emissions from coal combustion-related sources in US",
                          col = "red", lwd = 2))
#save to file png
dev.copy(png, file="plot4.png", width=600, height=480 )
dev.off()