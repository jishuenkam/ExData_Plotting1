#plot 3

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE)
df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#convert date and time to date/time classes
df2$datetime <- strptime(paste(df2$Date, df2$Time), format = "%d/%m/%Y %H:%M:%S")  

#conversion to numeric
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1) 
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2) 
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3) 

#multiple plots on the same chart
plot(df2$datetime, df2$Sub_metering_1, type = "l", xlab = " ", 
     ylab = "Energy sub metering")
lines(df2$datetime, df2$Sub_metering_2, col = "blue")
lines(df2$datetime, df2$Sub_metering_3, col = "red")

#create legends on top right corner
legend("topright", lty = 1 ,col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#print to png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
