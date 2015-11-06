library(R2HTML)
library(tseries)
library(Hmisc)
library(reshape)

# Set your directory where the file is saved
setwd("D:\\Coursera Courses\\Exploratory Data Analysis\\Dataset\\Week 1")
y <- read.csv(".\\household_power_consumption.txt", sep=";", header = T, stringsAsFactors = F)
str(y)
y$Date = as.Date(as.character(y$Date), "%d/%m/%Y")
y2 = subset(y, Date >= "2007-02-01" & Date <= "2007-02-02")
y2$Global_active_power = as.numeric(y2$Global_active_power)
y2$Sub_metering_1 = as.numeric(y2$Sub_metering_1)
y2$Sub_metering_2 = as.numeric(y2$Sub_metering_2)
y2$Voltage = as.numeric(y2$Voltage)
y2$Global_intensity = as.numeric(y2$Global_intensity)
y2$Global_reactive_power = as.numeric(y2$Global_reactive_power)
y2$Day = weekdays(y2$Date)


plot(y2$Sub_metering_1,xaxt="n",type="l", ylab = "", xlab = "")

axis(1,at=c(1,1441,2880),labels= c("Thu", "Fri", "Sat"))

par(new = TRUE)
plot(y2$Sub_metering_2,xaxt="n",type="l", yaxt = "n", ylim = c(0,30), col = "red" , ylab = "", xlab = "")

par(new = TRUE)
plot(y2$Sub_metering_3,xaxt="n",type="l", yaxt = "n", ylim = c(0,30), col = "blue",  ylab = "Energy sub metering", xlab = "")

legend(x= 2000, y= 30, lty= 1,cex=.5,  col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
