household_power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", ,  stringsAsFactors=F, na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

HPD_1_2 <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

dt <- paste(HPD_1_2$Date, HPD_1_2$Time)
HPD_1_2$DT <- as.POSIXct(dt)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(HPD_1_2,{
  plot(Global_active_power ~ DT, type="l", ylab="Global Active Power(kilowatts)", xlab="")
  plot(Voltage ~ DT, type="l", ylab="Voltage", xlab="datatime")
  plot(Sub_metering_1 ~ DT, type="l" ,  ylab="Energy sub metering", col = "black")
  lines(Sub_metering_2 ~ DT, col = "red")
  lines(Sub_metering_3~DT,col='blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ DT, type="l", ylab="Global_reactive_power", xlab="datatime")
}
)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

