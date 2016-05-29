## Read files
if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
## Merge tables by SCC
NEISCC <- merge(NEI, SCC, by="SCC")

##Subset data by coal and add them by yeare.
coal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
NEISCC_coal <- NEISCC[coal,]
coal_by_year <- aggregate(Emissions ~ year, NEISCC_coal, sum)


#Plot results
png("plot4.png", width = 640, height = 480)

g <- ggplot(coal_by_year, aes(factor(year), Emissions))
g <- g+ geom_bar(stat = "identity") + xlab ("year") + 
     ylab (expression('Total PM'[2.5]* "Emissions")) +
     ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
