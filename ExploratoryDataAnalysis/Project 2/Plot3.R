# Packages

library(ggplot2)

# Getting the data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              destfile = "./Exploratory Analysis/dataset2.zip")

unzip(zipfile = "./Exploratory Analysis/dataset2.zip")

# Opening the files

SCC <- readRDS("./Exploratory Analysis/Source_Classification_Code.rds")
NEI <- readRDS("./Exploratory Analysis/summarySCC_PM25.rds")

# Obtaining data from Maryland

baltimore  <- NEI[NEI$fips=="24510", ]
totalBaltimore <- aggregate(Emissions ~ year + type, data = baltimore, sum)

# Question : Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# Which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

ggplot(totalBaltimore, aes(year, Emissions, color = type)) + geom_line() +
        labs(title = "Total PM2.5 Emissions in Baltimore City",
        x = "Year", y = "PM2.5 emission (tons)")

# Saving to a file

dev.copy(png, file = "Plot3.png", height = 480, width = 480)
dev.off()
