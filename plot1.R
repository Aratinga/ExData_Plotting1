# plot1.R
library("lubridate", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power$Date <- dmy(power$Date)
newpower <- subset(power, as.character(Date) == "2007-02-01" | as.character(Date) == "2007-02-02")
newpower$Time <- strptime(newpower$Time,"%R")
hist(newpower$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")