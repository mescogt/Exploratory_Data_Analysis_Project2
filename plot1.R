## Read files
if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
#Add emmissions per yeare
pm25byyear <- aggregate(Emissions ~ year, NEI, sum)

#Plot results
png('plot1.png')

barplot(height = pm25byyear$Emissions, names.arg = pm25byyear$year, xlab="years",
        main = expression('total PM'[2.5]*'emissions at various years'),
        ylab = expression('total PM'[2.5]*'emission'))
dev.off()