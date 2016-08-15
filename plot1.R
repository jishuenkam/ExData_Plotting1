#plot 1
#if you want to run this script, please have the text file at your directory

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE)
df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#convert date and time to date/time classes
df2$datetime <- strptime(paste(df2$Date, df2$Time), format = "%d/%m/%Y %H:%M:%S")  

#conversion to numeric
df2$Global_active_power <- as.numeric(df2$Global_active_power)

#plot the histogram
hist(df2$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red"
     )

#print to PNG
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()