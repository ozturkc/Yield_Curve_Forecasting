#' @author {Cemal Öztürk}

# Clear workspace #
rm(list=ls())

# Set working directory #
setwd("/Users/cemalozturk/Documents/DATA+/Ph.D/Thesis/tikIV/MA-SelinaReinecke/R_MA_Reinicke")

source("01_packages.R")

#########################################
# BB data #

# Load csv #
BB_raw_data <- read.csv("BB_2009_2018.csv", sep = ",", header = FALSE, skip = 5, na.strings = c(".", "No value available"))
#SR: na.strings = set NA for empty rows.
BB_raw_data <- BB_raw_data[colSums(!is.na(BB_raw_data)) > 0]             # Delete NA columns.
rownames(BB_raw_data) <- BB_raw_data[,1]
BB_raw_data[,1] <- NULL
# 3470 x 31

BB_data <- na.omit(BB_raw_data)                    # Delete NA rows.
# 2413 x 31

# Vector with maturities #
mat.BB <- c(0.5, seq(1, 30, by=1))
# From package YieldCurve #
data(ECBYieldCurve)
ECB <- ECBYieldCurve
names <- names(ECB)             # 1:32
names <- names[-1]              # 1:31
colnames(BB_data) <- names

#write.xlsx(BB_data, file = "BB_data.xlsx")

# Convert to xts #
BB_daily <- as.xts(BB_data)

# Sample weekly data from daily data#
BB_week_OHLC <- to.weekly(BB_daily)        # to.weekly Function returns OHLC, not the original data.

# Retrieve index for weekly data
index <- index(BB_week_OHLC)                
BB_weekly <- BB_daily[index]

# Checks #
head(BB_weekly)
y <- weekdays(index(BB_weekly))
table(y)              # SR: always takes Mondays; otherwise different day.


# Export data for Gaussian Processes in Python #
# write.zoo(BB_weekly, "C:/Users/...Py_MA_Reinicke/BB_weekly_py.csv", sep = ",")
# write.csv(mat.BB, "C:/Users/...Py_MA_Reinicke/mat_BB.csv", row.names = FALSE)

#########################################
# fts-object from BB data #

# Naming of columns #
column_names <- index(BB_weekly)
column_names <- toString(column_names)
column_names <- strsplit(column_names, ", ")[[1]]

BB_weekly_core <- t(coredata(BB_weekly))                 # Matrix with BB data.
colnames(BB_weekly_core) <- column_names

# Create Functional time series object (by 'fts') #
BB_fts <- fts(x = mat.BB, y= BB_weekly_core, start = 1, xname = "Maturities", yname = "Yields")

# Indexed weeks instead of individual dates as colunn names #
yield_data <- BB_weekly_core
index_weeks <- c(1:dim(BB_weekly_core)[2])                     # ast change
colnames(yield_data) <- index_weeks

BB_indx_fts <- fts(x = mat.BB, y = yield_data, xname = "Maturities", yname = "Yields")




#########################################
# US data #

US_raw_data <- read.csv("US_2009_2018.csv", sep = ";", header = TRUE, na.strings = c("N/A"))
US_raw_data <- US_raw_data[colSums(!is.na(US_raw_data)) > 0]             # Delete NA columns.
US_raw_data <- na.omit(US_raw_data)
invisible(as.matrix(US_raw_data))        

# Correct dates #
us_dates <- as.Date(US_raw_data[,1], "%m.%d.%Y")
us_dates <- as.Date(format(us_dates, "20%y-%m-%d"))

US_raw_data[,1] <- NULL
rownames(US_raw_data) <- us_dates

# Convert to xts #
US_daily <- as.xts(US_raw_data)
US_daily <- US_daily["2009-04/2018-09"]

#write.xlsx(US_daily, file = "US_data.xlsx")

# Sample weekly data from daily data
US_week_OHLC <- to.weekly(US_daily)

# Retrieve index for weekly data
us_index <- index(US_week_OHLC)                
US_weekly <- US_daily[us_index]

mpy = 12.0
US_m = c(1.0,3.0,6.0,12.0, 24.0,36.0,60.0, 84.0, 120.0, 240.0, 360.0)
mat_US <- US_m/mpy


# Export data for Gaussian Processes in Python #
# write.zoo(US_weekly, "C:/Users/...Py_MA_Reinicke/US_weekly_py.csv", sep = ",")
# write.csv(mat_US, "C:/Users/...Py_MA_Reinicke/mat_US.csv", row.names = FALSE)

#########################################
# fts-object from US data #

# Naming of columns #
us_column_names <- index(US_weekly)
us_column_names <- toString(us_column_names)
us_column_names <- strsplit(us_column_names, ", ")[[1]]

US_weekly_core <- t(coredata(US_weekly))                 # Matrix with US data.
colnames(US_weekly_core) <- us_column_names

# Create Functional time series object (by 'fts') #
US_fts <- fts(x = mat_US, y = US_weekly_core, start = 1, xname = "Maturities", yname = "Yields")

# Indexed weeks instead of individual dates as colunn names #
us_yield_data <- US_weekly_core
us_index_weeks <- c(1:dim(US_weekly_core)[2])
colnames(us_yield_data) <- us_index_weeks

US_indx_fts <- fts(x = mat_US, y = us_yield_data, xname = "Maturities", yname = "Yields")

#########################################