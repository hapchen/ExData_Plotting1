raw <- read.csv("/Users/Haipei/Documents/R/household_power_consumption.txt", 
                sep = ';',na.strings = '?',stringsAsFactors = FALSE)
# Change the format for Date and Time
raw$Date <- as.Date(raw$Date,"%d/%m/%Y")
raw$Time <- format(strptime(raw$Time,"%T"),
                   origin = "%d/%m/%Y %H:%M:%S","%H:%M:%S")

# Filter out data for Date 2007-02-01 or 2007-02-02
my_data <- subset(raw, raw$Date == "2007-02-01" | raw$Date == "2007-02-02")


# Create a new time variable in my_data to depict the spefic time
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
my_data$Weekday <- format(my_data$Date, "%a")
my_data$allTime <- paste(my_data$Date, my_data$Time)
my_data$allTime <- strptime(my_data$allTime,format="%Y-%m-%d %H:%M:%S")

# Draw the first two plots
plot(y = my_data$Global_active_power,x = my_data$allTime, type = "l",xlab = ""
     , ylab = "Global Active Power (kilowatts)")
plot(y = my_data$Voltage, x = my_data$allTime, type = "l", xlab = "", ylab = 
             "Voltage")
# Draw the rest plots
plot(y = my_data$Sub_metering_1, x = my_data$allTime, col = "black", 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(y = my_data$Sub_metering_2, x = my_data$allTime, col = "red")
lines(y = my_data$Sub_metering_3, x = my_data$allTime, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(
        "black", "red", "blue"), lwd = 1, cex = 0.1)
           
plot(y = my_data$Global_reactive_power, x = my_data$allTime, col = "black", 
     type = "l", xlab = "", ylab = "Global_reactive_power")

dev.off()
