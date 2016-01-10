df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
df$DT<-paste(df$Date,df$Time) 
df$DT<-strptime(df$DT,"%d/%m/%Y %H:%M:%S")
DT1<-which(df$DT==strptime("2007-02-01","%Y-%m-%d"))
DT2<-which(df$DT==strptime("2007-02-02 23:59:00","%Y-%m-%d %H:%M:%S"))
sub.df<-df[DT1:DT2,]
png("plot4.png")
par(mfcol=c(2,2))
plot(sub.df$DT,as.numeric(as.character(sub.df$Global_active_power)),
     type="l",xlab="",ylab="Global Active Power")
plot(sub.df$DT,as.numeric(as.character(sub.df$Sub_metering_1)),
     type="l",xlab="",ylab ="Energy sub metering")
lines(sub.df$DT,as.numeric(as.character(sub.df$Sub_metering_2)),
      type="l",col="red")
lines(sub.df$DT,sub.df$Sub_metering_3,
      type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue"))
plot(sub.df$DT,as.numeric(as.character(sub.df$Voltage)),
     type="l", 
     xlab="datetime",ylab="Voltage")
plot(sub.df$DT,as.numeric(as.character(sub.df$Global_reactive_power)),
     type="l", 
     xlab="datetime",ylab="Global_reactive_power")
dev.off()