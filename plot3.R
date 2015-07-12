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

#plot3
with(subset,{plot(Sub_metering_1~Datetime,type="l", ylab="Global Active Power (kilowatts)", xlab="")
             lines(Sub_metering_2~Datetime,col="red")
             lines(Sub_metering_3~Datetime,col="blue")
})

legend("topright", col=c("black", "red", "blue"), lty=2, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#copying
dev.copy(png,file="plot3.png",height=480, width=480)
dev.off()
