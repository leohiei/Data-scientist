import pandas as pd
import matplotlib.pylab as plt
#Utilizando Arima, técnica mais avançada para previsão
from statsmodels.tsa.arima_model import ARIMA
# Utilizando auto arima do pacote pyramid
    #necessário instalação para primeiro uso
        #pip install pmdarima
from pmdarima import auto_arima

base = pd.read_csv('AirPassengers.csv')
dateparse = lambda dates: pd.datetime.strptime(dates, '%Y-%m')
base = pd.read_csv('AirPassengers.csv', parse_dates = ['Month'], 
                   index_col = 'Month', date_parser = dateparse)
ts = base['#Passengers']

plt.plot(ts)

# auto_arima seleciona o melhor parâmetro para o conjunto
modelo_auto = auto_arima(ts, m = 12, seasonal = True, trace = True)
modelo_auto.summary()
 # após o summary é visto que o melhor parâmetro do order acima 
        # é mesmo 3, 1 ,3

# Arima tem 3 parâmetros (p = número dos termos auto regressivos,
    # q = número da média móvel, d = número de diferenças não sazonais)
modelo_arima = ARIMA(ts, order=(3, 1, 3))
    #parâmetros de order é nessário teste para saber qual o mais adequado para
        # o conjunto de dados
modelo_treinado = modelo_arima.fit()
modelo_treinado.summary()

previsao = modelo_treinado.forecast(steps = 12)[0]
    #Steps quee dizer quantas previsões a frente quero fazer
    # [0] necessário caso queira ver somente as pŕevisões

# Criando gráfico

eixo = ts.plot()
modelo_treinado.plot_predict('1960-01-01', '1962, 01, 01', ax = eixo,
                             plot_insample = True)
# Temos o gráfico do ano 1960 com sazonalidade, em laranja e verde a previsão 
    #do último mês existente, por fim as previsões com um intervalo de 
        #confiança de 95%

#Realizando previsão com auto_arima
proximos_12 = modelo_auto.predict(n_periods = 12)
