x <- read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,colClasses=c(NA,"NULL","character","NULL","NULL","NULL","NULL","NULL","NULL"))
x[["Date"]] <- as.Date(x[["Date"]],"%d/%m/%Y")
# y <- x$Date == "2007-02-01" | x$Date == "2007-02-02"
x <- x[x$Date == "2007-02-01" | x$Date == "2007-02-02",]
x <- x[x$Global_active_power != "?",]
x$Global_active_power <- as.numeric(x$Global_active_power)

par(mfcol = c(1, 1))
par(mar=c(5.1,4.1,4.1,2.1))
#png(file = "plot1.png") ## Open PDF device; create 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)
hist(x$Global_active_power,col="red",main=paste("Global Active Power"),xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off() 