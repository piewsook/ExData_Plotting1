#downloading file from source
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="myfile.zip")

#unzipping file
unzip("myfile.zip")

#file path
myFile <- "household_power_consumption.txt"

#file path
#myFile <- "r/exdata-data-household_power_consumption/household_power_consumption.txt"

#reading file to memory
dat <- read.table(myFile, sep=";", header=TRUE, na.strings=c(""))

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
plot(dat1$Datetime, as.numeric(dat1$Global_active_power), xlab = "", ylab="Global Active Power(kilowatts)", type="l")


dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()


