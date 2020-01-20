# Em séries temporais não há muito sentido em buscar prever um dado observado 
    #entre variáveis já coletadas
# Normalmente se faz previsão para períodos futuros; diga-se extrapolar o 
    #cnjunto de dados coletados na observação
# Previsão em série temporal é extrapolação, ou seja, ir além dos dados 
    #observados

import pandas as pd
import matplotlib.pylab as plt

base = pd.read_csv('AirPassengers.csv')
dateparse = lambda dates: pd.datetime.strptime(dates, '%Y-%m')
base = pd.read_csv('AirPassengers.csv', parse_dates = ['Month'], 
                   index_col = 'Month', date_parser = dateparse)
ts = base['#Passengers']

plt.plot(ts)

#Forma simples de previsão
ts.mean()
 #cálculo da média
  # A probabilidade de haver uma grande margem de erro nessa previsão é grande
  #Principalmente por não ser uma série temporal estacionária; não flutua em 
  #torno de uma mesmamédia e uma mesma variância. Ela tem tendência

#Em vez da média da séria toda, vou utilizar a do último ano, 
#o que vai minimizar a margem de erro
ts['1960-01-01':'1960-12-01'].mean()
      # O resultado da média é um valor mais parecido com aquilo que é 
        # visto no ano de 1960, o que confere maior precisão

#Sofisticando os dados usando médias móveis, que consiste em cada intervalo, 
    #ou ponto, ela vai considerar N elementos antes, que posso usar como 
    #parâmetros, então a média vai se ajustando de acordo com o passar do tempo
mediamovel = ts.rolling(window = 12).mean()
    #rolling vai realizar o cálculo e aplicação da média
    #nan = nulo
    #nan nos 11 meses de 1949 pois ainda não haviam dados
    #resultado gerado de acordo com o último mês
    #Resultados diferentes de acordo com a quantidade de meses pedidos
        #ex:mediamovel = ts.rolling(window = 2).mean()
plt.plot(ts, color='blue')
plt.plot(mediamovel, color='red')
    #Visto no gráfico a previsão dos últimos 12 linear

#Realizando previsão com a média móvel
previsao = []
for i in range(1, 13):
    #print(1)
    superior = len(mediamovel) - i
    inferior = superior - 11
    #print(inferior)
    #print(superior)
    #print('---')
    #o resultado mostra quais índices serão usados para realizar a previsão
    previsao.append(mediamovel[inferior:superior].mean())
        #previsões para os próximos 12 meses
previsao = previsao[::-1]
    #Organizando: [não mexo nas linhas, instrução para inversão]
plt.plot(previsao)
