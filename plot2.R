hpc_tbl <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

hpc_tbl$Date <- as.Date(hpc_tbl$Date, "%d/%m/%Y")

hpc_tbl <- subset(hpc_tbl, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

hpc_tbl <- hpc_tbl[complete.cases(hpc_tbl),]

datetime <- paste(hpc_tbl$Date, hpc_tbl$Time)

hpc_tbl <- hpc_tbl[, !(names(hpc_tbl) %in% c("Date", "Time"))]

hpc_tbl <- cbind(datetime, hpc_tbl)

hpc_tbl$datetime <- as.POSIXct(datetime)

png(filename = "plot2.png")

plot(hpc_tbl$datetime, hpc_tbl$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()