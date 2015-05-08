household_power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", ,  stringsAsFactors=F, na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

HPD_1_2 <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

dt <- paste(HPD_1_2$Date, HPD_1_2$Time)
HPD_1_2$DT <- as.POSIXct(dt)

hist(HPD_1_2$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()