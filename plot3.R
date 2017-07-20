setwd("~/Desktop/Exploratory Data Analysis/Project1Data")
HPCfile<-"./household_power_consumption.txt"
hpc<-read.table(HPCfile,sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings="?")
str(hpc)
power<-subset(hpc,hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
str(power)

#### plot 3

png("plot3.png",width = 480,height=480)
plot(power$datetime,power$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(power$datetime,power$Sub_metering_1,type="l")
lines(power$datetime,power$Sub_metering_2,type="l",col="red")
lines(power$datetime,power$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()