#downloading file from source
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="myfile.zip")

#unzipping file
unzip("myfile.zip")

#file path
myFile <- "household_power_consumption.txt"


#file path
#yFile <- "r/exdata-data-household_power_consumption/household_power_consumption.txt"

#reading file to memory
#IMPORTANT: na.string in this dataset is indicated as "?" 
dat <- read.table(myFile, sep=";", header=TRUE, na.strings=c("?"))

#subsetting data to between 1/2/2007 to 2/2/2007
dat1 <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

##fixing the time
# Combining the date and time column into one
datetime <- paste(dat1$Date, dat1$Time)
# Formating the time with strpTime
datetimeStp <- strptime(datetime, format="%d/%m/20%y  %H:%M:%S")
dat1$Datetime <- datetimeStp

#plotting graph
par(mar=c(4,5,2,1))

#plotting using type "l"
plot(dat1$Datetime, as.numeric(dat1$Sub_metering_1), xlab = "", ylab="Energy sub metering",type="l")
#plot Sub_metering_2
lines(dat1$Datetime, as.numeric(dat1$Sub_metering_2), type="l", col="red")
#plot sub-metering_3
lines(dat1$Datetime, as.numeric(dat1$Sub_metering_3), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6, lty=c(1,1,1), col=c("black", "blue", "red"))

dev.copy(png, file="plot3.png", width=480, height=480, units="px")
dev.off()
