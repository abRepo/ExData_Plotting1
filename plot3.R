# PLOT 3 

# Read Input Text File
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric",  "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))


## Keep only the target dates 2/1/2007 or 2/2/2007
mydata.use <- mydata[1] == "1/2/2007" | mydata[1] == "2/2/2007"
mydata <- mydata[mydata.use,]
rm(mydata.use)

datetime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
head(datetime)

# Plot needs to see ALL data to calculate ranges.  Create new vector

# Create with first meter
mydata.metering <- data.frame(datetime = datetime, energy = mydata$Sub_metering_1, meter = "Sub_metering_1")

# Append 2nd meter
mydata.metering <- rbind(mydata.metering,
                         data.frame(datetime = datetime, 
                                    energy = mydata$Sub_metering_2, 
                                    meter = "Sub_metering_2"))
# Append 3rd meter
mydata.metering <- rbind(mydata.metering,
                         data.frame(datetime = datetime, 
                                    energy = mydata$Sub_metering_3, 
                                    meter = "Sub_metering_3"))

# Create PNG file with Histogram No.1     
png(file = "plot3.png",
    width = 480,
    height = 480)

plot(x = mydata.metering$datetime, 
     y = mydata.metering$energy, 
     type = "n",
     xlab = "",
     ylab = "Energy sub metering"
)

lines(mydata.metering$datetime[mydata.metering$meter == "Sub_metering_1"], 
     mydata.metering$energy[mydata.metering$meter == "Sub_metering_1"],
     col = "black")

lines(mydata.metering$datetime[mydata.metering$meter == "Sub_metering_2"], 
      mydata.metering$energy[mydata.metering$meter == "Sub_metering_2"],
      col = "red")

lines(mydata.metering$datetime[mydata.metering$meter == "Sub_metering_3"], 
      mydata.metering$energy[mydata.metering$meter == "Sub_metering_3"],
      col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))


dev.off()
