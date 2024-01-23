library(readr)
household_power_consumption <- read_delim("C:/Users/pmps/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", 
                                          delim = ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                               Global_active_power = col_number(), 
                                                                                               Global_reactive_power = col_number(), 
                                                                                               Voltage = col_number(), Global_intensity = col_number(), 
                                                                                               Sub_metering_1 = col_number(), Sub_metering_2 = col_number()), 
                                          trim_ws = TRUE)

df1 <- subset(household_power_consumption, Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"),
              select = c("Date", "Global_active_power"))


hist(df1$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (Kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     xlim = c(0,6) #,
     #ylim = c(0,1200000), 
     #breaks = 24
)

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
