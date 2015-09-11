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

# Plot third figure;  Print to png File
png(file = "plot3.png")
with(data4, plot(DateTime, Sub_metering_1,type="l",ylab = "Energy sub metering", xlab = ""))
par(mar=c(2,6,2,2))
lines(data4$DateTime, data4$Sub_metering_2, col="red")
lines(data4$DateTime, data4$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2,2,2),col=c("black","red","blue"))
dev.off()

#Note: if I print to screen first, then use dev.copy(png, file= "plot3.png"), legend is cutoff
