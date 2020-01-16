import pandas as pd
import numpy as np
import matplotlib.pylab as plt
from datetime import datetime
from statsmodels.tsa.seasonal import seasonal_decompose

base = pd.read_csv('AirPassengers.csv')
dateparse = lambda dates: pd.datetime.strptime(dates, '%Y-%m')
base = pd.read_csv('AirPassengers.csv', parse_dates = ['Month'], 
                   index_col = 'Month', date_parser = dateparse)

#Realizando decomposição
ts = base['#Passengers']
plt.plot(ts)

decomp = seasonal_decompose(ts)
tendencia  = decomp.trend
sazonal = decomp.seasonal
aleatorio = decomp.resid

plt.plot(tendencia)
plt.plot(sazonal)
plt.plot(aleatorio)

#plotando sem a necessidade de vriáveis
    #plt.plot(decomp.resid)
    #plt.plot(decomp.trend)
    #plt.plot(decomp.seasonal)

# Exibindo todos os gráficos
    #(quantidade de gráficos, tamanho, índice)
plt.subplot(4,1,1)
plt.plot(ts, label = 'Original')
plt.legend(loc = 'best')

plt.subplot(4,1,2)
plt.plot(tendencia, label = 'Tendência')
plt.legend(loc = 'best')

plt.subplot(4,1,3)
plt.plot(sazonal, label = 'Sazonalidade')
plt.legend(loc = 'best')

plt.subplot(4,1,4)
plt.plot(aleatorio, label = 'Aleatório')
plt.legend(loc = 'best')
plt.tight_layout()
    #Para não sobrepor os outros elementos