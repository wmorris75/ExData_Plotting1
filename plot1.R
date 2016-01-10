plot1<-function(path){
	data<-data<-read.table(path, header=T, sep=";", stringsAsFactors = FALSE)
	 day_1<-data[grep(("^1/2/2007"), as.character(data$Date)),]
 	day_2<-data[grep(("^2/2/2007"), as.character(data$Date)),]
 	days<-rbind(day_1, day_2)
 	hist(as.numeric(days$Global_active_power), 
 		main="Global Active Power", 
 		xlab="Global Active Power (kilowatts)", 
     	border="black", 
     	col="red")
}


 # data<-data<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = FALSE)
 # day_1<-data[regexpr(("^1/2/2007"), as.character(data$Date)),]
 # day_2<-data[regexpr(("^2/2/2007"), as.character(data$Date)),]
 # days<-rbind(day_1, day_2)
 # hist(as.numeric(days$Global_active_power), 
 # 		main="Global Active Power", 
 # 		xlab="Global Active Power", 
 #     	border="black", 
 #     	col="red")