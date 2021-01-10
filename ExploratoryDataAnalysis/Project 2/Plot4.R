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

NEI_SCC <- merge(NEI, SCC, by = "SCC")
coal  <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)
subsetNEI <- NEI_SCC[coal, ]

total <- aggregate(Emissions ~ year, subsetNEI, sum)

# Question : Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

ggplot(total, aes(factor(year), Emissions)) + geom_bar(stat = "identity") +
        xlab("Year") + ylab(expression("PM2.5 Emissions (tons)")) +
        ggtitle("Total Emissions from coal sources from 1999 to 2008")

# Saving to a file

dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()
