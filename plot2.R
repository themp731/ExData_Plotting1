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
plot(hpcSub$Global_active_power~hpcSub$DateTime, type = "lines", ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.copy(png, "../ExData_Plotting1/plot2.png", height = 480, width = 480)
dev.off()