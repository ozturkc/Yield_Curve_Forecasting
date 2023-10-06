#########################################
results_plots <- read.table("results_plots.csv", sep=";", header = FALSE)

#########################################
# DL model #
#########################################
# range_tw = seq(350, 250, -10) #
DL_BB_4_1_350_250 <- as.numeric(results_plots[9,2:12])
df_DL_BB_4_1_350_250 <- data.frame(Data = "BB", RMSE = DL_BB_4_1_350_250)

DL_US_4_1_350_250 <- as.numeric(results_plots[10,2:12])
df_DL_US_4_1_350_250 <- data.frame(Data = "US", RMSE = DL_US_4_1_350_250)

plot.data_5 = rbind(df_DL_BB_4_1_350_250, df_DL_US_4_1_350_250)

# Boxplots: Standard Model # 
ggplot(plot.data_5, aes(x=Data, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.9)) +
  labs(title = "Forecasting with Diebold-Li: h=4 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_DL_4_mid.pdf", width=6, height=6)

# range_tw = seq(400, 250, -30) #
DL_BB_26_1_400_250 <- as.numeric(results_plots[11,2:12])
df_DL_BB_26_1_400_250 <- data.frame(Data = "BB", RMSE = DL_BB_26_1_400_250)

DL_US_26_1_400_250 <- as.numeric(results_plots[12,2:12])
df_DL_US_26_1_400_250 <- data.frame(Data = "US", RMSE = DL_US_26_1_400_250)

plot.data_6 = rbind(df_DL_BB_26_1_400_250, df_DL_US_26_1_400_250)

ggplot(plot.data_6, aes(x=Data, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.9)) +
  labs(title = "Forecasting with Diebold-Li: h=26 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_DL_26_mid.pdf", width=6, height=6)



## Variation models #
# BB_weekly, start=1, h=4, order_p=4 range_tw = seq(350, 250, -20) #      
df_DL_BB_4_1_study <- data.frame(Study = "AR(1)", RMSE = DL_BB_4_1_350_250)

DL_BB_4_4_350_250 <- as.numeric(results_plots[13,2:12])
df_DL_BB_4_4_study <- data.frame(Study = "AR(p)", RMSE = DL_BB_4_4_350_250)

plot.data8 = rbind(df_DL_BB_4_1_study, df_DL_BB_4_4_study)

# Boxplots: Variation model 2 - BB h=4 # 
a <- ggplot(plot.data8, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.9)) +
  labs(title = "Forecasting with Diebold-Li: h=4 ahead", x = 'AR(p) processes' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
a +   theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("BB_DL_4_4.pdf", width=6, height=6)


# BB_weekly, start=1, h=26, order_p=4 range_tw = seq(350, 250, -20) #      
df_DL_BB_26_1_study <- data.frame(Study = "AR(1)", RMSE = DL_BB_26_1_400_250)

DL_BB_26_4_350_250 <- as.numeric(results_plots[15,2:12])
df_DL_BB_26_4_study <- data.frame(Study = "AR(p)", RMSE = DL_BB_26_4_350_250)

plot.data9 = rbind(df_DL_BB_26_1_study, df_DL_BB_26_4_study)

# Boxplots: Variation model 2 - BB h=26 # 
ggplot(plot.data9, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.9)) +
  labs(title = "Forecasting with Diebold-Li: h=26 ahead", x = 'AR(p) processes' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_DL_26_4.pdf", width=6, height=6)


# US_weekly, start=1, h=4, order_p=4 range_tw = seq(350, 250, -20) #      
df_DL_US_4_1_study <- data.frame(Study = "AR(1)", RMSE = DL_US_4_1_350_250)

DL_US_4_4_350_250 <- as.numeric(results_plots[14,2:12])
df_DL_BB_4_4_study <- data.frame(Study = "AR(p)", RMSE = DL_US_4_4_350_250)

plot.data10 = rbind(df_DL_US_4_1_study, df_DL_BB_4_4_study)

# Boxplots: Variation model 2 - US h=4 # 
ggplot(plot.data10, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.9)) +
  labs(title = "Forecasting with Diebold-Li: h=4 ahead", x = 'AR(p) processes' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("US_DL_4_4.pdf", width=6, height=6)


# US_weekly, start=1, h=26, order_p=4 range_tw = seq(350, 250, -20) #      
df_DL_US_26_1_study <- data.frame(Study = "AR(1)", RMSE = DL_US_26_1_400_250)

DL_US_26_4_350_250 <- as.numeric(results_plots[16,2:12])
df_DL_BB_26_4_study <- data.frame(Study = "AR(p)", RMSE = DL_US_26_4_350_250)

plot.data11 = rbind(df_DL_US_26_1_study, df_DL_BB_26_4_study)

# Boxplots: Variation model 2 - US h=26 # 
ggplot(plot.data11, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.9)) +
  labs(title = "Forecasting with Diebold-Li: h=26 ahead", x = 'AR(p) processes' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("US_DL_26_4.pdf", width=6, height=6)




# BB_weekly, start=1, h=4, order_p=1, range_tw = seq(472, 400, -10) #
A <-  c(0.19154,	0.18393,	0.17134,	0.17387,	0.17837,	0.1788,	0.17805,	0.1829)
a <- data.frame(Study = "AR(1)", RMSE = A)

# BB_weekly, start=1, h=4, order_p=2 range_tw = seq(472, 400, -10) #      
B <- c(0.14536,	0.14702,	0.13805,	0.13698,	0.13949,	0.14138,	0.14046,	0.14401)
b <- data.frame(Study = "AR(2)", RMSE = B)

plot.data = rbind(a, b)

# Boxplots: Variation model 2: end # 
ggplot(plot.data, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.2)) +
  labs(title = "Forecasting with Diebold-Li: h=4 ahead", x = 'AR(p) processes' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_DL_4.pdf", width=6, height=6)

####






#########################################
# DL model #
#########################################
# Plots for influence of number of trainings_weeks #
range_tw_plot = seq(472, 400, -10)
plot.data2 = data.frame(cbind(A, B, range_tw_plot))

ggplot(plot.data2, aes(range_tw_plot)) + 
  geom_line(aes(y = A, colour = "AR(1)")) + geom_line(aes(y = B, colour = "AR(2)")) + 
  scale_colour_manual(values=c("blue", "black")) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.2)) +
  labs(title = "Forecasting with Diebold-Li: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_DL_tw_4.pdf", width=6, height=6)

