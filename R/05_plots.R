#############################################
# Descriptive plots #
# 3D Plots

Periods <- c(1:496)

#install.packages("plotly")
library(plotly)
Maturities <- mat.BB 
Yields <- (coredata(BB_weekly))
plot_ly(z = ~Yields, x = ~Maturities, y = ~Periods) %>% add_surface()

Maturities <- mat_US
Yields <- (coredata(US_weekly))
plot_ly(z = ~Yields, x = ~Maturities, y = ~Periods) %>% add_surface()


# BB data #
first(BB_fts$y)
plot(BB_fts, ylab = "Yield curves", colorchoice = "diverge_hcl", 
    plotlegend = TRUE, legend = "topleft", ylim = c(-1,5), main = "From 04/2009 to 09/2018")
fboxplot(BB_fts, plot.type = "functional", type = "hdr", alpha = c(0.07,0.5),
         projmethod="PCAproj", plotlegend = FALSE)

# Descriptive #
avg <- centre(BB_fts$y, type = "mean")
plot(x=mat.BB, y=avg, type = "p")
plot(x=mat.BB, y=avg, type = "o", ylim = c(-1,5), 
     xlab = "Maturities", ylab = "Average yield curve", main = "Average Yield Curve from 04/2009 to 09/2018")

# Split means #
split_bb <- extract(BB_indx_fts, direction = "time", timeorder = 400:496)
index(BB_weekly[400])
plot(x=mat.BB, y=centre(split_bb$y, type = "mean"), type = "o", ylim = c(-1,5), 
     xlab = "Maturities", ylab = "Average yield curve", main = "Average Yield Curve - after 11/2016")

# Functions #
plot(centre(BB_fts$y, type = "var"))                 #SR: Across x.
plot(centre(BB_fts$y, type = "median"))              #SR: Across time.
# Mean and median at each variable #
plot(mean.fts(BB_fts), ylim=c(-0.2,2.5))                 #SR: Across x.
plot(median.fts(BB_fts), ylim=c(-0.2,2.5))               #SR: Across x.

par(mfrow=c(1,2))
plot(BB_fts, ylab = "Yield curves", colorchoice = "diverge_hcl", 
     plotlegend = TRUE, legend = "topleft", ylim = c(-1,6), main = "From 04/2009 to 09/2018")
plot(x=mat.BB, y=avg, type = "o", ylim = c(-1,6), 
     xlab = "Maturities", ylab = "Average yield curve", main = "Average Yield Curve from 04/2009 to 09/2018")

# US data #
first(US_fts$y)
plot(US_fts, ylab = "Yield curves", colorchoice = "diverge_hcl", 
     plotlegend = TRUE, legend = "topleft", ylim = c(0,5), main = "From 04/2009 to 09/2018")
index(US_weekly[440])
plot(extract(US_indx_fts, direction = "time", timeorder = 1:440), ylab = "Yield curves", colorchoice = "diverge_hcl", 
     plotlegend = TRUE, legend = "topleft", ylim = c(0,5), main = "From 04/2009 to 09/2017")
fboxplot(US_fts, plot.type = "functional", type = "hdr", alpha = c(0.07,0.5),
         projmethod="PCAproj", plotlegend = FALSE)


# Descriptive #
avgus <- centre(US_fts$y, type = "mean")
plot(x=mat_US, y=avgus, type = "p")
plot(x=mat_US, y=avgus, type = "o", ylim = c(-1,5), 
     xlab = "Maturities", ylab = "Average yield curve", main = "Average Yield Curve from 04/2009 to 09/2018")

# Split means #
split_us <- extract(US_indx_fts, direction = "time", timeorder = 400:496)
index(US_weekly[400])
plot(x=mat_US, y=centre(split_us$y, type = "mean"), type = "o", ylim = c(-1,5), 
     xlab = "Maturities", ylab = "Average yield curve", main = "Average Yield Curve - after 11/2016")
