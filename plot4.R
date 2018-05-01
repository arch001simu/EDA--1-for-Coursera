###run eda1 for coursera

setwd("d:/Users/zhangsm8/Desktop/Coursera/eda")
rm(list=ls())
options(java.parameters = "-Xmx8000m")

eda1<-read.table("household_power_consumption.txt",header=T,sep=';', stringsAsFactors = FALSE,
                 na.strings = "?")

eda1<-subset(eda1,)

str(eda1)
dim(eda1)
head(eda1)

##Change Date Format
eda1$Date<-as.Date(eda1$Date,"%d/%m/%Y")
head(eda1)

##Change Scpope
x<-as.Date(c("2007-02-01","2007-02-02"))

eda1<-subset(eda1,Date%in%x)

##Create New Time Measure

eda1$ntime<-strptime(paste(eda1$Date,eda1$Time),"%Y-%m-%d %H:%M:%S")


##Plot
png(filename="plot4.png",width=480,height=480)

par(mfrow = c(2,2))

with(eda1, plot(ntime, Global_active_power,
                    type = "l",
                    xlab = "",
                    ylab = "Global Active power"))

with(eda1, plot(ntime,Voltage,xlab = "datetime", type = "l"))

plot(eda1$ntime,
     eda1$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(eda1$ntime,
      eda1$Sub_metering_2,
      type = "l",
      col = "red")
lines(eda1$ntime,
      eda1$Sub_metering_3,
      type = "l",
      col = "blue")
legend("topright",
       pch = "--",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(eda1, plot(ntime,Global_reactive_power,xlab = "datetime", type="l"))


dev.off

