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
png(filename="plot1.png",width=480,height=480)

hist(eda1$Global_active_power,col='red',main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off

