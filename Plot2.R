# Plot2.R creates uses the Electric Power Consumption data set to construct a line plot of Global active power by kilowatt for the period of 02/01/2007-02/02/2007 
# of three sub-metering categories.
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
# Create line plot
#
plot(power_data$row,power_data$Global_active_power,ylab = 'Global Active Power (kilowatts)', xlab = ' ', type="l",xaxp=c(1,2880,2),xaxt='n')
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