####
range_tw_plot = seq(350, 250, -10)

plot.data3 = data.frame(cbind(DL_BB_4_1_350_250, DL_US_4_1_350_250, range_tw_plot))

ggplot(plot.data3, aes(range_tw_plot)) + 
  geom_line(aes(y = DL_BB_4_1_350_250, colour = "BB", linetype = "BB")) + geom_line(aes(y = DL_US_4_1_350_250, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 1)) +
  labs(title = "Forecasting with Diebold-Li: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_DL_tw_4_mid.pdf", width=6, height=6)

##
range_tw_plot_lg = seq(400, 250, -30)

plot.data4 = data.frame(cbind(DL_BB_26_1_400_250, DL_US_26_1_400_250, range_tw_plot_lg))

ggplot(plot.data4, aes(range_tw_plot_lg)) + 
  geom_line(aes(y = DL_BB_26_1_400_250, colour = "BB", linetype = "BB")) + geom_line(aes(y = DL_US_26_1_400_250, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 1)) +
  labs(title = "Forecasting with Diebold-Li: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_DL_tw_26_mid.pdf", width=6, height=6)


#########################################
# FPCA model #
#########################################
# Boxplots: Standard Model # 
fpca_BB_4_f3_350_250 <- as.numeric(results_plots[1,2:12])
fpca_US_4_f3_350_250 <- as.numeric(results_plots[2,2:12])

fpca_BB_26_f3_350_250 <- as.numeric(results_plots[3,2:12])
fpca_US_26_f3_350_250 <- as.numeric(results_plots[4,2:12])

df_fpca_BB_4_f3_350_250 <- data.frame(Data = "BB", RMSE = fpca_BB_4_f3_350_250)
df_fpca_US_4_f3_350_250 <- data.frame(Data = "US", RMSE = fpca_US_4_f3_350_250)

df_fpca_BB_26_f3_350_250 <- data.frame(Data = "BB", RMSE = fpca_BB_26_f3_350_250)
df_fpca_US_26_f3_350_250 <- data.frame(Data = "US", RMSE = fpca_US_26_f3_350_250)

plot.data14 = rbind(df_fpca_BB_4_f3_350_250, df_fpca_US_4_f3_350_250)
plot.data15 = rbind(df_fpca_BB_26_f3_350_250, df_fpca_US_26_f3_350_250)


ggplot(plot.data14, aes(x=Data, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.25)) +
  labs(title = "Forecasting with FPCA: h=4 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_fpca_4_mid.pdf", width=6, height=6)

