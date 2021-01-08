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

attach(dataset)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

  plot(y = dataset$Global_active_power, x = dataset$dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(y = dataset$Voltage, x = dataset$dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(y = dataset$Sub_metering_1, x = dataset$dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(y = dataset$Sub_metering_2, x = dataset$dateTime,col='Red')
  lines(y = dataset$Sub_metering_3, x = dataset$dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex = 0.5,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(y = dataset$Global_reactive_power, x = dataset$dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")


## Saving to a file

dev.copy(png, file= "Plot4.png", height = 480, width = 480)
dev.off()
