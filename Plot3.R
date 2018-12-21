

setwd("~/Desktop")

filename <- "data2.zip"

##Load the data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip "
download.file(fileURL, filename, method="curl")
unzip(filename) 
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Clean the data
hpcs <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
hpcs1 <- strptime(paste(hpcs$Date, hpcs$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1<- as.numeric(hpcs$Sub_metering_1)
sm2<- as.numeric(hpcs$Sub_metering_2)
sm3<- as.numeric(hpcs$Sub_metering_3)

##Plot the data
png("plot3.png", width=480, height=480)
plot(hpcs1, hpcs$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(hpcs1, hpcs$Sub_metering_2, col = "red")
lines(hpcs1, hpcs$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2.5, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()




