#plot 2

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE)
df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#convert date and time to date/time classes
df2$datetime <- strptime(paste(df2$Date, df2$Time), format = "%d/%m/%Y %H:%M:%S")  

#conversion to num
df2$Global_active_power <- as.numeric(df2$Global_active_power) 

#plot the line chart
plot(df2$datetime,
     df2$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = " "   
     )
#print to PNG
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

