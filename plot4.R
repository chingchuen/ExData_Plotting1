#loading data done in plot1.R
#load the lubridate library

library(lubridate)
library(dplyr)


# save plots to png

png(filename = "plot4.png", width = 600, height=600)

#set the plot up for 4 plots in the same graph

par(mfrow=c(2,2))


#first plot is the smae as plot 2 except for x-label

with(data, plot(datetime, Global_active_power, type="l",xlab="", 
                ylab="Global Active Power"))

#second plot is time vs Voltage
with(data, plot(datetime, Voltage, type="l"))

#third plot is the same as plot 3

#set up the plot with no points

with(data, plot(datetime, Sub_metering_1, type="n", xlab="", 
                ylab="Energy sub metering"))

#add lines for each sub_metering
with(data, points(datetime, Sub_metering_1, type="l"))

with(data, points(datetime, Sub_metering_2, type="l", col="red"))

with(data, points(datetime, Sub_metering_3, type="l", col="blue"))

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red","blue"), lty=1)

#finally the last one is time vs reactive power

with(data, plot(datetime, Global_reactive_power, type="l"))

#close the device
dev.off()
