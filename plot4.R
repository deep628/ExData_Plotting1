#Reading File
hpc <- read.table("household_power_consumption.txt",header =TRUE,sep =";",dec=".",stringsAsFactors= FALSE)
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#subsetting Data
subset <- subset(hpc,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting dates
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)

#change global power to numeric value
globalActivePower <- as.numeric(subset$Global_active_power)

#plot4
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(subset,{
        plot(globalActivePower~Datetime,type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime,type="l",ylab="Voltage(Volt",xlab="")
        plot(Sub_metering_1~Datetime,type="l",ylab="Global Active Power (killowatts)",xlab="")
        lines(Sub_metering_2~Datetime,col="red")
        lines(Sub_metering_3~Datetime,col="blue")
        legend("topright",col=c("black","red","blue"),lty=1,lwd=2,bty="n",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime,type="l",ylab="Global_reactive_power(Killowatts)",xlab="")
            
})

#copying
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
