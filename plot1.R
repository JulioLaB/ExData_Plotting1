##just for curiosity... how much memory will I need?
##2075259 rows and 9 columns, asusming all being filled with numbers...
##2075259*9*8/2^20= 150 Mb, I am safe!

#set you own path to the folder where the data is
path <- "C:\\Users\\Julio\\Documents\\data-science-jhuniversity\\4exploratorydataanalysis\\week1assignment"
setwd(path)

#load the cool packages we've learnt about
require(dplyr)
require(lubridate)

#read table
mytable <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors= FALSE, header = TRUE)

#convert column 1 to date and select your days
mytable[,1] <- dmy(mytable[,1]) 
mydays <- mytable[ which( mytable$Date == ymd("20070201") | mytable$Date == ymd("20070202")), ]

#make a column with Date+Time,then delete Time
mydays <- mydays %>% 
        mutate(Date, "Date" = paste(Date, Time)) %>%
        select(-Time)

#format the new column to ymd_hms
mydays[,1] <- ymd_hms(mydays[,1]) 


#open the png device
png("plot1.png" ,width = 480, height = 480, units = "px")

#run the plot
hist(mydays$Global_active_power, 
     ylab = "Frequency", xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power", col="orange")

#close device
dev.off()

