NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

agg_type_year <- aggregate(NEI$Emissions, list(NEI$type, NEI$year),mean)
g <- ggplot(agg_type_year, aes(y=x, x=Group.2))+geom_point(aes(colour = factor(Group.1)), size = 4)
png("plot3.png", width=480, height=480)
g+geom_line(aes(group=Group.1,colour=Group.1))
dev.off()
