
# Getting the data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              destfile = "./Exploratory Analysis/dataset2.zip")

unzip(zipfile = "./Exploratory Analysis/dataset2.zip")

# Opening the files

SCC <- readRDS("./Exploratory Analysis/Source_Classification_Code.rds")
NEI <- readRDS("./Exploratory Analysis/summarySCC_PM25.rds")

totalEmissions <- aggregate(Emissions ~ year, data = NEI, sum)

# Question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

plot(totalEmissions, type = "l",
     xlab = "Year", ylab = "PM2.5 emission (tons)",
     main = "Total PM2.5 emissions from 1999 to 2008")

# Saving to a file

dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()
