## Getting full dataset
data_all <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F)
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data
data_subset <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

# Converting dates
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)
attach(data_subset)

# Plot 3
# Opening Device file
dev.copy(png, file="plot3.png", height=480, width=480)

plot(Datetime, Sub_metering_1, type = "l",col = "black",xlab = "", ylab = "Energy sub metering")
lines(Datetime, Sub_metering_2, col = "red")
lines(Datetime, Sub_metering_3, col = "blue")
legend("topright",col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)

# Closing File Device
dev.off()