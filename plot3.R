x <- read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,colClasses=c(NA,NA,"NULL","NULL","NULL","NULL","character","character","character"))
x <- x[x$Sub_metering_1 != "?" & x$Sub_metering_2 != "?" & x$Sub_metering_3 != "?",]
x[["Date"]] <- as.Date(x[["Date"]],"%d/%m/%Y")
x <- x[x$Date == "2007-02-01" | x$Date == "2007-02-02",]
dateTimeLabel <- as.POSIXct(strptime(paste(x$Date,x$Time), "%Y-%m-%d %H:%M:%S")) 
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1) 
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2) 
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3) 


#png(file = "plot2.png") ## Open PDF device; create 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)
par(mfcol = c(1, 1))
par(mar=c(5.1,4.1,4.1,2.1))
with(x,{
        plot(dateTimeLabel,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
        lines(dateTimeLabel,Sub_metering_1,col="black")
        lines(dateTimeLabel,Sub_metering_2,col="red")
        lines(dateTimeLabel,Sub_metering_3,col="blue")
        legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
#dev.off() 

dev.copy(png, file = "plot3.png",height=480,width=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!