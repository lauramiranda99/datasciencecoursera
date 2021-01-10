# Packages

library(ggplot2)

# Getting the data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              destfile = "./Exploratory Analysis/dataset2.zip")

unzip(zipfile = "./Exploratory Analysis/dataset2.zip")

# Opening the files

SCC <- readRDS("./Exploratory Analysis/Source_Classification_Code.rds")
NEI <- readRDS("./Exploratory Analysis/summarySCC_PM25.rds")

# Subsetting

NEIBaltLA <- NEI[(NEI$fips == "24510"|NEI$fips == "06037") & NEI$type == "ON-ROAD", ]

total <- aggregate(Emissions ~ year + fips, NEIBaltLA, sum)
"Baltimore" <- total$city[total$fips == "24510"] 
"Los Angeles, CA" <- total$city[total$fips == "06037"] 

# Question : Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

ggplot(total, aes(factor(year), Emissions)) + geom_bar(stat="identity")  +
         xlab("year") + ylab(expression("PM2.5 Emissions (tons)")) + facet_grid(. ~ fips) +
         ggtitle("Total Emissions from motor vehicle sources in Baltimore City and Los Angeles")

# Saving to a file

dev.copy(png, file = "Plot5.png", height = 480, width = 480)
dev.off() 
