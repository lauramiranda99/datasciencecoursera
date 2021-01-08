# Getting the data

download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = ",/Exploratory Analysis/dataset.zip")

unzip(zipfile = "C:/Users/Lau/Desktop/Exploratory Analysis/dataset.zip")

data <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F,
                   na.strings = "?", sep = ';')

# Subsetting

dataset = data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# Correcting the date format

dataset$dateTime <- strptime(paste(dataset$Date, dataset$Time), format = '%d/%m/%Y %H:%M:%S')

# Plot

plot(x = dataset$dateTime, y = dataset$Sub_metering_1, type = 'l',
     xlab = NA, ylab = 'Energy sub metering')
lines(x = dataset$dateTime, y = dataset$Sub_metering_2, col = 'red')
lines(x = dataset$dateTime, y = dataset$Sub_metering_3, col = 'blue')
legend(
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lwd = 2, "topright", par(mar=c(2,6,2,2), mfrow=c(2, 2)))

# Saving to a file

dev.copy(png, file = "Plot3.png", height = 480, width = 480)
dev.off()
