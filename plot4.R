library(dplyr)

class <- c("character", "character", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric")

data1 <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, 
                  sep = ";", colClasses = class, na.strings = "?")
data1$datetime <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")


data1 <- mutate(data1, Date = as.Date(Date, "%d/%m/%Y"))

data2 <- subset(data1, Date ==  "2007-02-01" | Date == "2007-02-02")

par(mfrow = c(2,2))
par(mar = c(4,4,2,2))


with(data2, plot(datetime,Global_active_power, type = "n",  xlab = "", ylab = "Global Active Power" ))
with(data2, lines(datetime,Global_active_power))

with(data2, plot(datetime,Voltage, type = "n" ))
with(data2, lines(datetime,Voltage))

with(data2, plot(datetime,Sub_metering_1, type = "n", xlab = "", ylab = "Enery sub Metering"))
with(data2, lines(datetime,Sub_metering_1))

with(data2, lines(datetime,Sub_metering_2, col = "red"))

with(data2, lines(datetime,Sub_metering_3, col = "blue"))
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3") , 
       pch = "__",col = c("black", "red", "blue"), cex = 0.5, bty = "n")

with(data2, plot(datetime,Global_reactive_power, type = "n" ))
with(data2, lines(datetime,Global_reactive_power))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