par(mfrow=c(1,2))
plot(x=mat.BB, y=centre(split_bb$y, type = "mean"), type = "o", ylim = c(-1,5), 
     xlab = "Maturities", ylab = "Average yield curve", main = "BB average Yield Curve - after 11/2016")
plot(x=mat_US, y=centre(split_us$y, type = "mean"), type = "o", ylim = c(-1,5), 
     xlab = "Maturities", ylab = "Average yield curve", main = "US average Yield Curve - after 11/2016")

# Functions #
plot(centre(US_fts$y, type = "var"))                 #SR: Across x.
plot(centre(US_fts$y, type = "median"))              #SR: Across time.
# Mean and median at each variable #
plot(mean.fts(US_fts), ylim=c(-0.2,2.5))                 #SR: Across x.
plot(median.fts(US_fts), ylim=c(-0.2,2.5))               #SR: Across x.

par(mfrow=c(1,2))
plot(US_fts, ylab = "Yield curves", colorchoice = "diverge_hcl", 
     plotlegend = TRUE, legend = "topleft", ylim = c(0,6), main = "From 04/2009 to 09/2018")
plot(x=mat_US, y=avgus, type = "o", ylim = c(0,6), 
     xlab = "Maturities", ylab = "Average yield curve", main = "Average Yield Curve from 04/2009 to 09/2018")


#############################################
# DL: ACFs #
parameters_plot <- Nelson.Siegel(BB_weekly, mat.BB)
beta0_plot <- parameters_plot$beta_0
beta1_plot <- parameters_plot$beta_1
beta2_plot <- parameters_plot$beta_1

parameters_plot <- coredata(parameters_plot)
beta0_plot <- parameters_plot[,1]
beta1_plot <- parameters_plot[,2]
beta2_plot <- parameters_plot[,3]

conf.level <- 0.95
ciline <- qnorm((1 - conf.level)/2)/sqrt(length(beta0_plot))

acf_beta0 <- acf(beta0_plot, lag.max = 260, plot = FALSE)
df_acf_beta0 <- with(acf_beta0, data.frame(lag, acf))

p <- ggplot(data = df_acf_beta0, mapping = aes(x = lag, y = acf)) +
  geom_hline(aes(yintercept = 0)) +
  geom_segment(mapping = aes(xend = lag, yend = 0)) +
  geom_hline(aes(yintercept = ciline), linetype = 2, color = 'darkblue') + 
  geom_hline(aes(yintercept = -ciline), linetype = 2, color = 'darkblue') +
  coord_cartesian(xlim = c(0, 260), ylim = c(-0.4,1)) +
  labs(title = bquote("Autocorrelation of " ~ hat(beta)[t1]), x = 'Lag' , y = 'Autocorrelation') +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
p + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("BB_acf1.pdf", width=4, height=4)

acf_beta0 <- acf(beta0_plot, lag.max = 52, main=bquote("Autocorrelation of " ~ hat(beta)[t1]))
acf_beta1 <- acf(beta1_plot, lag.max = 52)
acf_beta2 <- acf(beta2_plot, lag.max = 52)

acf_beta1 <- acf(beta1_plot, lag.max = 260, plot = FALSE)
df_acf_beta1 <- with(acf_beta1, data.frame(lag, acf))

q <- ggplot(data = df_acf_beta1, mapping = aes(x = lag, y = acf)) +
  geom_hline(aes(yintercept = 0)) +
  geom_segment(mapping = aes(xend = lag, yend = 0)) +
  geom_hline(aes(yintercept = ciline), linetype = 2, color = 'darkblue') + 
  geom_hline(aes(yintercept = -ciline), linetype = 2, color = 'darkblue') +
  coord_cartesian(xlim = c(0, 260), ylim = c(-0.4,1)) +
  labs(title = bquote("Autocorrelation of " ~ hat(beta)[t2]), x = 'Lag' , y = 'Autocorrelation') +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
q + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("BB_acf2.pdf", width=4, height=4)

##
acf_beta2 <- acf(beta2_plot, lag.max = 260, plot = FALSE)
df_acf_beta2 <- with(acf_beta2, data.frame(lag, acf))

r <- ggplot(data = df_acf_beta2, mapping = aes(x = lag, y = acf)) +
  geom_hline(aes(yintercept = 0)) +
  geom_segment(mapping = aes(xend = lag, yend = 0)) +
  geom_hline(aes(yintercept = ciline), linetype = 2, color = 'darkblue') + 
  geom_hline(aes(yintercept = -ciline), linetype = 2, color = 'darkblue') +
  coord_cartesian(xlim = c(0, 260), ylim = c(-0.4,1)) +
  labs(title = bquote("Autocorrelation of " ~ hat(beta)[t3]), x = 'Lag' , y = 'Autocorrelation') +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
r + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("BB_acf3.pdf", width=4, height=4)



##
parameters_plot_US <- Nelson.Siegel(US_weekly, mat_US)
parameters_plot_US <- coredata(parameters_plot_US)
beta0_plot_us <- parameters_plot_US[,1]
beta1_plot_us <- parameters_plot_US[,2]
beta2_plot_us <- parameters_plot_US[,3]

conf.level <- 0.95
ciline_us <-  qnorm((1 - conf.level)/2)/sqrt(length(beta0_plot_us))

acf_beta0_us <- acf(beta0_plot_us, lag.max = 260, plot = FALSE)
df_acf_beta0_us <- with(acf_beta0_us, data.frame(lag, acf))

p <- ggplot(data = df_acf_beta0_us, mapping = aes(x = lag, y = acf)) +
  geom_hline(aes(yintercept = 0)) +
  geom_segment(mapping = aes(xend = lag, yend = 0)) +
  geom_hline(aes(yintercept = ciline_us), linetype = 2, color = 'darkblue') + 
  geom_hline(aes(yintercept = -ciline_us), linetype = 2, color = 'darkblue') +
  coord_cartesian(xlim = c(0, 260), ylim = c(-0.4,1)) +
  labs(title = bquote("Autocorrelation of " ~ hat(beta)[t1]), x = 'Lag' , y = 'Autocorrelation') +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
p + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
 ggsave("US_acf1.pdf", width=4, height=4)
acf(beta0_plot_us, lag.max = 260)

acf_beta1_us <- acf(beta1_plot_us, lag.max = 260, plot = FALSE)
df_acf_beta1_us <- with(acf_beta1_us, data.frame(lag, acf)) 

q <- ggplot(data = df_acf_beta1_us, mapping = aes(x = lag, y = acf)) +
   geom_hline(aes(yintercept = 0)) +
   geom_segment(mapping = aes(xend = lag, yend = 0)) +
   geom_hline(aes(yintercept = ciline_us), linetype = 2, color = 'darkblue') + 
   geom_hline(aes(yintercept = -ciline_us), linetype = 2, color = 'darkblue') +
   coord_cartesian(xlim = c(0, 260), ylim = c(-0.4,1)) +
   labs(title = bquote("Autocorrelation of " ~ hat(beta)[t2]), x = 'Lag' , y = 'Autocorrelation') +
   theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
q + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
 ggsave("US_acf2.pdf", width=4, height=4)
 acf(beta1_plot_us, lag.max = 260)
 
 acf_beta2_us <- acf(beta2_plot_us, lag.max = 260, plot = FALSE)
 df_acf_beta2_us <- with(acf_beta2_us, data.frame(lag, acf)) 
 
