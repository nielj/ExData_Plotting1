# plot1.R - nielj - 201506 - Exploratory Data Analysis - Course Project 1

# read the file into R omit na values
df <- na.omit(read.csv("household_power_consumption.txt", quote = "", sep=";", na.strings="?", nrows=2100000, header=TRUE))

# convert the date to character as date values, mark rows not for 2007-02-01 and 2007-02-02 and remove from data frame
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[!(df$Date < "2007-02-01" | df$Date > "2007-02-02"),]

# create plot to png file
png("plot1.png", width=480, height=480)
hist(df$Global_active_power, ylim=c(0,1200), main="Global Active Power", xlab="Global Active Power (kilowats)", ylab="Frequency",col="red")
dev.off()
