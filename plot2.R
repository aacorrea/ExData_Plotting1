##Exploratory Data Analysis 
##Project 1
##Plot 2

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
png("plot2.png", width=480, height=480)
plot(newdate, sample$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
