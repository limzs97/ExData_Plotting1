hpc_tbl <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

hpc_tbl$Date <- as.Date(hpc_tbl$Date, "%d/%m/%Y")

hpc_tbl <- subset(hpc_tbl, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

hpc_tbl <- hpc_tbl[complete.cases(hpc_tbl),]

datetime <- paste(hpc_tbl$Date, hpc_tbl$Time)

hpc_tbl <- hpc_tbl[, !(names(hpc_tbl) %in% c("Date", "Time"))]

hpc_tbl <- cbind(datetime, hpc_tbl)

hpc_tbl$datetime <- as.POSIXct(datetime)

png(filename = "plot4.png")

par(mfrow = c(2,2), mar = c(4,4,2,1))

plot(hpc_tbl$datetime, hpc_tbl$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(hpc_tbl$datetime, hpc_tbl$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(hpc_tbl$datetime, hpc_tbl$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc_tbl$datetime, hpc_tbl$Sub_metering_2, type = "l", col = "red")
lines(hpc_tbl$datetime, hpc_tbl$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, col = c("black", "red", "blue"))

plot(hpc_tbl$datetime, hpc_tbl$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()