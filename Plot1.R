

setwd("~/Desktop")

filename <- "data2.zip"

##Load the data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip "
download.file(fileURL, filename, method="curl")
unzip(filename) 
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Clean the data
hpcs <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
hpcs$Global_active_power <- as.numeric(hpcs$Global_active_power)

#Plot the data
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(hpcs$Global_active_power, col ="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()


