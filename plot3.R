## Assumptions:
## 1. The data file has been downloaded and unzipped into working directory.
## 2. The plot3.R file has been downloaded and saved into the same working 
##    directory.

table <- read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", na.strings="NA", stringsAsFactors = FALSE)
table2 <- table[table$Date %in% c("1/2/2007","2/2/2007"),]
table2$Date.Time <- strptime(paste(table2$Date, table2$Time),
                            format = "%d/%m/%Y %H:%M:%S")

table2$Global_active_power <- as.numeric(table2$Global_active_power)
table2$Sub_metering_1 <- as.numeric(table2$Sub_metering_1) 
table2$Sub_metering_2 <- as.numeric(table2$Sub_metering_2) 
quartz(file="plot3.png",bg="white")
plot(table2$Date.Time, table2$Sub_metering_1,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(table2$Date.Time, table2$Sub_metering_2,col="red")
lines(table2$Date.Time, table2$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red", "blue"),
       lty = c("solid", "solid", "solid"), legend = names(table2[,7:9]))
dev.copy(png,file="plot3.png")
dev.off()


