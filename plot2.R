x <- read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,colClasses=c(NA,NA,"character","NULL","NULL","NULL","NULL","NULL","NULL"))
x <- x[x$Global_active_power != "?",]
x[["Date"]] <- as.Date(x[["Date"]],"%d/%m/%Y")
x <- x[x$Date == "2007-02-01" | x$Date == "2007-02-02",]
dateTimeLabel <- as.POSIXct(strptime(paste(x$Date,x$Time), "%Y-%m-%d %H:%M:%S")) 
x$Global_active_power <- as.numeric(x$Global_active_power) 

#dateTimeLabel <- strptime(paste(x[["Date"]],x[["Time"]]),"%m/%d/%Y %H:%M:%S")

#png(file = "plot2.png") ## Open PDF device; create 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)
par(mfcol = c(1, 1))
par(mar=c(5.1,4.1,4.1,2.1))
with(x,{
        plot(dateTimeLabel,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
        lines(dateTimeLabel,Global_active_power)
        })
#dev.off() 

dev.copy(png, file = "plot2.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!