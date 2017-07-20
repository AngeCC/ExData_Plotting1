setwd("~/Desktop/Exploratory Data Analysis/Project1Data")
HPCfile<-"./household_power_consumption.txt"
hpc<-read.table(HPCfile,sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings="?")
str(hpc)
power<-subset(hpc,hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
str(power)

# plot 4 consisting of 4 smaller plots

power$datetime<-strptime(paste(power$Date,power$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
class(power$datetime)
png("plot4.png",width = 480,height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# make first plot
plot(power$datetime,power$Global_active_power,type="l",ylab="Global Active Power",cex=0.2,xlab="")

# second plot
plot(power$datetime,power$Voltage,type="l",ylab="Voltage",xlab="datetime",cex=0.2)

plot(power$datetime,power$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",cex=0.2)
lines(power$datetime,power$Sub_metering_1,type="l")
lines(power$datetime,power$Sub_metering_2,type="l",col="red")
lines(power$datetime,power$Sub_metering_3,type="l",col="blue")

legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=0.8,box.col = "white",bg = "white")

plot(power$datetime,power$Global_reactive_power,type="l",ylab="Global_reactive-power",xlab="datetime",cex=0.2)
dev.off()
