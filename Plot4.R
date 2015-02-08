# Plot4.R creates uses the Electric Power Consumption data set to construct a multi plot image by minute for the period of 02/01/2007-02/02/2007 
#
data_in <- read.csv("household_power_consumption.txt",na.strings="?",sep=";")
# 
# subset the data. Only data for Feb 1, 2007 and Feb 2, 2007
#
power_data <- data_in[data_in$Date %in% as.character(c('2/2/2007','1/2/2007')),]
#
# To be sure order the data time of day within day and add a row number column. This will allow us to use row numbers on the x-axis.
#
power_data <- power_data[with(power_data,order(Date,Time)),]
power_data$row <- 1:nrow(power_data)
#
# Set up 2x2 plot window
#
par(mfrow=c(2,2))
#
# Global Active Power vs. Datetime plot
#
plot(power_data$row,power_data$Global_active_power,ylab = 'Global Active Power', xlab = ' ', type="l",xaxp=c(1,2880,2),xaxt='n')
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
#
# Plot of Voltage vs. Time plot
#
plot(power_data$row,power_data$Voltage,type="l",ylab="Voltage",xlab="datetime",xaxp=c(1,2880,2),xaxt='n',)
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
#
# Submetering vs datatime plot
#
plot(power_data$row,power_data$Sub_metering_1,ylab = 'Energy sub metering', xlab = ' ', type="l",xaxp=c(1,2880,2),xaxt='n')
with(subset(power_data), lines(Sub_metering_2,col='red'))
with(subset(power_data), lines(Sub_metering_3,col='blue'))
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),y.intersp=1)

#
# Global Reactive Power vs. Datetime
#
plot(power_data$row,power_data$Global_reactive_power,ylab = 'Global_reactive_power', xlab = 'datetime', type="l",xaxp=c(1,2880,2),xaxt='n')
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

