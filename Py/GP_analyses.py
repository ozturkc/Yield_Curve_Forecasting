# -*- coding: utf-8 -*-
"""
@author: Cemal Öztürk
"""
import pandas as pd
from BB_Data_GP_predh import h_pred_BB
from GP_function_rolling import roll_pred, roll_pred_US, roll_pred_TR

# BB data: h-step ahead forecasts #
forc_df = h_pred_BB(start = 3, trainings_weeks = 350, h = 26) # start >= 1, trainings_weeks >= 2.
print(forc_df)

#rmse_curve_df = pd.read_csv("BB_GPpred_rmse_curve.csv")
#print(rmse_curve_df)



# Forecasting with different data sets #
roll_pred(start = 1, trainings_weeks = 320, h= 26, data = df_BB, mat_vec = mat_BB) 



#######################################################
# Cross validation: Varying window forecasting study #

from sklearn.model_selection import ParameterGrid

param_grid = {'start': [1,50,100,150,200], 'trainings_weeks' : [250,240,230,220,210,200,190,180,170,160,150]}

grid = ParameterGrid(param_grid)

params_list = list(grid)
print(params_list)
results = []

for params in grid:
    result = roll_pred(params['start'], 
                       params['trainings_weeks'], 
                       h = 26, 
                       data = df_BB, 
                       mat_vec = mat_BB)
    print('RMSE : %f' %result)
    results.append((params,result))
    
results.sort(key=lambda k: k[1])
rmse_results = pd.DataFrame(results)
print(rmse_results)

# Export of results #
to_setwd = "C:/Users/cemal/OneDrive - Pamukkale University/Masaüstü/MA-SelinaReinecke/Py_MA_Reinicke"
os.chdir(to_setwd)

fp = "GP_cv_rmse_BB_26_front.csv"
rmse_results.to_csv(fp, index = True, header = False)    





#######################################################
#US

# US data: h-step ahead forecasts #
forc_df = h_pred_US(start = 3, trainings_weeks = 350, h = 4) # start >= 1, trainings_weeks >= 2.
print(forc_df)


roll_pred_US(start = 1, trainings_weeks = 320, h = 26, data = df_US, mat_vec = mat_US) 

# Cross validation: Varying window forecasting study #

from sklearn.model_selection import ParameterGrid

param_grid = {'start': [1,50,100], 
              'trainings_weeks' : [250,240,230,220,210,200,190,180,170,160,150]}

grid = ParameterGrid(param_grid)

params_list = list(grid)
print(params_list)
results = []

for params in grid:
    result = roll_pred_US(params['start'], 
                          params['trainings_weeks'], 
                          h = 26, 
                          data = df_US, 
                          mat_vec = mat_US)
    print('RMSE : %f'  %result)
    results.append((params, result))
    
results.sort(key=lambda k: k[1])
rmse_results = pd.DataFrame(results)
print(rmse_results)

# Export of results #
to_setwd = "C:/Users/cemal/OneDrive - Pamukkale University/Masaüstü/MA-SelinaReinecke/Py_MA_Reinicke"
os.chdir(to_setwd)

fp = "GP_cv_rmse_US_26_front.csv"
rmse_results.to_csv(fp, index = True, header = False)   



##############################################################################
#TR

forc_df = h_pred_TR(start = 3, trainings_weeks = 360, h = 26) # start >= 1, trainings_weeks >= 2.
print(forc_df)


roll_pred_TR(start = 1, trainings_weeks = 320, h= 26, data = df_TR, mat_vec = mat_TR) 


# Cross validation: Varying window forecasting study #

from sklearn.model_selection import ParameterGrid

param_grid = {'start': [1,50,100], 
              'trainings_weeks' : [250,240,230,220,210,200,190,180,170,160,150]}

grid = ParameterGrid(param_grid)

params_list = list(grid)
print(params_list)
results = []

for params in grid:
    result = roll_pred_TR(params['start'], 
                          params['trainings_weeks'], 
                          h = 26, 
                          data = df_TR, 
                          mat_vec = mat_TR)
    print('RMSE : %f' %result)
    results.append((params,result))
    
results.sort(key=lambda k: k[1])
rmse_results = pd.DataFrame(results)
print(rmse_results)

# Export of results #
to_setwd = "C:/Users/cemal/OneDrive - Pamukkale University/Masaüstü/MA-SelinaReinecke/Py_MA_Reinicke"
os.chdir(to_setwd)

fp = "GP_cv_rmse_TR_26_front.csv"
rmse_results.to_csv(fp, index = True, header = False)   




