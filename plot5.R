## Read files
if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

##Subset data by county and on road type.Also added data per year.
NEI_on_road <- NEI[NEI$fips == "24510" & NEI$type =="ON-ROAD",]
NEI_on_road_by_year <- aggregate(Emissions ~ year, NEI_on_road, sum)


##Plot results
png("plot5.png", width = 640, height = 480)

g <- ggplot(NEI_on_road_by_year, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab ("Year") +
     ylab(expression('Total PM'[2.5]*" Emissions")) +
     ggtitle('Total Emissions from motor vehicle in Baltimore from 1999 to 2008')
print(g)
dev.off()
