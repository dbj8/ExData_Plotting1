x <- read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,colClasses=c(NA,NA,"character","character","character","character","character","character","character"))
x <- x[x$Sub_metering_1 != "?" & x$Sub_metering_2 != "?" & x$Sub_metering_3 != "?" & x$Global_active_power != "?" & x$Global_reactive_power != "?" & x$Voltage != "?",]
x[["Date"]] <- as.Date(x[["Date"]],"%d/%m/%Y")
x <- x[x$Date == "2007-02-01" | x$Date == "2007-02-02",]
dateTimeLabel <- as.POSIXct(strptime(paste(x$Date,x$Time), "%Y-%m-%d %H:%M:%S")) 
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1) 
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2) 
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)
x$Voltage<- as.numeric(x$Voltage) 
x$Global_active_power <- as.numeric(x$Global_active_power) 
x$Global_reactive_power <- as.numeric(x$Global_reactive_power) 


#png(file = "plot2.png") ## Open PDF device; create 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)

