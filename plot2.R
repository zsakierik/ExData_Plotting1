household_power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", ,  stringsAsFactors=F, na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

HPD_1_2 <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

dt <- paste(HPD_1_2$Date, HPD_1_2$Time)
HPD_1_2$DT <- as.POSIXct(dt)

with(HPD_1_2, plot(Global_active_power ~ DT, type="l", ylab="Global Active Power(kilowatts)", xlab=""))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()