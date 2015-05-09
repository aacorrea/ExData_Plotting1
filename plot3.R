##Exploratory Data Analysis 
##Project 1
##Plot 3

## Due the data size we'll use a fast read  function
library(data.table)
data = fread("D:/PML/household_power_consumption.txt", sep = ";" ,header = T,
             na.strings = "?")

#Lets subset the data, because we know the dates we'll use 
sample <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Structure and descriptive data analysis
str(sample)
summary(sample)

##Apply format to column Date
Sys.setlocale("LC_ALL", "C")
date = paste(sample$Date, sample$Time, sep=" ")
newdate <- strptime(date, "%d/%m/%Y %H:%M:%S")

##Plot
png("plot3.png", width=480, height=480)
plot(newdate,sample$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(newdate,sample$Sub_metering_2,col="red", xlab="", ylab="Energy sub metering")
lines(newdate,sample$Sub_metering_3,col="blue", xlab="", ylab="Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()
