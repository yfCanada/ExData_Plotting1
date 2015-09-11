# load data (9 variables with their colum names specified first row in the file)
data2<- read.table("household_power_consumption.txt",header = TRUE, sep =";",na.strings = "?", stringsAsFactors =FALSE)
# Subset data (only using data from the dates 2007-02-01 and 2007-02-02)
data3<-subset(data2, data2$Date == "1/2/2007" | data2$Date == "2/2/2007")
# combine date and time and made them into DATE format
library(stats) 
library(dplyr)
data4<- mutate(data3,DateTime = paste(Date,Time))
# Convert character to Date and time format 
data4$DateTime<-as.POSIXct(strptime(data4$DateTime, "%d/%m/%Y %H:%M:%S"))

# Plot second figure;  Print to png File
with(data4, plot(DateTime, Global_active_power,type="l",ylab = "Global Avtive Power (kilowatts)"))
par(mar=c(3,6,3,4))
dev.copy(png, file= "plot2.png")
dev.off()

# Notes to myself: 
# > paste(data2$Date[1],data2$Time[1])
# test
# [1] "16/12/2006 17:25:00"
# > test2<-as.Date(test,"%d/%m/%Y %H:%M:%S")  ## This doesn't work
# test2<-as.POSIXct(strptime(test, "%d/%m/%Y %H:%M:%S")) # This works!

