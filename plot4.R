# plot4.R - 2 X 2 matrix of plots
# this file is used for all the plots
power2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
power2$dt <- strptime(paste(power2$Date,power2$Time),"%d/%m/%Y %R")         ## Nice column of dt from these character strings - much easier than whatever I did last time
##### newpower2 <- subset(power2, dt >= "2007-02-01" & dt <= "2007-02-02") THIS DOES NOT GET WHAT YOU THINK! Check the tail()
newpower2 <- subset(power2, dt >= "2007-02-01" & dt < "2007-02-03") 
# As with plot3, the simple export to png from RStudio was terrible. Had to use the png() device for Mac
# If you have loaded the object newpower2, start here
png("plot4.png", width=480, height=480, units="px", pointsize = 8, type = "quartz")
par(mar=c(5,5,6,1))
par(mfrow=c(2,2))
#Row 1 col 1 plot
plot(newpower2$dt,newpower2$Global_active_power,  type="l", xlab="", ylab = "Global Active Power (kilowatts)")   #So clever how it uses the date to get Thu, Fri, Sat on the x axis!
#Row 1 col 2 plot
plot(newpower2$dt,newpower2$Voltage,  type="l", xlab="datetime", ylab = "Voltage", col="black")
#Row 2 col 1 plot
plot(newpower2$dt,newpower2$Sub_metering_1,  type="n", xlab="", ylab = "Energy sub metering", col="black", ylim= c(0,40))  # I threw in this limit because I don't like hanging spikes
points(newpower2$dt,newpower2$Sub_metering_1,  type="l", col="black" )
points(newpower2$dt,newpower2$Sub_metering_2,  type="l", col="red" )
points(newpower2$dt,newpower2$Sub_metering_3,  type="l", col="blue" )
legend("topright", lwd = 2, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font = 2)
#Row 2 col 2 plot
plot(newpower2$dt,newpower2$Global_reactive_power,  type="l", xlab="datetime", ylab = "Global Reactive Power (kilowatts)")
dev.off()