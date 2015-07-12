
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

#plot 1
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#saving file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
