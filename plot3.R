power <- read.table("data/power_consumption/household_power_consumption.txt", header=TRUE, sep=";")

sub_power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007", ]
sub_power$Time <- as.POSIXlt(strptime(paste(sub_power$Date, sub_power$Time), "%d/%m/%Y %X"))
sub_power$Date <- as.Date(sub_power$Date, "%d/%m/%Y")

png("plot3.png")
plot(sub_power$Time, c(as.integer(sub_power$Sub_metering_1)), type="l", xlab = "", ylab="Energy sub metering")
lines(sub_power$Time, c(as.integer(sub_power$Sub_metering_2)),  col="Red")
lines(sub_power$Time, c(as.integer(sub_power$Sub_metering_3)),  col="Blue")
legend("topright", pch="--", col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

