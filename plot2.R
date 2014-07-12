# PLOT 2

# Read Input Text File
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric",  "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))


## Keep only the target dates 2/1/2007 or 2/2/2007
mydata.use <- mydata[1] == "1/2/2007" | mydata[1] == "2/2/2007"
mydata <- mydata[mydata.use,]
rm(mydata.use)

datetime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
head(datetime)

# Create PNG file with Histogram No.1     
png(file = "plot2.png",
    width = 480,
    height = 480)

plot(x = datetime, 
     y = mydata$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)

dev.off()
