#plot 4

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE)
df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#convert date and time to date/time classes
df2$datetime <- strptime(paste(df2$Date, df2$Time), format = "%d/%m/%Y %H:%M:%S")  

#conversion to numeric for plotting
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1) 
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2) 
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3) 
df2$Voltage <- as.numeric(df2$Voltage)
df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)
df2$Global_active_power <- as.numeric(df2$Global_active_power)

#set the display properties of the system
par(mfrow = c(2, 2))

#first plot 
plot(df2$datetime,
     df2$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power",
     xlab = " "   
)

#second plot
plot(df2$datetime, df2$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

#third plot
plot(df2$datetime, df2$Sub_metering_1, type = "l", xlab = " ", 
     ylab = "Energy sub metering")
lines(df2$datetime, df2$Sub_metering_2, col = "blue")
lines(df2$datetime, df2$Sub_metering_3, col = "red")

#fourth plot
plot(df2$datetime, df2$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

#print to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
