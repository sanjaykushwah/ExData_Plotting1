#set current directory as working directory
setwd("./");

#Load File into dataset data
file <- "data/household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data for days 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

#convert Date and Time column to Date class and store it in Date column
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#set english locale to get weekdays in english
Sys.setlocale("LC_ALL", "en_US")

#make plot2
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
