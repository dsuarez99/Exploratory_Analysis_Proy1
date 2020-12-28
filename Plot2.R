#Call package for working with dates
library(lubridate)

#Read data
data<-read.table(file = "C:/Users/suare/Desktop/Exploratory_Analysis_Proy1/data.txt",sep = ";",header = TRUE,na.strings = "?")

#Filter data by date
data$DateTime<-dmy_hms(paste(data$Date,data$Time))
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
data<-data[data$Date>=ymd("2007-02-01") & data$Date<=ymd("2007-02-02"),]

#Plot 2
png(filename = "Plot2.png", width = 480, height = 480)
plot(data$DateTime,data$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)",)
dev.off()
