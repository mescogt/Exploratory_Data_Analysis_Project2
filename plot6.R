## Read files
if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

##Suhbset data by conty and On_Road type
NEI_on_road <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type =="ON-ROAD",]

##summed totals per yeare and replace fips Id by county name.
NEI_on_road_by_year <- aggregate(Emissions ~ year + fips, NEI_on_road, sum)
NEI_on_road_by_year$fips[NEI_on_road_by_year$fips=="24510"] <- "Baltimore, MD"
NEI_on_road_by_year$fips[NEI_on_road_by_year$fips=="06037"] <- "Los Angeles, CA"


##Plot results
png("plot6.png", width = 640, height = 480)

g <- ggplot(NEI_on_road_by_year, aes(factor(year), Emissions))
g <- g + facet_grid(.~fips)
g <- g + geom_bar(stat = "identity") + xlab ("Year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicles in Baltimore, MD vs Los Angeles, CA from 1999 to 2008')
print(g)
dev.off()