r <- ggplot(data = df_acf_beta2_us, mapping = aes(x = lag, y = acf)) +
   geom_hline(aes(yintercept = 0)) +
   geom_segment(mapping = aes(xend = lag, yend = 0)) +
   geom_hline(aes(yintercept = ciline_us), linetype = 2, color = 'darkblue') + 
   geom_hline(aes(yintercept = -ciline_us), linetype = 2, color = 'darkblue') +
   coord_cartesian(xlim = c(0, 260), ylim = c(-0.4,1)) +
   labs(title = bquote("Autocorrelation of " ~ hat(beta)[t3]), x = 'Lag' , y = 'Autocorrelation') +
   theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
r + theme(plot.title = element_text(size = '14', face = 'bold', hjust = 0.5))
ggsave("US_acf3.pdf", width=4, height=4)
 acf(beta2_plot_us, lag.max = 260,  ci.type = "ma")

#############################################
# FPCA: FPCs #
model_ftsm <- ftsm(y=BB_indx_fts, order = 3, mean = TRUE)   
# Plot incl. coefficients #
plot.fm(model_ftsm, ylab1 = "Principal component",
        xlab2 = "Periods", ylab2 = "Score", mean.lab = "Mean",
        level.lab = "Level", main.title = "Main effects", interaction.title
        = "Principal components", basiscol = "blue" , coeffcol = 1)   # 8x6.

model_ftsm_us <- ftsm(y=US_indx_fts, order = 3, mean = TRUE)   
plot.fm(model_ftsm_us,  ylab1 = "Principal component",
        xlab2 = "Periods", ylab2 = "Score", mean.lab = "Mean",
        level.lab = "Level", main.title = "Main effects", interaction.title
        = "Principal components", basiscol = "blue" , coeffcol = 1)   # 8x6.



plot(residuals(object = model_ftsm), type = "image", xlab = "Time", ylab = "Maturities")
plot(residuals(object = model_ftsm), type = "filled.contour", xlab = "Time", ylab = "Maturities")
plot(residuals(object = model_ftsm), type = "fts", xlab = "Time", ylab = "Maturities", plotlegend=TRUE)
plot(residuals(object = model_ftsm), type = "persp", xlab = "Time", ylab = "Maturities")

#############################################
# Individual forecasts yield curves #

end <- 300
horizon <- 26
st <- 1


# FPCA #
order_k <- 3

fts_subset <- extract(BB_indx_fts, direction = "time", timeorder = 1:end) # Subset data

fpca_model <- ftsm(y = fts_subset, order = order_k, mean = TRUE, weight = FALSE)   # Generate FPCA model

ftsm_predict <- forecast.ftsm(fpca_model, h = horizon, method = "arima")   # Generate forecasts based on the different models

predict_error <- error(forecast = ftsm_predict$mean$y, 
                       true = BB_indx_fts$y[, (end+1):(end+horizon)], method = "rmse")    # Measuring prediction errors of interest rates in a curve combined.

result <- c((end+1), (end+horizon), predict_error, fpca_model$varprop[1], fpca_model$varprop[2])

plot(y=BB_indx_fts$y[, (end+horizon)], x=mat.BB, type = "l")
lines(y=ftsm_predict$mean$y[,4], x=mat.BB, col="blue")  


# DL #
order_p <- 1
xtssubset <- BB_weekly[1:end]                    # Subset data

est_parameters <- Nelson.Siegel(xtssubset, mat.BB)          # DL_model estimates parameters, takes most time.


# AR model and forecast parameters
arfit0 <- auto.arima(est_parameters$beta_0, max.p = order_p, max.q = 0, max.order = order_p, max.d = 0, max.D = 0,
                     ic = c("aic"), seasonal = FALSE, stepwise = TRUE)
arfit1 <- auto.arima(est_parameters$beta_1, max.p = order_p, max.q = 0, max.order = order_p, max.d = 0, max.D = 0,
                     ic = c("aic"), seasonal = FALSE, stepwise = TRUE)
arfit2 <- auto.arima(est_parameters$beta_2, max.p = order_p, max.q = 0, max.order = order_p, max.d = 0, max.D = 0,
                     ic = c("aic"), seasonal = FALSE, stepwise = TRUE)

for0 <- forecast(arfit0, h = horizon)
for1 <- forecast(arfit1, h = horizon)
for2 <- forecast(arfit2, h = horizon)

# Calculate nelsonsiegel_rates with forecasted parameters
NSparameter <- est_parameters[1:horizon]
NSparameter$beta_0 <- round(as.vector(for0$mean), 6)
NSparameter$beta_1 <- round(as.vector(for1$mean), 6)
NSparameter$beta_2 <- round(as.vector(for2$mean), 6)
NSparameter$lambda <- mean(est_parameters$lambda)
# parameters_for <- # Use apply function to replace columns of nelsonsiegel_parameters

for_rates <- NSrates(NSparameter, mat.BB)
error_rates <- t(for_rates)

# Calculate errors
predict_error <- error(forecast = error_rates,
                       true = t(as.matrix(coredata(BB_weekly)[(end+1):(end+horizon),])), method = "rmse")       

result <- c((end+1), (end+horizon), predict_error)

plot(y=t(as.matrix(coredata(BB_weekly)[(end+horizon),])), x=mat.BB, type = "l")
lines(y=error_rates[,4], x=mat.BB, col="blue")  

plot(error_rates[,1], x=mat.BB, type = "l")
lines(y=error_rates[,2], x=mat.BB, col="blue") 
lines(y=error_rates[,3], x=mat.BB, col="blue") 
lines(y=error_rates[,4], x=mat.BB, col="blue") 


#############################################
# Factor loadings of Diebod-Li model #
lambda_mean <- 0.3360244
# 0.3360244 is mean of estimated parameters for BB data
DL1 <- 1
DL3 <- function(x) { ( (1-exp(-lambda_mean*x)) / (lambda_mean*x)) - exp(-lambda_mean*x)}
DL2 <- function(x) { ( (1-exp(-lambda_mean*x)) / (lambda_mean*x))}

load <- ggplot(data.frame(x=c(-0.0000001, 30)), aes(x=x)) + stat_function(fun=DL3, geom="point", aes(colour = "beta3")) + stat_function(fun=DL2, geom="line", aes(colour = "beta2"))+ 
  xlab("Maturity in Years") + ylab("Loading") + scale_x_continuous(expand = c(0, 0)) + theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5))
load + geom_hline(aes(yintercept=1, colour = "beta1"), show.legend =FALSE) + scale_colour_manual("Loadings", values = c("black", "red", "blue")) + 
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ggsave("loadings.pdf", width=8, height=6)

#############################################
data(FedYieldCurve)
maturity.Fed <- c(3/12, 0.5, 1,2,3,5,7,10)
NSParameters <- Nelson.Siegel( rate=first(FedYieldCurve,'10 month'),maturity=maturity.Fed) 
y <- NSrates(NSParameters[5,], maturity.Fed) 
plot(maturity.Fed,FedYieldCurve[5,],main="Fitting Nelson-Siegel yield curve",xlab=c("Pillars in months"), type="o")
lines(maturity.Fed,y, col=2)
legend("topleft",legend=c("observed yield curve","fitted yield curve"),col=c(1,2),lty=1)
grid()

rate.ECB = first(ECBYieldCurve,'2 day')
maturity.ECB = c(0.25,0.5,seq(1,30,by=1))
SvenssonParameters <- Svensson(rate.ECB, maturity.ECB)
Svensson.rate <- Srates( SvenssonParameters ,maturity.ECB,"Spot")

plot(maturity.ECB, last(rate.ECB,'1 day'),main="Fitting Svensson yield curve",
     xlab=c("Pillars in years"), ylab=c("Rates"),type="o")
lines(maturity.ECB, last(Svensson.rate,'1 day'), col=2)
legend("topleft",legend=c("observed yield curve","fitted yield curve"),
       col=c(1,2),lty=1)
grid()