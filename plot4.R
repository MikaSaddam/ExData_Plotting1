library(lubridate)

df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


datetime <- dmy_hms(paste(df$Date, df$Time))
globalActivePower <- as.numeric(df$Global_active_power)
globalReactivePower <- as.numeric(df$Global_reactive_power)
voltage <- as.numeric(df$Voltage)
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)

png("plot4.png", 480, 480)

par(mfrow=c(2,2))

plot(datetime, globalActivePower, type="l", ylab="Global active power kilowatts")

plot(datetime, voltage, type="l", ylab="Voltage")

plot(datetime, subMetering1, type="l", col="black", ylab="Energy sub metering")
points(datetime, subMetering2, type="l", col="red")
points(datetime, subMetering3, type="l", col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", ylab="Global_reactive_power")

dev.off()