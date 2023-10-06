# -*- coding: utf-8 -*-
"""
@author: Cemal Ozturk
"""

import os
import pandas as pd

to_setwd = "C:/Users/cemal/OneDrive - Pamukkale University/Masaüstü/MA-SelinaReinecke/Py_MA_Reinicke"

def read_data_BB():
    os.chdir(to_setwd)
    fp = 'BB_weekly.csv'
    df_BB = pd.read_csv(fp)
    df_BB["Index"] = pd.to_datetime(df_BB["Index"])
    return df_BB

def read_mat_BB():
    os.chdir(to_setwd)
    mat_BB = pd.read_csv("mat.BB.csv")
    return mat_BB



def read_data_US():
    os.chdir(to_setwd)
    fp = 'US_weekly.csv'
    df_US = pd.read_csv(fp)
    df_US["Index"] = pd.to_datetime(df_US["Index"])
    return df_US

def read_mat_US():
    os.chdir(to_setwd)
    mat_US = pd.read_csv("mat.US.csv")
    return mat_US



def read_data_TR():
    os.chdir(to_setwd)
    fp = 'TR_weekly.csv'
    df_TR = pd.read_csv(fp)
    df_TR["Index"] = pd.to_datetime(df_TR["Index"])
    return df_TR

def read_mat_TR():
    os.chdir(to_setwd)
    mat_TR = pd.read_csv("mat.TR.csv")
    return mat_TR



# Input data #
df_BB = read_data_BB()
mat_BB = read_mat_BB()

df_US = read_data_US()
mat_US = read_mat_US()

df_TR = read_data_TR()
mat_TR = read_mat_TR()
