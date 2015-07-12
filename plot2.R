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

#Plot2
plot(globalActivePower~subset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#savingFile
dev.copy(png,file="plot2.png",height=480 , width=480)
dev.off()
