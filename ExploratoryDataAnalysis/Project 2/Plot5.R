# Packages

library(ggplot2)

# Getting the data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              destfile = "./Exploratory Analysis/dataset2.zip")

unzip(zipfile = "./Exploratory Analysis/dataset2.zip")

# Opening the files

SCC <- readRDS("./Exploratory Analysis/Source_Classification_Code.rds")
NEI <- readRDS("./Exploratory Analysis/summarySCC_PM25.rds")


# Obtaining data from Baltimore

baltimore <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
motorBaltimore <- aggregate(Emissions ~ year, data = baltimore, sum)

# Question : How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

ggplot(motorBaltimore, aes(year, Emissions)) + geom_point(size = 1) + geom_path() +
        labs(title = "Total PM2.5 Emissions from Motor Sources in Baltimore City") +
        labs(x = expression("Year"), y = expression("PM2.5 Emissions (tons)")) 
                         
# Saving to a file

dev.copy(png, file = "Plot5.png", height = 480, width = 480)
dev.off()  
