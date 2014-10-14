# Read Data
dat <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
dat$CDate <- as.Date(dat$Date,format="%d/%m/%Y")
dat$CTime <- strptime(dat$Time,format="%H:%M:%S")
dat$CDtTm <- strptime(paste(dat$Date,dat$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# Subset Data
udat <- subset(dat,CDate >= as.Date("2007-02-01",format="%Y-%m-%d")
               &  CDate <= as.Date("2007-02-02", format="%Y-%m-%d"))

# Plot 2 Global Active Power by Day of Week
png("~/Documents/Classes/ExploratoryDataAnalysis/plot2.png")
plot(udat$CDtTm,udat$Global_active_power,type='l',
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
