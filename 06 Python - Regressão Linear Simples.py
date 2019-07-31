import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from yellowbrick.regressor import ResidualsPlot

dados = pd.read_csv('cars.csv')
# apagando primeira coluna, ou atributo, desnecessário
    #parametro axis apaga por coluna
dados = dados.drop(['Unnamed: 0'], axis = 1)

# checando correlação entre as variáveis
    #variável independente
speed = dados.iloc[:, 1].values
    #necessário um reshape dos dados para realizar a regressão linear
speed = speed.reshape(-1, 1)
    # variável dependente
dist = dados.iloc[:, 0].values 
    #calculo de coeficiente de correlação
correlacao = np.corrcoef(speed, dist)

#Checada a correlção e visto que é forte, é possível aplicar
    # a regressão linear
modelo = LinearRegression()
modelo.fit(speed, dist)

# Visualizando algumas infos
    #interceptação
modelo.intercept_
    # inclinação
modelo.coef_
#gerando gráfico
plt.scatter(speed, dist)
plt.plot(speed, modelo.predict(speed), color = 'red')

#testando previsão
    #hipótese: dist = 22 pés; resultado = prever a velocidade
    #modelo manual
modelo.intercept_ + modelo.coef_ * 22
    # modelo auto
modelo.predict(22)

# visualizando residuais
    #residuais é a distância dos pontos (dados) para a linha de regressão
modelo._residues

visualizador = ResidualsPlot(modelo)
visualizador.fit(speed, dist)
    #emitir e visualizar o gráfico
visualizador.poof()
