# Read Data
dat <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
dat$CDate <- as.Date(dat$Date,format="%d/%m/%Y")
dat$CTime <- strptime(dat$Time,format="%H:%M:%S")
dat$CDtTm <- strptime(paste(dat$Date,dat$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# Subset Data
udat <- subset(dat,CDate >= as.Date("2007-02-01",format="%Y-%m-%d")
               &  CDate <= as.Date("2007-02-02", format="%Y-%m-%d"))

rng <- range(as.numeric(c(udat$Sub_metering_1,udat$Sub_metering_2,udat$Sub_metering_2,udat$Sub_metering_3)))

png("~/Documents/Classes/ExploratoryDataAnalysis/plot3.png")
plot(udat$CDtTm,udat$Sub_metering_1,type='n',ylim=yrng,
     ylab="Energy sub metering",xlab="")
lines(udat$CDtTm,udat$Sub_metering_1,type='l',col='black')
lines(udat$CDtTm,udat$Sub_metering_2,type='l',col='blue')
lines(udat$CDtTm,udat$Sub_metering_3,type='l',col='red')
legend("topright",legend=paste("Sub_metering_",1:3,sep=""),
       col=c("black","blue","red"),lty=1)
dev.off()

