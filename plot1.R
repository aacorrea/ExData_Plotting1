##Exploratory Data Analysis 
##Project 1
##Plot 1


## Due the data size we'll use a fast read  function
library(data.table)

data = fread("D:/PML/household_power_consumption.txt", sep = ";" ,header = T,
             na.strings = "?")

#Lets subset the data, because we know the dates we'll use 
sample <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Structure and descriptive data analysis
str(sample)
summary(sample)

#Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(sample$Global_active_power), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

