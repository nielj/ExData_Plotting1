# plot4.R - nielj - 201506 - Exploratory Data Analysis - Course Project 1

# read the file into R omit na values
df <- na.omit(read.csv("household_power_consumption.txt", quote = "", sep=";", na.strings="?", nrows=2100000, header=TRUE))

# create new date time column for graphing later before converting the date
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# convert the date to character as date values, mark rows not for 2007-02-01 and 2007-02-02 and remove from data frame
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[!(df$Date < "2007-02-01" | df$Date > "2007-02-02"),]

# create plot to png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(5, 5, 1, 1))
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowats)",col="black")
plot(df$DateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage",col="black")
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(df$DateTime, df$Sub_metering_2, type="l",col="red")
lines(df$DateTime, df$Sub_metering_3, type="l",col="blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"), 
       bg = "white", ncol = 1, lty = 1, bty = "n")
plot(df$DateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power",col="black")
dev.off()