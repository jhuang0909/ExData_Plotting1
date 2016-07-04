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

png(file="plot4.png", width = 480, height = 480)

## Set a four-plot grid
par(mfrow = c(2, 2))

## Plot a line of powerConsumption$Global_active_power vs time
plot(powerConsumption$datetime, powerConsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power)")

## Plot a line of powerConsumption$Voltage vs time
plot(powerConsumption$datetime, powerConsumption$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Plot a line of powerConsumption$Sub_metering_1 vs time
plot(powerConsumption$datetime, powerConsumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
## Plot a line of powerConsumption$Sub_metering_2 vs time
with(powerConsumption, points(datetime, Sub_metering_2, type = "l", col = "red"))
## Plot a line of powerConsumption$Sub_metering_3 vs time
with(powerConsumption, points(datetime, Sub_metering_3, type = "l", col = "blue"))
## Add legend
legend("topright", lty=c(1,1,1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot a line of powerConsumption$Voltage vs time
plot(powerConsumption$datetime, powerConsumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off() 


