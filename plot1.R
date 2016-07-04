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

png(file="plot1.png", width = 480, height = 480)

## Plot a histogram of powerConsumption$Global_active_power
hist(powerConsumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off() 


