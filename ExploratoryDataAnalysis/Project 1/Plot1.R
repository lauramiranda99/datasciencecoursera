# Getting the data

download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = "./Exploratory Analysis/dataset.zip")

unzip(zipfile = "./Exploratory Analysis/dataset.zip")

data <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F,
                      na.strings = "?", sep = ';')

# Subsetting

dataset = data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# Correcting the date format

dataset$dateTime <- strptime(paste(dataset$Date, dataset$Time), format = '%d/%m/%Y %H:%M:%S')

# Plot

hist(dataset$Global_active_power, col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')

## Saving to a file

dev.copy(png, file= "Plot1.png", height=480, width=480)
dev.off()
