NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coal_SCC <- SCC[grep("*coal*|*Coal*",SCC$Short.Name),]$SCC
coal_data <- NEI[NEI$SCC %in% coal_SCC,]

suppressWarnings(agg_coal <- aggregate(coal_data, list(coal_data$year), mean))

g2 <- ggplot(agg_coal, aes(x=Group.1, y=Emissions, group =1)) + geom_point(aes(colour = factor(Group.1)), size = 4)+geom_line()
png("plot4.png", width=480, height=480)
g2
dev.off()