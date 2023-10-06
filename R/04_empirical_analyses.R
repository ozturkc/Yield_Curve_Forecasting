#' @author {Cemal Öztürk}

source("03_function_compare.R")


# Variables for functions #
horizon <- 4
st <- 1

# Error measurement by method = "rmse".

#########################################
# FPCA models #

# Arguments
#' @param fts_object = An object of class fts.
#' @param start = First week.
#' @param trainings_weeks = Number of weeks of training data.
#' @param h = Forecast horizon.
#' @param order_k = Number of principal components to fit.
#' @param pred_method = Univariate time series forecasting methods. Current possibilities are “ets”, “arima”, “ets.na”, “rwdrift” and “rw”.

res_BB_PCA <- wrap_PCA(trainings_weeks = 300, fts_object = BB_indx_fts, start = st, h = horizon, order_k = 3, pred_method = "arima")

res_US_PCA <- wrap_PCA(trainings_weeks = 250, fts_object = US_indx_fts, start = st, h = horizon, order_k = 3, pred_method = "arima")



#########################################
# Diebold-Li models #

# Arguments
#' @param xts_object = An object of class xts.
#' @param start = First week.
#' @param trainings_weeks = Number of weeks of training data.
#' @param h = Forecast horizon.
#' @param order_p = Lag of AR(p) model to fit.

res_BB_DL <- wrap_DL(trainings_weeks = 492, xts_object = BB_weekly, start = st, h = horizon, order_p = 1, mat_vec = mat.BB)   

res_US_DL <- wrap_DL(trainings_weeks = 492, xts_object = US_weekly, start = st, h = horizon, order_p = 1, mat_vec = mat_US)

#########################################
# Rolling functions: Estimating models with decreasing number of trainings weeks #

range_tw <- seq(250, 150, -10)
range_tw_lg <- seq(250, 150, -30)

# CHECK in 03_function_compare, if weight = FALSE or TRUE. #

# FPCA model #
results_FPCA_4_f3 <- sapply(range_tw, roll_PCA, fts_object = BB_indx_fts, start = 1, h = 4, order_k = 3, pred_method = "arima")
res_FPCA <- cbind(range_tw, results_FPCA_4_f3[1,])
results_FPCA_4_f3[2,]

results_FPCA_US_4_f3 <- sapply(range_tw, roll_PCA, fts_object = US_indx_fts, start = 1, h = 4, order_k = 3, pred_method = "arima")
res_FPCA_US_4_f3 <- cbind(range_tw, results_FPCA_US_4_f3[1,])
results_FPCA_US_4_f3[2,1:2]

results_FPCA_26_f3 <- sapply(range_tw, roll_PCA, fts_object = BB_indx_fts, start = 1, h = 26, order_k = 3, pred_method = "arima")
res_FPCA_BB_26_f3 <- cbind(range_tw, results_FPCA_26_f3[1,])
results_FPCA_26_f3[2,1:7]

results_FPCA_US_26_f3 <- sapply(range_tw, roll_PCA, fts_object = US_indx_fts, start = 1, h = 26, order_k = 3, pred_method = "arima")
res_FPCA_US_26_f3 <- cbind(range_tw, results_FPCA_US_26_f3[1,])
results_FPCA_US_26_f3[2,]

write.csv(rbind(res_FPCA, res_FPCA_US_4_f3, res_FPCA_BB_26_f3, res_FPCA_US_26_f3), file="res_FPCA_standard_f3.txt")




# DL Standard model #
# 3h
results_DL_26_1_BB <- sapply(range_tw_lg, roll_DL, xts_object = BB_weekly, start = st, h = 26, order_p = 1, mat_vec = mat.BB)
res_DL_BB_26 <- cbind(range_tw_lg, results_DL_26_1_BB[1,])
results_DL_26_1_BB[2,]
write.csv(res_DL_BB_26, file="DL_BB_h26_p1.txt") 

results_DL_26_1_US <- sapply(range_tw_lg, roll_DL, xts_object = US_weekly, start = st, h = 26, order_p = 1, mat_vec = mat_US)
res_DL_US_26 <- cbind(range_tw_lg, results_DL_26_1_US[1,])
results_DL_26_1_US[2,]
write.csv(res_DL_US_26, file="DL_US_h26_p1.txt")

