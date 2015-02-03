# plot2.R
library("lubridate", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
power2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power2$dt <- strptime(paste(power2$Date,power2$Time),"%d/%m/%Y %R")         ## Nice column of dt from these character strings - much easier than whatever I did last time
##### newpower2 <- subset(power2, dt >= "2007-02-01" & dt <= "2007-02-02") THIS DOES NOT GET WHAT YOU THINK! Check the tail()
newpower2 <- subset(power2, dt >= "2007-02-01" & dt < "2007-02-03") 
plot(newpower2$dt,newpower2$Global_active_power, type="l")
