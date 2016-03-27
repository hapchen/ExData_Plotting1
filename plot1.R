raw <- read.csv("/Users/Haipei/Documents/R/household_power_consumption.txt", 
                sep = ';',na.strings = '?',stringsAsFactors = FALSE)
# Change the format for Date and Time
raw$Date <- as.Date(raw$Date,"%d/%m/%Y")
raw$Time <- format(strptime(raw$Time,"%T"),
                   origin = "%d/%m/%Y %H:%M:%S","%H:%M:%S")

# Filter out data for Date 2007-02-01 or 2007-02-02
my_data <- subset(raw, raw$Date == "2007-02-01" | raw$Date == "2007-02-02")
summary(my_data)
names(my_data)

# Create the png graph 
png("plot1.png", width = 480, height = 480)
hist(my_data$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.off()