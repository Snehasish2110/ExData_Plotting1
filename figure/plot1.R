library(R2HTML)
library(tseries)
library(Hmisc)
library(reshape)

# Set your directory where the file is saved
setwd("D:\\Coursera Courses\\Exploratory Data Analysis\\Dataset\\Week 1")
y <- read.csv(".\\household_power_consumption.txt", sep=";", header = T, stringsAsFactors = F)
str(y)
y$Date = as.Date(y$Date, "%d/%m/%Y")
y2 = subset(y, Date >= "2007-02-01" & Date <= "2007-02-02")
y2$Global_active_power = as.numeric(y2$Global_active_power)
y2$Sub_metering_1 = as.numeric(y2$Sub_metering_1)
y2$Sub_metering_2 = as.numeric(y2$Sub_metering_2)
y2$Voltage = as.numeric(y2$Voltage)
y2$Global_intensity = as.numeric(y2$Global_intensity)
y2$Global_reactive_power = as.numeric(y2$Global_reactive_power)

with(y2, hist((Global_active_power), col ="red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()



