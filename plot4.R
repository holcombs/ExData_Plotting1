# Read Data
dat <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
dat$CDate <- as.Date(dat$Date,format="%d/%m/%Y")
dat$CTime <- strptime(dat$Time,format="%H:%M:%S")
dat$CDtTm <- strptime(paste(dat$Date,dat$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# Subset Data
udat <- subset(dat,CDate >= as.Date("2007-02-01",format="%Y-%m-%d")
               &  CDate <= as.Date("2007-02-02", format="%Y-%m-%d"))


# Plot 4 Multiple Plots
png("~/Documents/Classes/ExploratoryDataAnalysis/plot4.png")

par(mfrow=c(2,2))

# Subplot 1 Global Active Power
plot(udat$CDtTm,udat$Global_active_power,type='l',
     ylab="Global Active Power",xlab="")

# Subplot 2 Voltage
plot(udat$CDtTm,udat$Voltage,type='l',
     ylab="Voltage",xlab="datetime")

# Subplot 3 Sub metering
plot(udat$CDtTm,udat$Sub_metering_1,type='n',ylim=yrng,
     ylab="Energy sub metering",xlab="")
lines(udat$CDtTm,udat$Sub_metering_1,type='l',col='black')
lines(udat$CDtTm,udat$Sub_metering_2,type='l',col='blue')
lines(udat$CDtTm,udat$Sub_metering_3,type='l',col='red')
legend("topright",legend=paste("Sub_metering_",1:3,sep=""),
       col=c("black","blue","red"),lty=1,cex=0.5)

# Subplot 4 Global Reactive Power
plot(udat$CDtTm,udat$Global_reactive_power,type='l',
     ylab="Global Reactive Power",xlab="datetime")

dev.off()


