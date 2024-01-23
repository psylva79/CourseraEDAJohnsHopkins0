library(readr)
household_power_consumption <- read_delim("C:/Users/pmps/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", 
                                          delim = ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                               Global_active_power = col_number(), 
                                                                                               Global_reactive_power = col_number(), 
                                                                                               Voltage = col_number(), Global_intensity = col_number(), 
                                                                                               Sub_metering_1 = col_number(), Sub_metering_2 = col_number()), 
                                          trim_ws = TRUE)

df1 <- subset(household_power_consumption, Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"),
              select = c("Date", "Time", "Global_active_power"))


# df1$Datetime <- lubridate::ymd_hms(paste(df1$Date, df1$Time))
df1$Datetime <- as.POSIXct(paste(df1$Date, df1$Time))


df1 <- df1[order(df1$Date, df1$Time),]

plot(df1$Datetime, df1$Global_active_power, 
     ylab="Global Active Power (kilowatts)",
     xlab="", 
     type = "l", xaxt = "n"
)

axis(side = 1, at =df1$Datetime[c(1, 1200, 2880)], labels=c("Thu", "Fri", "Sat"))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
