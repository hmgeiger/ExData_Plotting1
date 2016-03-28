#Before running this program, I got the subset of dates that we needed and output into a different text file to make the data frame more manageable. This could be considered a cheat I suppose, but it seemed much easier to just use my Unix/Linux text processing skills rather than doing it in R.

#file="/Users/hmgeiger/Downloads/household_power_consumption.txt"
#output="/Users/hmgeiger/Downloads/household_power_consumption_02.01_and_02.02_2007.txt"

#head -n 1 $file > $output
#grep -E '1\/2\/2007|2\/2\/2007' $file | grep -v -E '11|12|21|22' >> $output

#Read in the data into a data frame. Also, get the date and time formatted as data and time and not just a character in R.

info <- read.delim("/Users/hmgeiger/Downloads/household_power_consumption_02.01_and_02.02_2007.txt",sep=";",header=TRUE)
date_and_time <- strptime(paste(as.vector(info[,"Date"]),as.vector(info[,"Time"]),sep=" "),format='%d/%m/%Y  %H:%M:%S')

#Make one line plot with different colored lines for sub metering 1,2, and 3. 

png("plot3.png")
plot(date_and_time,info[,"Sub_metering_1"],type="l",col="black",xlab="",ylab="Energy sub metering")
lines(date_and_time,info[,"Sub_metering_2"],type="l",col="red")
lines(date_and_time,info[,"Sub_metering_3"],type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))
dev.off()

