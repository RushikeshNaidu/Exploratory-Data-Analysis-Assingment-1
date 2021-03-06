data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsettedData<- data[data$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- strptime(paste(subsettedData$Date, subsettedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsettedData$Global_active_power)
submetering_1<- as.numeric(subsettedData$Sub_metering_1)
submetering_2 <- as.numeric(subsettedData$Sub_metering_2)
submetering_3 <- as.numeric(subsettedData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dateTime, submetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, submetering_2, type="l", col="red")
lines(dateTime, submetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()