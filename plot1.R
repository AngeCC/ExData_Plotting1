setwd("~/Desktop/Exploratory Data Analysis/Project1Data")
HPCfile<-"./household_power_consumption.txt"
hpc<-read.table(HPCfile,sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings="?")
str(hpc)
power<-subset(hpc,hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
str(power)

#### plot 1
png("plot1.png",width = 480,height=480)
hist(power$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
