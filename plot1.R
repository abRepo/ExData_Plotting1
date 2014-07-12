## PLOT 1

# Read Input Text File
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric",  "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))


## Keep only the target dates 2/1/2007 or 2/2/2007
mydata.use <- mydata[1] == "1/2/2007" | mydata[1] == "2/2/2007"
mydata <- mydata[mydata.use,]
rm(mydata.use)

# Create PNG file with Histogram No.1     
png(file = "plot1.png",
    width = 480,
    height = 480)

hist(mydata$Global_active_power, 
     col = "red", 
     main = "Global Actie Power",
     breaks = 12,
     xlim = c(0,8),
     ylim = c(0,1200),
     xlab = "Global Active Power (kilowatts)",
     axes = FALSE)

axis(side = 1, at = c(0, 2, 4, 6))
axis(side = 2, at = c(0, 200, 400, 600, 800, 1000, 1200))

dev.off()

