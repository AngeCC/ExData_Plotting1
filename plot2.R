setwd("~/Desktop/Exploratory Data Analysis/Project1Data")
HPCfile<-"./household_power_consumption.txt"
hpc<-read.table(HPCfile,sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings="?")
str(hpc)
power<-subset(hpc,hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
str(power)

#### plot 2

power$datetime<-strptime(paste(power$Date,power$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
class(power$datetime)

png("plot2.png",width = 480,height=480)
plot(power$datetime,power$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
