#loading data done in plot1.R
#load the lubridate library

library(lubridate)
library(dplyr)


#this assumed plot1.R was already run, so that the resulting dataset "data"
# is available for use, where data$datetime is in date format while the rest
#of the columns are in numeric

#plot the graph with Sub_metering_1 and export to PNG

png(file="plot3.png", width=480, height=480)

#set up the plot with no points

with(data, plot(datetime, Sub_metering_1, type="n", xlab="", 
                ylab="Energy sub metering"))

#add lines for each sub_metering
with(data, points(datetime, Sub_metering_1, type="l"))

with(data, points(datetime, Sub_metering_2, type="l", col="red"))

with(data, points(datetime, Sub_metering_3, type="l", col="blue"))

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red","blue"), lty=1)

#close the device
dev.off()