ggplot(plot.data15, aes(x=Data, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with FPCA: h=26 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_fpca_26_mid.pdf", width=6, height=6)

## Boxplots: Variation models #
fpca_BB_4_t3_350_250 <- as.numeric(results_plots[5,2:12])
fpca_US_4_t3_350_250 <- as.numeric(results_plots[6,2:12])

fpca_BB_26_t3_350_250 <- as.numeric(results_plots[7,2:12])
fpca_US_26_t3_350_250 <- as.numeric(results_plots[8,2:12])

df_fpca_BB_4_t3_350_250 <- data.frame(Study = "Weigths", RMSE = fpca_BB_4_t3_350_250)
df_fpca_US_4_t3_350_250 <- data.frame(Study = "Weigths", RMSE = fpca_US_4_t3_350_250)

df_fpca_BB_26_t3_350_250 <- data.frame(Study = "Weigths", RMSE = fpca_BB_26_t3_350_250)
df_fpca_US_26_t3_350_250 <- data.frame(Study = "Weigths", RMSE = fpca_US_26_t3_350_250)

df_fpca_BB_4_f3_350_250_w <- data.frame(Study = "Standard", RMSE = fpca_BB_4_f3_350_250)
df_fpca_US_4_f3_350_250_w <- data.frame(Study = "Standard", RMSE = fpca_US_4_f3_350_250)

df_fpca_BB_26_f3_350_250_w <- data.frame(Study = "Standard", RMSE = fpca_BB_26_f3_350_250)
df_fpca_US_26_f3_350_250_w <- data.frame(Study = "Standard", RMSE = fpca_US_26_f3_350_250)

plot.data16 = rbind(df_fpca_BB_4_f3_350_250_w, df_fpca_BB_4_t3_350_250)
plot.data17 = rbind(df_fpca_BB_26_f3_350_250_w, df_fpca_BB_26_t3_350_250)
plot.data18 = rbind(df_fpca_US_4_f3_350_250_w, df_fpca_US_4_t3_350_250)
plot.data19 = rbind(df_fpca_US_26_f3_350_250_w, df_fpca_US_26_t3_350_250)


ggplot(plot.data16, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.2)) +
  labs(title = "Forecasting with FPCA: h=4 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_fpca_4_bb_mid.pdf", width=6, height=6)

ggplot(plot.data17, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.4)) +
  labs(title = "Forecasting with FPCA: h=26 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_fpca_26_bb_mid.pdf", width=6, height=6)

ggplot(plot.data18, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0, 0.2)) +
  labs(title = "Forecasting with FPCA: h=4 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_fpca_4_us_mid.pdf", width=6, height=6)

