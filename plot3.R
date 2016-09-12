#Reading in As Table
hpc <- read.table("../DataScience-Coursera/Resources/power.txt", sep = ";", skip = 1, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1",
                                                                                                    "Sub_metering_2", "Sub_metering_3"), stringsAsFactors = FALSE)

#Subsetting for dates we want
hpcSub <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

#Converting to DateTime
hpcSub$Date <- as.Date(hpcSub$Date, format = "%d/ %m/ %Y")
DateTime <- paste(as.Date(hpcSub$Date), hpcSub$Time)
hpcSub$DateTime <- as.POSIXct(DateTime)

#Forming to Numeric
hpcSub$Global_active_power <- as.numeric(hpcSub$Global_active_power)

#plotting
with(hpcSub, {plot(Sub_metering_1~DateTime, type = "lines",
                   xlab = " ", ylab = "Energy sub metering")
    lines(Sub_metering_2~DateTime, col = "Red")
    lines(Sub_metering_3~DateTime, col = "Blue")
  })

#Legend
legend("topright", col = c("black", "Red", "Blue"), lty=1, lwd = 3, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "../ExData_Plotting1/plot3.png", height = 480, width = 480)
dev.off()