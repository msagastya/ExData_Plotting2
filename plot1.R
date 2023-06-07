fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, "Summary.zip", method = "curl")
unzip(zipfile = "Summary.zip")
# unlink("Summary.zip")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Factorize SCC and year (not necessary for plotting here but I like doing it.)
NEI <- transform(NEI, SCC = factor(SCC))
NEI <- transform(NEI, year = factor(year))

#Summing emissions by SCC and year
totals <- aggregate(Emissions ~ year,NEI, sum)
png("plot1.png", width=480, height=480)
barplot(totals$Emissions, xlab="Year", ylab="PM2.5 Emissions", main = "PM2.5 Emission Totals", names.arg = totals$year)
dev.off()