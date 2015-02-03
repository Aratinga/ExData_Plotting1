# plot2.R
# this file is used for all the plots
power2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power2$dt <- strptime(paste(power2$Date,power2$Time),"%d/%m/%Y %R")         ## Nice column of dt from these character strings - much easier than whatever I did last time
##### newpower2 <- subset(power2, dt >= "2007-02-01" & dt <= "2007-02-02") THIS DOES NOT GET WHAT YOU THINK! Check the tail()
newpower2 <- subset(power2, dt >= "2007-02-01" & dt < "2007-02-03") 
# set some margin parameters
# start here if you already have the object
par(mar=c(4,5,1,1))

plot(newpower2$dt,newpower2$Sub_metering_1,  type="n", xlab="", ylab = "Energy sub metering", col="black", ylim= c(0,40))  # I threw in this limit because I don't like hanging spikes
points(newpower2$dt,newpower2$Sub_metering_1,  type="l", col="black" )
points(newpower2$dt,newpower2$Sub_metering_2,  type="l", col="red" )
points(newpower2$dt,newpower2$Sub_metering_3,  type="l", col="blue" )
legend("topright", lwd = 2, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))