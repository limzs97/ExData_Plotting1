temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
hpc_tbl <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
unlink(temp)

hpc_tbl$Date <- as.Date(hpc_tbl$Date, "%d/%m/%Y")

hpc_tbl <- subset(hpc_tbl, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

hpc_tbl <- hpc_tbl[complete.cases(hpc_tbl),]

png(filename = "plot1.png")

hist(hpc_tbl$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()