#downloading file from source
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="myfile.zip")

#unzipping file
unzip("myfile.zip")

#file path
myFile <- "household_power_consumption.txt"

#file path
#myFile <- "r/exdata-data-household_power_consumption/household_power_consumption.txt"

#reading file to memory
dat <- read.table(myFile, sep=";", header=TRUE)

#subsetting data to between 1/2/2007 to 2/2/2007
dat1 <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

# converting data to be plot to numeric
datplot1 <- as.numeric(dat1$Global_active_power)

#plotting graph
par(mar=c(4,5,2,1))

hist(datplot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatt)")

dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()
