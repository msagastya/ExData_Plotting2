NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicle_SCC <- SCC[grep("*vehicle*|*Vehicle*",SCC$Short.Name),]$SCC
motor_balt <- balt[balt$SCC %in% vehicle_SCC,]
agg_motor_balt <- aggregate(motor_balt$Emissions, list(motor_balt$year),mean)

g3 <- ggplot(agg_motor_balt, aes(x=Group.1, y=x, group =1)) + geom_point(aes(colour = factor(Group.1)), size = 4)+geom_line()
g3
png("plot5.png", width=480, height=480)
g3
dev.off()