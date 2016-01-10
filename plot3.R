library(lubridate)
plot3<-function(path){
	data<-read.table(path, header=T, sep=";", stringsAsFactors = FALSE)
	 day_1<-data[grep(("^1/2/2007"), as.character(data$Date)),]
 	day_2<-data[grep(("^2/2/2007"), as.character(data$Date)),]
 	days<-rbind(day_1, day_2)
 	days$Date <- strptime((days$Date), "%d/%m/%Y")
 	get_date_time <- paste(days$Date, days$Time, sep=" ")
 	date_time <- ymd_hms(get_date_time)
 	sub_meter_1<-as.numeric(days$Sub_metering_1)
	sub_meter_2<-as.numeric(days$Sub_metering_2)
	sub_meter_3<-as.numeric(days$Sub_metering_3)

	#Create graph
	 plot(date_time, sub_meter_1, type = 'l',xlab="", ylab="Energy sub metering")
	 lines(date_time, sub_meter_2, col='red')
	 lines(date_time, sub_meter_3, col='blue')
	 legend("topright", lwd =2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

 }