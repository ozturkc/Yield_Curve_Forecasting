# Diebod Li lambda #
lambda_try <- 0.05976667
DLx <- function(x) { ( (1-exp(-lambda_try*x)) / (lambda_try*x)) - exp(-lambda_try*x)}
plot(DLx(0:120), type="o")
abline(v=30)

DLX <- function(x) { ( (1-exp(-x)) / (x)) - exp(-x)}
optimize(f = DLX, interval = c(0, 120), maximum = TRUE )

1.79329/30                                   # Resulting lambda when maximizing at 30 months.
1.79329/29.44                               # Molenaars et al.


#########################################
# Plots for influence of number of trainings_weeks #
#########################################

results_plots_app <- read.table("results_plots_appendix.csv", sep=";", header = FALSE)
#########################################
# DL  #
range_tw_app = seq(250,150,-30)

dlbb4 <- as.numeric(results_plots_app[5,2:5])
dlus4 <- as.numeric(results_plots_app[6,2:5])

dlbb26 <- as.numeric(results_plots_app[7,2:5])
dlus26 <- as.numeric(results_plots_app[8,2:5])


plot.data_1 = data.frame(cbind(dlbb4, dlus4, range_tw_app))

ggplot(plot.data_1, aes(range_tw_app)) + 
  geom_line(aes(y = dlbb4, colour = "BB", linetype = "BB")) + geom_line(aes(y = dlus4, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 1)) +
  labs(title = "Forecasting with Diebold-Li: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_DL_tw_4_front.pdf", width=6, height=6)

plot.data_2 = data.frame(cbind(dlbb26, dlus26, range_tw_app))

ggplot(plot.data_2, aes(range_tw_app)) + 
  geom_line(aes(y = dlbb26, colour = "BB", linetype = "BB")) + geom_line(aes(y = dlus26, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 1)) +
  labs(title = "Forecasting with Diebold-Li: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_DL_tw_26_front.pdf", width=6, height=6)

#########################################
# FPCA  #
fpcabb4 <- as.numeric(results_plots_app[1,2:5])
fpcaus4 <- as.numeric(results_plots_app[2,2:5])

fpcabb26 <- as.numeric(results_plots_app[3,2:5])
fpcaus26 <- as.numeric(results_plots_app[4,2:5])

plot.data_3 = data.frame(cbind(fpcabb4, fpcaus4, range_tw_app))

ggplot(plot.data_3, aes(range_tw_app)) + 
  geom_line(aes(y = fpcabb4, colour = "BB", linetype = "BB")) + geom_line(aes(y = fpcaus4, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with FPCA: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_fpca_tw_4_front.pdf", width=6, height=6)

plot.data_4 = data.frame(cbind(fpcabb26, fpcaus26, range_tw_app))

ggplot(plot.data_4, aes(range_tw_app)) + 
  geom_line(aes(y = fpcabb26, colour = "BB", linetype = "BB")) + geom_line(aes(y = fpcaus26, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with FPCA: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("BB_fpca_tw_26_front.pdf", width=6, height=6)

#########################################
# FPCA  #
gpbb4 <- as.numeric(results_plots_app[9,2:6])
gpus4 <- as.numeric(results_plots_app[10,2:6])

gpbb26 <- as.numeric(results_plots_app[11,2:6])
gpus26 <- as.numeric(results_plots_app[12,2:6])

plot.data_5gp = data.frame(cbind(gpbb4, gpus4, range_tw_app))[1:4,]

ggplot(plot.data_5gp, aes(range_tw_app)) + 
  geom_line(aes(y = gpbb4, colour = "BB", linetype = "BB")) + geom_line(aes(y = gpus4, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with GP: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("gp_tw_4_front.pdf", width=6, height=6)

plot.data_6gp = data.frame(cbind(gpbb26, gpus26, range_tw_app))[1:4,]

ggplot(plot.data_6gp, aes(range_tw_app)) + 
  geom_line(aes(y = gpbb26, colour = "BB", linetype = "BB")) + geom_line(aes(y = gpus26, colour = "US", linetype = "US")) + 
  scale_colour_manual("Legend", values=c("BB" = "blue", "US" = "black")) +
  scale_linetype_manual("Legend", values=c("BB"=1, "US"=6)) +
  theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5)) +
  coord_cartesian(ylim = c(0, 0.5)) +
  labs(title = "Forecasting with GP: influence of window size", x = 'Number of training data' , y = 'RMSE') +
  theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5)) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("gp_tw_26_front.pdf", width=6, height=6)