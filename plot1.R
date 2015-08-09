# Please insure that household_power_consumption.txt is in your home directory
# insure dplyr library is installed

library(dplyr)

class <- c("character", "character", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric")

data1 <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, 
                  sep = ";", colClasses = class, na.strings = "?")
data1$datetime <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")


data1 <- mutate(data1, Date = as.Date(Date, "%d/%m/%Y"))

data2 <- subset(data1, Date ==  "2007-02-01" | Date == "2007-02-02")

with(data2, hist(Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)"))

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
