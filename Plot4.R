#Call package for working with dates
library(lubridate)

#Read data
data<-read.table(file = "C:/Users/suare/Desktop/Exploratory_Analysis_Proy1/data.txt",sep = ";",header = TRUE,na.strings = "?")

#Filter data by date
data$DateTime<-dmy_hms(paste(data$Date,data$Time))
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
data<-data[data$Date>=ymd("2007-02-01") & data$Date<=ymd("2007-02-02"),]

#Plot 4
png(filename = "Plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)",)
plot(data$DateTime,data$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="Red")
lines(data$DateTime,data$Sub_metering_3,col="Blue")
legend("topright", lty = c(1,1), col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.5)
plot(data$DateTime,data$Voltage,xlab = "datetime",ylab="Voltage",type="l")
plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
