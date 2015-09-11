# load data (9 variables with their colum names specified first row in the file)
data2<- read.table("household_power_consumption.txt",header = TRUE, sep =";",na.strings = "?", stringsAsFactors =FALSE)
# Subset data (only using data from the dates 2007-02-01 and 2007-02-02)
data3<-subset(data2, data2$Date == "1/2/2007" | data2$Date == "2/2/2007")
# plot on sccreen
hist(data3$Global_active_power,main = "Global Active Power", col = "red",xlab = "Global Active Power (kilowatts)")
# Print to png file
dev.copy(png, file= "plot1.png")
dev.off()

# Notes for myself (convert charater to DATE format):
# test<-as.Date("16/12/2006","%d/%m/%Y")
# > test
# [1] "2006-12-16"
#> weekdays(test)
#[1] "Saturday"