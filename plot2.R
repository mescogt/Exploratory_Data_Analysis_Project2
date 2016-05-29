## Read files
if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

##subset data and add emmissions per year 
NEI_Baltimore <- NEI[NEI$fips == "24510",]
pm25_Baltimore_by_year <- aggregate(Emissions ~ year, NEI_Baltimore, sum)

##Plot results
png('plot2.png')

barplot(height = pm25_Baltimore_by_year$Emissions, names.arg = pm25_Baltimore_by_year$year, xlab="years",
        main = expression('total PM'[2.5]*'emissionsin Baltimore, MD at various years'),
        ylab = expression('total PM'[2.5]*'emission'))
dev.off()
