NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Subsetting to baltimore and totalling by year
balt <- NEI[which(NEI$fips == 24510),]
tbal <- aggregate(Emissions ~ year,balt, sum)
png("plot2.png", width=480, height=480)
barplot(tbal$Emissions, xlab="Year", ylab="PM2.5 Emissions", main = "Baltimore PM2.5 Emission Totals", names.arg = tbal$year)
dev.off()