ggplot(plot.data19, aes(x=Study, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.4)) +
  labs(title = "Forecasting with FPCA: h=26 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
ggsave("BB_fpca_26_us_mid.pdf", width=6, height=6)


# Plots for influence of number of trainings_weeks #

range_tw_plot = seq(350, 250, -10)
plot.data13 = data.frame(cbind(fpca_BB_4_f3_350_250, fpca_US_4_f3_350_250, range_tw_plot))

ggplot(plot.data13, aes(range_tw_plot)) + 
  geom_line(aes(y = fpca_BB_4_f3_350_250, colour = "BB", linetype = "BB")) + geom_line(aes(y = fpca_US_4_f3_350_250, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with FPCA: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_fpca_tw_4_mid.pdf", width=6, height=6)

##
range_tw_plot = seq(350, 250, -10)
plot.data12 = data.frame(cbind(fpca_BB_26_f3_350_250, fpca_US_26_f3_350_250, range_tw_plot))

ggplot(plot.data12, aes(range_tw_plot)) + 
  geom_line(aes(y = fpca_BB_26_f3_350_250, colour = "BB", linetype = "BB")) + geom_line(aes(y = fpca_US_26_f3_350_250, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with FPCA: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_fpcaL_tw_26_mid.pdf", width=6, height=6)


#########################################
# GP model #
#########################################
# Boxplots: Standard Model # 

gp_BB_4_350_250 <- as.numeric(results_plots[17,2:12])
gp_BB_26_350_250 <- as.numeric(results_plots[18,2:12])

gp_US_4_350_250 <- as.numeric(results_plots[19,2:12])
gp_US_26_350_250 <- as.numeric(results_plots[20,2:12])

df_gp_BB_4_350_250 <- data.frame(Data = "BB", RMSE = gp_BB_4_350_250)
df_gp_BB_26_350_250 <- data.frame(Data = "BB", RMSE = gp_BB_26_350_250)

df_gp_US_4_350_250 <- data.frame(Data = "US", RMSE = gp_US_4_350_250)
df_gp_US_26_350_250 <- data.frame(Data = "US", RMSE = gp_US_26_350_250)

plot.data20 = rbind(df_gp_BB_4_350_250, df_gp_US_4_350_250)
plot.data21 = rbind(df_gp_BB_26_350_250, df_gp_US_26_350_250)

s <- ggplot(plot.data20, aes(x=Data, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with GP: h=4 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
s + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("gp_4_mid.pdf", width=6, height=6)

a <- ggplot(plot.data21, aes(x=Data, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with GP: h=26 ahead", x = 'Data sets' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
a +theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("gp_26_mid.pdf", width=6, height=6)

# Plots for influence of number of trainings_weeks #
range_tw_plot = seq(350, 250, -30)
plot.data22 = data.frame(cbind(gp_BB_4_350_250, gp_US_4_350_250, range_tw_plot))[1:4,]

l <- ggplot(plot.data22, aes(range_tw_plot)) + 
  geom_line(aes(y = gp_BB_4_350_250, colour = "BB", linetype = "BB")) + geom_line(aes(y = gp_US_4_350_250, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with GP: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
l +theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("gp_tw_4_mid.pdf", width=6, height=6)

##
range_tw_plot = seq(350, 250, -30)
plot.data23 = data.frame(cbind(gp_BB_26_350_250, gp_US_26_350_250, range_tw_plot))[1:4,]

k <- ggplot(plot.data23, aes(range_tw_plot)) + 
  geom_line(aes(y = gp_BB_26_350_250, colour = "BB", linetype = "BB")) + geom_line(aes(y = gp_US_26_350_250, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with GP: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
k +  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("gp_tw_26_mid.pdf", width=6, height=6)

#########################################
# Comparison #
#########################################
# Boxplots: DL AR(p), FPCA ohne weights, GP # 

## BB 4
df_DL_BB_4_4_350_250_co <- data.frame(Model = "DL", RMSE = DL_BB_4_4_350_250)
df_fpca_BB_4_f3_350_250_co <- data.frame(Model = "FPCA", RMSE = fpca_BB_4_f3_350_250)
df_gp_BB_4_350_250_co <- data.frame(Model = "GP", RMSE = gp_BB_4_350_250)

plot.data24 = rbind(df_DL_BB_4_4_350_250_co, df_fpca_BB_4_f3_350_250_co, df_gp_BB_4_350_250_co)

s <- ggplot(plot.data24, aes(x=Model, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Comparison of models: h=4 ahead", x = 'Models' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
s + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("Comp_BB_4_mid.pdf", width=6, height=4)

# BB 26
df_DL_BB_26_4_350_250_co <- data.frame(Model = "DL", RMSE = DL_BB_26_4_350_250)
df_fpca_BB_26_f3_350_250 <- data.frame(Model = "FPCA", RMSE = fpca_BB_26_f3_350_250)
df_gp_BB_26_350_250 <- data.frame(Model = "GP", RMSE = gp_BB_26_350_250)

plot.data25 = rbind(df_DL_BB_26_4_350_250_co, df_fpca_BB_26_f3_350_250, df_gp_BB_26_350_250)

t <- ggplot(plot.data25, aes(x=Model, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Comparison of models: h=26 ahead", x = 'Models' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
t + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("Comp_BB_26_mid.pdf", width=6, height=4)

# US 4 #
df_DL_US_4_4_350_250_co <- data.frame(Model = "DL", RMSE = DL_US_4_4_350_250)
df_fpca_US_4_f3_350_250_co <- data.frame(Model = "FPCA", RMSE = fpca_US_4_f3_350_250)
df_gp_US_4_350_250_co <- data.frame(Model = "GP", RMSE = gp_US_4_350_250)

plot.data26 = rbind(df_DL_US_4_4_350_250_co, df_fpca_US_4_f3_350_250_co, df_gp_US_4_350_250_co)

u <- ggplot(plot.data26, aes(x=Model, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.8)) +
  labs(title = "Comparison of models: h=4 ahead", x = 'Models' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
u + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("Comp_US_4_mid.pdf", width=6, height=4)

# US 26 #
df_DL_US_26_4_350_250_co <- data.frame(Model = "DL", RMSE = DL_US_26_4_350_250)
df_fpca_US_26_f3_350_250_co <- data.frame(Model = "FPCA", RMSE = fpca_US_26_f3_350_250)
df_gp_US_26_350_250_co <- data.frame(Model = "GP", RMSE = gp_US_26_350_250)

plot.data27 = rbind(df_DL_US_26_4_350_250_co, df_fpca_US_26_f3_350_250_co, df_gp_US_26_350_250_co)

v <- ggplot(plot.data27, aes(x=Model, y=RMSE)) + geom_boxplot() + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.8)) +
  labs(title = "Comparison of models: h=26 ahead", x = 'Models' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())#+  geom_jitter(width = 0.2)
v + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("Comp_US_26_mid.pdf", width=6, height=4)

#########################################