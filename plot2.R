## Assumptions:
## 1. The data file has been downloaded and unzipped into working directory.
## 2. The plot2.R file has been downloaded and saved into the same working 
##    directory.

table <- read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", na.strings="NA", stringsAsFactors = FALSE)
table2 <- table[table$Date %in% c("1/2/2007","2/2/2007"),]
table2$Date.Time <- strptime(paste(table2$Date, table2$Time),
                            format = "%d/%m/%Y %H:%M:%S")

table2$Global_active_power <- as.numeric(table2$Global_active_power)
quartz(file="plot2.png",bg="white")
plot(table2$Date.Time, table2$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png")
dev.off()

