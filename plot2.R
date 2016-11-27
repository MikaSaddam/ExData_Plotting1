library(lubridate)

df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


datetime <- dmy_hms(paste(df$Date, df$Time))
globalActivePower <- df$Global_active_power

png("plot2.png", 480, 480)

plot(datetime, as.numeric(globalActivePower), type="l", ylab="Global active power kilowatts")

dev.off()