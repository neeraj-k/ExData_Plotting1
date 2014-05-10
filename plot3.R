##Load data from the file
##Note : File must be in the working directory

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

hpc_nk<-  household_power_consumption[household_power_consumption$Date=="2/2/2007" | household_power_consumption$Date=="1/2/2007",]

##Create a new column DateTime with Date Time fileds combined as Date class
x <- paste(hpc_nk$Date, hpc_nk$Time)
hpc_nk$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

##Convert character to the numeric fields 
hpc_nk[,3:9] <- apply(hpc_nk[,3:9], 2, function(x) as.numeric(as.character(x)))


##Create and save plot
png("plot3.png",width=480,height=480)
plot(hpc_nk$DateTime,hpc_nk$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(hpc_nk$DateTime,hpc_nk$Sub_metering_2,col="Red")
lines(hpc_nk$DateTime,hpc_nk$Sub_metering_3,col="Blue")
##title(xlab="Energy sub metering",ylab="")
legend("topright",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()