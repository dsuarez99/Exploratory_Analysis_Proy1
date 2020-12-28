#Call package for working with dates
library(lubridate)

#Read data
data<-read.table(file = "C:/Users/suare/Desktop/Exploratory_Analysis_Proy1/data.txt",sep = ";",header = TRUE,na.strings = "?")

#Filter data by date
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
data<-data[data$Date>=ymd("2007-02-01") & data$Date<=ymd("2007-02-02"),]

#Plot 1
png(filename = "Plot1.png", width = 480, height = 480)
hist(data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "Red")
dev.off()
