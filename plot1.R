
power <- read.table("data/power_consumption/household_power_consumption.txt", header=TRUE, sep=";")

sub_power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007", ]
sub_power$Time <- as.POSIXlt(strptime(paste(sub_power$Date, sub_power$Time), "%d/%m/%Y %X"))
sub_power$Date <- as.Date(sub_power$Date, "%d/%m/%Y")

png("plot1.png")
hist(table(sub_power$Global_active_power), col="Red", breaks=50, xlim=range(1:10), main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()


