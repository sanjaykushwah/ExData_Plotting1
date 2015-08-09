file <- "data/household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data for days 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

#convert Date and Time column to Date class and store it in Date column
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#set english locale to get weekdays in english
Sys.setlocale("LC_ALL", "en_US")

#set layout
par(mfcol=c(2,2))

#make plot in top left
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power",xlab="")


#make plot in top left, legend border not visible, legend font adjusted
plot(data$Date,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, bty="n", col=c("black","red","blue"), cex=0.7)

#make plot in top right
plot(data$Date,data$Voltage, type="l",ylab="Voltage",xlab="datetime")

#make plot in top right
plot(data$Date,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

#copy graphic device to file
dev.copy(png,file="plot4.png")
dev.off()

