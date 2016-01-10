df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
df$DT<-paste(df$Date,df$Time) 
df$DT<-strptime(df$DT,"%d/%m/%Y %H:%M:%S")
DT1<-which(df$DT==strptime("2007-02-01","%Y-%m-%d"))
DT2<-which(df$DT==strptime("2007-02-02 23:59:00","%Y-%m-%d %H:%M:%S"))
sub.df<-df[DT1:DT2,]
png("plot1.png")
hist(as.numeric(as.character(sub.df$Global_active_power)),
     breaks=12,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
