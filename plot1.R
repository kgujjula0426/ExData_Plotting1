# Coursera Data Science: Exploratory Data Analysis
# Week 1 project 1: Plot1
# Kavya Gujjula

## Step is to load the data

library("data.table")
setwd("C:/Users/i55245/Documents/CourseEra/UCIrvine/Data")

# Read data from file , Subset data for dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Next step is to change the date column to date type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates 

powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Now printing Plot 1

hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()












