# Plot1.R creates uses the Electric Power Consumption data set to construct a frequency histogram 
# of global active power in kilowatts.
#
data_in <- read.csv("household_power_consumption.txt",na.strings="?",sep=";")
# 
# subset the data. Only data for Feb 1, 2007 and Feb 2, 2007
#
power_data <- data_in[data_in$Date %in% as.character(c('2/2/2007','1/2/2007')),]
#
# Create Frequency Histogram
#
hist(power_data$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency")