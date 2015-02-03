# plot1
# this file is used for all the plots
power2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power2$dt <- strptime(paste(power2$Date,power2$Time),"%d/%m/%Y %R")         ## Nice column of dt from these character strings - much easier than whatever I did last time
##### newpower2 <- subset(power2, dt >= "2007-02-01" & dt <= "2007-02-02") THIS DOES NOT GET WHAT YOU THINK! Check the tail()
newpower2 <- subset(power2, dt >= "2007-02-01" & dt < "2007-02-03") 
# set some margin parameters
par(mar=c(4,5,1,1))
hist(newpower$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")