# -*- coding: utf-8 -*-
"""
@author: Cemal Öztürk
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from math import sqrt
import GPy
from GPy.kern import *                        
import time
import os
import logging
import csv

# from datetime import date
from GPy.core import Mapping


# create logger for the application
logger = logging.getLogger('DGPM Logger')

ch = logging.StreamHandler()

# create formatter and add it to the handlers
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
ch.setFormatter(formatter)


logger.addHandler(ch)
logger.setLevel(logging.DEBUG)


def roll_pred(start, trainings_weeks, h, data, mat_vec):
    global error_df, forc_df, perf_df, X, act_mat, rmse_curve_df

    df = data
    mat_vec = mat_vec
    
    X = np.array(mat_vec)               
    X = np.reshape(X, [X.shape[0], 1])                           
    req_cols = filter(lambda v : v not in ["Index"], df.columns)   
    N = df.shape[0]
    forc_rows = h
    
    
    error_mat = np.ones((forc_rows, (X.shape[0])), dtype = np.float64) 
    forc_mat = np.ones((forc_rows, (X.shape[0])), dtype = np.float64)
    rmse_curve_mat = np.ones((forc_rows,1), dtype = np.float64)
    date_list = list()
    
    logger.info("Dataset has " + str(N) + " rows")
    row_index = int(start)-1                                    
    mf = Mapping(1,1)
    end = int(start)-1 + trainings_weeks
    
    while row_index < (end):
        dfr = df.loc[row_index,:]
        Y = dfr[1:33]                
        #Y = np.reshape(Y, [Y.shape[0],1])                         # Inputs yield data.
        Y = Y.to_frame()
        #log progress - update progress every 100 weeks
        if row_index % 100 == 0:
            logger.debug("Week %d processed..." %row_index)

        if row_index == int(start)-1:
            k = GPy.kern.RBF(input_dim = 1)                            
            #print(k)                                                 
            m = GPy.models.GPRegression(X, Y, kernel = k)
        

        else:
            ## Updating
            act = df.iloc[(row_index), 1:33]
            
            ###########act = np.reshape(act, [act.shape[0],1])
            act = act.values.reshape(-1, 1)
            act = act.reshape(-1, 1)

            residual = act - post_pred                                                 
            # updated estimate
            X_star = X
            t1 = m.kern.K(X_star,X)
            t2 = np.linalg.inv(m.kern.K(X,X) +\
                               m['Gaussian_noise.variance']*\
                               np.eye(X.shape[0]))             
            t3 = t1.dot(t2)                                    
            t4 = t3.dot(residual)
            um = post_pred + t4                               
            um = um.astype('float64')


            def the_mf(X):
                    return um
            mf.f = the_mf                                    
            mf.update_gradients = lambda a,b: None
            k = GPy.kern.RBF(input_dim = 1)
            lik = GPy.likelihoods.Gaussian()
            m = GPy.core.GP(X, Y, kernel = k,\
                            likelihood=lik, mean_function = mf)      
 
        m.constrain_positive('*.*')
        m.optimize()
        
        post_pred = m.predict(X)[0]                        
        #print(post_pred)
        row_index = row_index + 1
    
    # Now Prediction
    dfr = df.iloc[end,:]
    Y = dfr[1:(X.shape[0]+1)]                
    #################Y = np.reshape(Y, [Y.shape[0],1])
    Y = Y.values.reshape(-1, 1)
    Y = Y.reshape(-1, 1)  

             
    m = GPy.core.GP(X, Y, kernel = k,\
                    likelihood=lik, mean_function = mf)
    m.constrain_positive('*.*')
    m.optimize()
    post_pred = m.predict(X)[0] 
    
    estimates = post_pred.ravel()                      
    print(np.shape(estimates))
    forc_mat[(0), :] = estimates[0:(X.shape[0])]
    act = df.iloc[row_index + (0), 1:(X.shape[0]+1)]               
    error_mat[(0), :] = (act - estimates)*(act - estimates)
    
    
    for i in range(1,h):
        m = GPy.core.GP(X, post_pred, kernel = k,\
                        likelihood=lik, mean_function = mf)
        m.constrain_positive('*.*')
        m.optimize()
        post_pred = m.predict(X)[0] 
        
        estimates = post_pred.ravel()                      
        forc_mat[(i), :] = estimates[0:(X.shape[0])]
        act = df.iloc[row_index + (i), 1:(X.shape[0]+1)]               
        error_mat[(i), :] = (act - estimates)*(act - estimates)


    error_df = pd.DataFrame(error_mat)
    error_df.columns = req_cols

    forc_df = pd.DataFrame(forc_mat)
    
 
    # compute the rmse for each curve #
    for c in range(error_df.shape[0]):
        se = error_df.iloc[c, :] 
        rmse_curve_mat[c, 0] = sqrt(np.sum(se)/(X.shape[0]))
    
    rmse_mean =  np.mean(rmse_curve_mat)
    rmse_curve_mat = np.append(rmse_curve_mat, 0) 
    rmse_curve_mat = np.append(rmse_curve_mat, rmse_mean) 

    rmse_curve_df = pd.DataFrame(rmse_curve_mat)  
    
    logger.info("Done!")   
    return rmse_mean








def roll_pred_US(start, trainings_weeks, h, data, mat_vec):
    global error_df, forc_df, perf_df, X, act_mat, rmse_curve_df

    df = data
    mat_vec = mat_vec
    
    X = np.array(mat_vec)               
    X = np.reshape(X, [X.shape[0], 1])                           
    req_cols = filter(lambda v : v not in ["Index"], df.columns)   
    N = df.shape[0]
    forc_rows = h
    
    
    error_mat = np.ones((forc_rows, (X.shape[0])), dtype = np.float64) 
    forc_mat = np.ones((forc_rows, (X.shape[0])), dtype = np.float64)
    rmse_curve_mat = np.ones((forc_rows,1), dtype = np.float64)
    date_list = list()
    
    logger.info("Dataset has " + str(N) + " rows")
    row_index = int(start)-1                                    
    mf = Mapping(1,1)
    end = int(start)-1 + trainings_weeks
    
    while row_index < (end):
        dfr = df.loc[row_index,:]
        Y = dfr[1:12]                
        #Y = np.reshape(Y, [Y.shape[0],1])                         # Inputs yield data.
        Y = Y.to_frame()
        #log progress - update progress every 100 weeks
        if row_index % 100 == 0:
            logger.debug("Week %d processed..." %row_index)

        if row_index == int(start)-1:
            k = GPy.kern.RBF(input_dim = 1)                            
            #print(k)                                                 
            m = GPy.models.GPRegression(X, Y, kernel = k)
        

        else:
            ## Updating
            act = df.iloc[row_index, 1:(X.shape[0]+1)]
            
            ###########act = np.reshape(act, [act.shape[0],1])
            act = act.values.reshape(-1, 1)
            act = act.reshape(-1, 1)

            residual = act - post_pred                                                 
            # updated estimate
            X_star = X
            t1 = m.kern.K(X_star,X)
            t2 = np.linalg.inv(m.kern.K(X,X) +\
                               m['Gaussian_noise.variance']*\
                               np.eye(X.shape[0]))             
            t3 = t1.dot(t2)                                    
            t4 = t3.dot(residual)
            um = post_pred + t4                               
            um = um.astype('float64')


            def the_mf(X):
                    return um
            mf.f = the_mf                                    
            mf.update_gradients = lambda a,b: None
            k = GPy.kern.RBF(input_dim = 1)
            lik = GPy.likelihoods.Gaussian()
            m = GPy.core.GP(X, Y, kernel = k,\
                            likelihood=lik, mean_function = mf)      
 
        m.constrain_positive('*.*')
        m.optimize()
        
        post_pred = m.predict(X)[0]                        
        #print(post_pred)
        row_index = row_index + 1
    
    # Now Prediction
    dfr = df.iloc[end,:]
    Y = dfr[1:(X.shape[0]+1)]                
    #################Y = np.reshape(Y, [Y.shape[0],1])
    Y = Y.values.reshape(-1, 1)
    Y = Y.reshape(-1, 1)  

             
    m = GPy.core.GP(X, Y, kernel = k,\
                    likelihood=lik, mean_function = mf)
    m.constrain_positive('*.*')
    m.optimize()
    post_pred = m.predict(X)[0] 
    
    estimates = post_pred.ravel()                      
    print(np.shape(estimates))
    forc_mat[(0), :] = estimates[0:(X.shape[0])]
    act = df.iloc[row_index + (0), 1:(X.shape[0]+1)]               
    error_mat[(0), :] = (act - estimates)*(act - estimates)
    
    
    for i in range(1,h):
        m = GPy.core.GP(X, post_pred, kernel = k,\
                        likelihood=lik, mean_function = mf)
        m.constrain_positive('*.*')
        m.optimize()
        post_pred = m.predict(X)[0] 
        
        estimates = post_pred.ravel()                      
        forc_mat[(i), :] = estimates[0:(X.shape[0])]
        act = df.iloc[row_index + (i), 1:(X.shape[0]+1)]               
        error_mat[(i), :] = (act - estimates)*(act - estimates)


    error_df = pd.DataFrame(error_mat)
    error_df.columns = req_cols

    forc_df = pd.DataFrame(forc_mat)
    
 
    # compute the rmse for each curve #
    for c in range(error_df.shape[0]):
        se = error_df.iloc[c, :] 
        rmse_curve_mat[c, 0] = sqrt(np.sum(se)/(X.shape[0]))
    
    rmse_mean =  np.mean(rmse_curve_mat)
    rmse_curve_mat = np.append(rmse_curve_mat, 0) 
    rmse_curve_mat = np.append(rmse_curve_mat, rmse_mean) 

    rmse_curve_df = pd.DataFrame(rmse_curve_mat)  
    
    logger.info("Done!")   
    return rmse_mean





def roll_pred_TR(start, trainings_weeks, h, data, mat_vec):
    global error_df, forc_df, perf_df, X, act_mat, rmse_curve_df

    df = data
    mat_vec = mat_vec
    
    X = np.array(mat_vec)               
    X = np.reshape(X, [X.shape[0], 1])                           
    req_cols = filter(lambda v : v not in ["Index"], df.columns)   
    N = df.shape[0]
    forc_rows = h
    
    
    error_mat = np.ones((forc_rows, (X.shape[0])), dtype = np.float64) 
    forc_mat = np.ones((forc_rows, (X.shape[0])), dtype = np.float64)
    rmse_curve_mat = np.ones((forc_rows,1), dtype = np.float64)
    date_list = list()
    
    logger.info("Dataset has " + str(N) + " rows")
    row_index = int(start)-1                                    
    mf = Mapping(1,1)
    end = int(start)-1 + trainings_weeks
    
    while row_index < (end):
        dfr = df.loc[row_index,:]
        Y = dfr[1:(X.shape[0]+1)]                
        #Y = np.reshape(Y, [Y.shape[0],1])                         # Inputs yield data.
        Y = Y.to_frame()
        #log progress - update progress every 100 weeks
        if row_index % 100 == 0:
            logger.debug("Week %d processed..." %row_index)

        if row_index == int(start)-1:
            k = GPy.kern.RBF(input_dim = 1)                            
            #print(k)                                                 
            m = GPy.models.GPRegression(X, Y, kernel = k)
        

        else:
            ## Updating
            act = df.iloc[(row_index), 1:(X.shape[0]+1)]
            
            ###########act = np.reshape(act, [act.shape[0],1])
            act = act.values.reshape(-1, 1)
            act = act.reshape(-1, 1)

            residual = act - post_pred                                                 
            # updated estimate
            X_star = X
            t1 = m.kern.K(X_star,X)
            t2 = np.linalg.inv(m.kern.K(X,X) +\
                               m['Gaussian_noise.variance']*\
                               np.eye(X.shape[0]))             
            t3 = t1.dot(t2)                                    
            t4 = t3.dot(residual)
            um = post_pred + t4                               
            um = um.astype('float64')


            def the_mf(X):
                    return um
            mf.f = the_mf                                    
            mf.update_gradients = lambda a,b: None
            k = GPy.kern.RBF(input_dim = 1)
            lik = GPy.likelihoods.Gaussian()
            m = GPy.core.GP(X, Y, kernel = k,\
                            likelihood=lik, mean_function = mf)      
 
        m.constrain_positive('*.*')
        m.optimize()
        
        post_pred = m.predict(X)[0]                        
        #print(post_pred)
        row_index = row_index + 1
    
    # Now Prediction
    dfr = df.iloc[end,:]
    Y = dfr[1:(X.shape[0]+1)]                
    #################Y = np.reshape(Y, [Y.shape[0],1])
    Y = Y.values.reshape(-1, 1)
    Y = Y.reshape(-1, 1)  

             
    m = GPy.core.GP(X, Y, kernel = k,\
                    likelihood=lik, mean_function = mf)
    m.constrain_positive('*.*')
    m.optimize()
    post_pred = m.predict(X)[0] 
    
    estimates = post_pred.ravel()                      
    print(np.shape(estimates))
    forc_mat[(0), :] = estimates[0:(X.shape[0])]
    act = df.iloc[row_index + (0), 1:(X.shape[0]+1)]               
    error_mat[(0), :] = (act - estimates)*(act - estimates)
    
    
    for i in range(1,h):
        m = GPy.core.GP(X, post_pred, kernel = k,\
                        likelihood=lik, mean_function = mf)
        m.constrain_positive('*.*')
        m.optimize()
        post_pred = m.predict(X)[0] 
        
        estimates = post_pred.ravel()                      
        forc_mat[(i), :] = estimates[0:(X.shape[0])]
        act = df.iloc[row_index + (i), 1:(X.shape[0]+1)]               
        error_mat[(i), :] = (act - estimates)*(act - estimates)


    error_df = pd.DataFrame(error_mat)
    error_df.columns = req_cols

    forc_df = pd.DataFrame(forc_mat)
    
 
    # compute the rmse for each curve #
    for c in range(error_df.shape[0]):
        se = error_df.iloc[c, :] 
        rmse_curve_mat[c, 0] = sqrt(np.sum(se)/(X.shape[0]))
    
    rmse_mean =  np.mean(rmse_curve_mat)
    rmse_curve_mat = np.append(rmse_curve_mat, 0) 
    rmse_curve_mat = np.append(rmse_curve_mat, rmse_mean) 

    rmse_curve_df = pd.DataFrame(rmse_curve_mat)  
    
    logger.info("Done!")   
    return rmse_mean