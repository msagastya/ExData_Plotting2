NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
LA <- NEI[which(NEI$fips == "06037"),]
motor_LA <- LA[LA$SCC %in% vehicle_SCC,]
agg_motor_LA <- aggregate(motor_LA$Emissions, list(motor_LA$year),mean)
agg_motor_LA$city <- rep("LA",4)
agg_motor_balt$city <- rep("Baltimore",4)

two_cities <- rbind.data.frame(agg_motor_balt,agg_motor_LA)

g4 <- ggplot(two_cities, aes(x=factor(Group.1), y=x, group =city)) + geom_point(aes(colour = city), size = 4)+geom_line(aes(colour=city))
png("plot6.png", width=480, height=480)
g4
dev.off()