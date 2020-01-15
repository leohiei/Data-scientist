#séries temporais

import pandas as pd
import numpy as np
import matplotlib.pylab as plt
#Para ts[datetime]
from datetime import datetime

base = pd.read_csv('AirPassengers.csv')
print(base.dtypes)
    #visto o tipo das variáveis é necessário transformar object em datas
dateparse = lambda dates: pd.datetime.strptime(dates, '%Y-%m')
    #(dates, 'num. Ano - Num. meses)

base = pd.read_csv('AirPassengers.csv', parse_dates = ['Month'], 
                   index_col = 'Month', date_parser = dateparse)

# transformando de DataFrame em series
ts = base['#Passengers']
# tipos de indexação
ts[1]
ts['1949-02-01']
ts[datetime(1949,2,1)]
#indexando várias datas
ts[1:10]
#pegando tudo anterior a data
ts[:10]
ts[:'1950-07-31']
#indexação por ano
ts['1950']

ts.index.max()
ts.index.min()

plt.plot(ts)

ts_ano = ts.resample('A').sum()
     #Valores agrupados ṕor ano
         #resample(A = ano).somatório
plt.plot(ts_ano)

ts_mes = ts.groupby([lambda x: x.month]).sum()
plt.plot(ts_mes)

ts_datas = ts['1960-01-01':'1960-12-01']
plt.plot(ts_datas)