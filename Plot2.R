

setwd("~/Desktop")

filename <- "data2.zip"

##Load the data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip "
download.file(fileURL, filename, method="curl")
unzip(filename) 
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Clean the data
hpcs1 <- strptime(paste(hpcs$Date, hpcs$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(hpcs$Global_active_power)

##Plot the data
png("plot2.png", width=480, height=480)
plot(hpcs1, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

