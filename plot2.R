library(lubridate)
plot2<-function(path){
	data<-read.table(path, header=T, sep=";", stringsAsFactors = FALSE)
	day_1<-data[grep(("^1/2/2007"), as.character(data$Date)),]
 	day_2<-data[grep(("^2/2/2007"), as.character(data$Date)),]
 	days<-rbind(day_1, day_2)
 	days$Date <- strptime((days$Date), "%d/%m/%Y")
 	get_date_time <- paste(days$Date, days$Time, sep=" ")
 	date_time <- ymd_hms(get_date_time)
 	global_active_power <- as.numeric(days$Global_active_power)
 	plot(date_time, global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = 'l')
 }