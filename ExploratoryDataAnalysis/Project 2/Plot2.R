
# Getting the data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              destfile = "./Exploratory Analysis/dataset2.zip")

unzip(zipfile = "./Exploratory Analysis/dataset2.zip")

# Opening the files

SCC <- readRDS("./Exploratory Analysis/Source_Classification_Code.rds")
NEI <- readRDS("./Exploratory Analysis/summarySCC_PM25.rds")

# Obtaining data from Maryland

baltimore  <- NEI[NEI$fips=="24510", ]
totalBaltimore <- aggregate(Emissions ~ year, data = maryland, sum)

# Question : Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

plot(totalBaltimore, type = "l",
     xlab = "Year", ylab = "PM2.5 emission (tons)",
     main = "Total emissions in Baltimore City from 1999 to 2008")

# Saving to a file

dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()
