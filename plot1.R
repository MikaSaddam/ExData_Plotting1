df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


png("plot1.png", 480, 480)

with(df, hist(Global_active_power, col="red", xlab="Global active power (kilowatts)",
              main="Global Active Power"))

dev.off()