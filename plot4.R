library(lubridate)

plot4<-function(path){
	data<-read.table(path, header=T, sep=";", stringsAsFactors = FALSE)
	 day_1<-data[grep(("^1/2/2007"), as.character(data$Date)),]
 	day_2<-data[grep(("^2/2/2007"), as.character(data$Date)),]
 	days<-rbind(day_1, day_2)
 	days$Date <- strptime((days$Date), "%d/%m/%Y")
 	get_date_time <- paste(days$Date, days$Time, sep=" ")
 	date_time <- ymd_hms(get_date_time)
 	global_active_power <- as.numeric(days$Global_active_power)

 	sub_meter_1<-as.numeric(days$Sub_metering_1)
	sub_meter_2<-as.numeric(days$Sub_metering_2)
	sub_meter_3<-as.numeric(days$Sub_metering_3)

 	par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
	with(days, {
		plot(date_time, as.numeric(days$Global_active_power), ylab="Global Active Power", type='l')
		plot(date_time, as.numeric(days$Voltage), xlab="datetime", ylab="Voltage",  type='l')
		plot(date_time, as.numeric(days$Sub_metering_1), xlab="", ylab="Energy sub metering",  type='l')
		lines(date_time, sub_meter_2, col='red')
		lines(date_time, sub_meter_3, col='blue')
		legend("topright", lwd =2, col = c("black", "red", "blue"), bty='n', cex=0.5, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
		plot(date_time, as.numeric(days$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power",  type='l')
		})


 }

 		