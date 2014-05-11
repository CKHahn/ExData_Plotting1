
power <- read.table("data/power_consumption/household_power_consumption.txt", header=TRUE, sep=";")

sub_power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007", ]
sub_power$Time <- as.POSIXlt(strptime(paste(sub_power$Date, sub_power$Time), "%d/%m/%Y %X"))
sub_power$Date <- as.Date(sub_power$Date, "%d/%m/%Y")

png("plot2.png")
plot(sub_power$Time, as.integer(sub_power$Global_active_power)/1000, type="l", xlab = "", ylab="Global Active Power(kilowatts)")
dev.off()