results_DL_4_1_BB <- sapply(range_tw_lg, roll_DL, xts_object = BB_weekly, start = st, h = 4, order_p = 1, mat_vec = mat.BB)
res_DL_BB <- cbind(range_tw_lg, results_DL_4_1_BB[1,])
results_DL_4_1_BB[2,5:7]
write.csv(res_DL_BB, file="DL_BB_h4_p1.txt")

results_DL_4_1_US <- sapply(range_tw_lg, roll_DL, xts_object = US_weekly, start = st, h = 4, order_p = 1, mat_vec = mat_US)
res_DL_US <- cbind(range_tw_lg, results_DL_4_1[1,])
results_DL_4_1[2,]
write.csv(res_DL, file="DL_US_h4_p1")

#########################
results_DL_13_1_US <- sapply(range_tw_lg, roll_DL, xts_object = US_weekly, start = st, h = 13, order_p = 1, mat_vec = mat_US)
res_DL_US_13_1 <- cbind(range_tw_lg, results_DL_13_1_US[1,])
results_DL_13_1_US[2,]
write.csv(res_DL_US_13_1, file="DL_US_h13_p1.txt")


results_DL_13_4_US <- sapply(range_tw_lg, roll_DL, xts_object = US_weekly, start = st, h = 13, order_p = 4, mat_vec = mat_US)
res_DL_US_13_4 <- cbind(range_tw_lg, results_DL_13_4_US[1,])
results_DL_13_4_US[2,]
write.csv(res_DL_US_13_4, file="DL_US_h13_p4.txt")


# DL Variation with AR=4 #
# 4h
results_DL_4_4_BB <- sapply(range_tw, roll_DL, xts_object = BB_weekly, start = 1, h = 4, order_p = 4, mat_vec = mat.BB)
res_DL_BB_4_4_BB <- cbind(range_tw, results_DL_4_4_BB[1,])
write.csv(res_DL_BB_4_4_BB, file="DL_BB_h4_p4.txt") 
results_DL_4_4_BB[2,1:2]

results_DL_4_4_US <- sapply(range_tw, roll_DL, xts_object = US_weekly, start = 1, h = 4, order_p = 4, mat_vec = mat_US)
res_DL_BB_4_4_US <- cbind(range_tw, results_DL_4_4_US[1,])
results_DL_4_4_US[2,1:2]

results_DL_26_4_BB <- sapply(range_tw, roll_DL, xts_object = BB_weekly, start = 1, h = 26, order_p = 4, mat_vec = mat.BB)
res_DL_BB_26_4_BB <- cbind(range_tw, results_DL_26_4_BB[1,])
results_DL_26_4_BB[2,]

results_DL_26_4_US <- sapply(range_tw, roll_DL, xts_object = US_weekly, start = 1, h = 26, order_p = 4, mat_vec = mat_US)
res_DL_BB_26_4_US <- cbind(range_tw, results_DL_26_4_US[1,])
results_DL_26_4_US[2,1]



# Comparison RW #
wrap_RW(trainings_weeks = 300, fts_object = BB_indx_fts, start = st, h = 4)
range_tw <- seq(350, 250, -30)
results_RW_4 <- sapply(range_tw, wrap_RW, fts_object = BB_indx_fts, start = 1, h = 4)
res_RW<- cbind(range_tw, results_RW_4[2,])
write.csv(res_RW, file = "BB_RW_4.csv")

results_RW_26 <- sapply(range_tw, wrap_RW, fts_object = BB_indx_fts, start = 1, h = 26)
res_RW_BB_26<- cbind(range_tw, results_RW_26[2,])
write.csv(res_RW_BB_26, file = "BB_RW_26.csv")

results_RW_US_4 <- sapply(range_tw, wrap_RW, fts_object = US_indx_fts, start = 1, h = 4)
res_RW_US_4<- cbind(range_tw, results_RW_US_4[2,])
write.csv(res_RW_US_4, file = "US_RW_4.csv")

results_RW_US_26 <- sapply(range_tw, wrap_RW, fts_object = US_indx_fts, start = 1, h = 26)
res_RW_US_26<- cbind(range_tw, results_RW_US_26[2,])
write.csv(res_RW_US_26, file = "US_RW_26.csv")
