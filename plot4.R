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

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(hpc_nk,{plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab="")
          plot(DateTime,Voltage,type="l",xlab="datetime")
          plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
          lines(DateTime,Sub_metering_2,col="Red")
          lines(DateTime,Sub_metering_3,col="Blue")
          legend("topright",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")
          plot(DateTime,Global_reactive_power,type="l",xlab="datetime")})
dev.off()