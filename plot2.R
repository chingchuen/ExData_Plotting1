#loading data done in plot1.R
#load the lubridate library

library(lubridate)
library(dplyr)


#this assumed plot1.R was already run, so that the resulting dataset "data"
# is available for use, where data$datetime is in date format while the rest
#of the columns are in numeric

#plot the graph and write to PNG file
png(file="plot2.png", width=480, height=480)
with(data, plot(datetime, Global_active_power, type="l",xlab="", 
     ylab="Global Active Power (kilowatts)"))

#close the device
dev.off()