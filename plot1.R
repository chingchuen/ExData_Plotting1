#Plot 1 including loading data
#load the lubridate library

library(lubridate)
library(dplyr)

#set working directory. May need to change if you put the file elsewhere

setwd("~/Documents/R Course/Exploratory Data Analysis")

#read the data. This assumes the data file is unzipped to the working directory

atemp <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#select only the required dates and remove the temp file
data1 <- subset(atemp, atemp$Date=="1/2/2007" | atemp$Date=="2/2/2007")
rm(atemp)

#tidy up the date and time format

data1$datetime <- strptime(paste(data1$Date,data1$Time), "%d/%m/%Y %H:%M:%S")

data <- data1 %>% relocate(datetime) %>% select(!"Date":"Time")

#convert Global_active_power to numeric

data <- data %>% mutate_if(is.character, as.numeric)

#now plot the graph and exports as PNG
png(file="plot1.png", width=480, height=480)
with(data, hist(Global_active_power, col="red",main="Global Active Power",
                xlab="Global Active Power (kilowatts)"))

#close the device
dev.off()




