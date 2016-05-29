## Read files
if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

##subset data and add emisions per type and year
NEI_Baltimore <- NEI[NEI$fips == "24510",]
pm25_Baltimore_year_type <- aggregate(Emissions ~ year + type, NEI_Baltimore, sum)


#Plot results
png("plot3.png", width = 640, height = 480)

g <- ggplot(pm25_Baltimore_year_type, aes(year,Emissions, color = type))
g <- g + geom_line(size = 1.3) + xlab("year") + ylab(expression('Total PM'[2.5]*"Emissions"))+
        ggtitle('Total Emissions in Baltimore, Maryland from 1999 to 2008')

print(g)
dev.off()
