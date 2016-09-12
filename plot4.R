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
hpcSub$Voltage <- as.numeric(hpcSub$Voltage)
hpcSub$Global_reactive_power <- as.numeric(hpcSub$Global_reactive_power)


#Setting up plot frames
par(mfrow = c(2,2))
with(hpcSub, {
  plot(Global_active_power~DateTime, xlab = " ", ylab = "Global Active Power", type = "lines")
  plot(Voltage~DateTime, ylab="Voltage", type = "lines")
  plot(Sub_metering_1~DateTime, ylab = "Energy sub metering", xlab = " ", type = "lines")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black","Red","Blue"), bty = "n")
  plot(Global_reactive_power~DateTime, type = "lines")
})

dev.copy(png, "../ExData_Plotting1/plot4.png", height = 480, width = 480)
dev.off()