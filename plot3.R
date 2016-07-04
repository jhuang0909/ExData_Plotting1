library(dplyr)

## Set work directory if needed
## setwd("./Exploratory-data-analysis/W_1/")

## Read Data
powerConsumption <- read.csv2("household_power_consumption.txt", 
                              dec = ".", 
                              colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                              na.strings = "?",
                              stringsAsFactors = FALSE)
powerConsumption <- subset(powerConsumption, Date == "1/2/2007" | Date == "2/2/2007" )

## Convert Date / Time to POSIXlt and then drop the extra Date / Time columes
powerConsumption$datetime <- with(powerConsumption, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
powerConsumption <- powerConsumption %>% select(-c(Date, Time))

png(file="plot3.png", width = 480, height = 480)

## Plot a line of powerConsumption$Sub_metering_1 vs time
plot(powerConsumption$datetime, powerConsumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
## Plot a line of powerConsumption$Sub_metering_2 vs time
with(powerConsumption, points(datetime, Sub_metering_2, type = "l", col = "red"))
## Plot a line of powerConsumption$Sub_metering_3 vs time
with(powerConsumption, points(datetime, Sub_metering_3, type = "l", col = "blue"))
## Add legend
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust = 1)

dev.off() 


