# plot3.R
# this file is used for all the plots
power2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power2$dt <- strptime(paste(power2$Date,power2$Time),"%d/%m/%Y %R")         ## Nice column of dt from these character strings - much easier than whatever I did last time
##### newpower2 <- subset(power2, dt >= "2007-02-01" & dt <= "2007-02-02") THIS DOES NOT GET WHAT YOU THINK! Check the tail()
newpower2 <- subset(power2, dt >= "2007-02-01" & dt < "2007-02-03") 
# 
## if you have loaded the objects in plot1, start here and just run lines
png("plot3.png", width=480, height=480, units="px", pointsize = 12, type = "quartz")
# set some margin parameters
par(mar=c(4,5,1,1))
with(newpower2, {
plot(dt,Sub_metering_1,  type="n", xlab="", ylab = "Energy sub metering", col="black")  
points(dt,Sub_metering_1,  type="l", col="black" )
points(dt,Sub_metering_2,  type="l", col="red" )
points(dt,Sub_metering_3,  type="l", col="blue" )
legend("topright", lwd = 2, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font = 2) }) #legend gets screwed up in export
dev.off()