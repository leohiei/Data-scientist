import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
# essa biblioteca adiciona recursos de R
import statsmodels.formula.api as sm

dados = pd.read_csv('mt_cars.csv')
# removendo primeiro atributo (coluna) desnecessario
dados = dados.drop(['Unnamed: 0'], axis = 1)
#checando correlacao entre consumo(mpg) e polegadas(disp)

# criando vars
    #primeiro var independente(x) var = dados.iloc[todos registros, coluna].values
disp = dados.iloc[:, 2].values
    #var de resposta(y), mesmo metodo selecionando a coluna a ser relacionada
mpg = dados.iloc[:, 0].values
#Criando coeficiente de correelacao
corr = np.corrcoef(disp, mpg)
    # visto na var que eh uma correlacao negativa forte, 
        #ou seja um aumenta outro diminui

#Criando modelo de regressao linear
    #primeiro um reshape na var x; 
        #(nao vou mexer nas linhas, adicionado mais uma coluna)
disp = disp.reshape(-1, 1)
    #isso gerou formato de matriz que eh o necessario para a LinearRegression
modelo = LinearRegression()
modelo.fit(disp, mpg)
#visualizando parametros
    #interceptacao
modelo.intercept_
    #coeficiente de inclinacao
modelo.coef_

# Visualizando R² que indica o quanto a var dependente explica a indenpendente
modelo.score(disp, mpg)
#usando R² ajustavel por ser mais confiante, principalmente mais necessario
    #quando se tem mais variaveis
    # para isso eh necessario importar uma biblio que faz python funcionar como R
#cria a variavel onde preve todos os itens
previsoes = modelo.predict(disp)
    #ols = ordinary list square
modelo_ajustado = sm.ols(formula = 'mpg ~ disp', data = dados)
modelo_treinado =modelo_ajustado.fit()
#checando valores detalhados
modelo_treinado.summary()

#visualizando grafico
plt.scatter(disp, mpg)
plt.plot(disp, previsoes, color = 'red')

# realizando uma previsao
    #ex: veiculo com 200 polegadas  cubicas
modelo.predict([[200]])
    #4 colchetes caso apresente erro somente com ()

#criando regressao linear multipla
    #criando a var e coletando todos os dados das 3 colunas
mult = dados.iloc[:, 1:4].values
mpg2 = dados.iloc[:, 0].values
modelo2 = LinearRegression()
modelo2.fit(mult, mpg2)
#checando R²
modelo2.score(mult, mpg2)
#checando R² ajustado
modelo_ajustado2 = sm.ols(formula = 'mpg ~ cyl + disp + hp', data = dados)
modelo_treinado2 = modelo_ajustado2.fit()
modelo_treinado2.summary()

#Realizando uma novaprevisao com todos os registros chamados
    # criando var = np.array([cyl, disp, hp]); array para formar linearregression
novo = np.array([4, 200, 100])
#necessario um reshape
    #(adiciona uma linha, nao adiciona coluna); ficando do mesmo formato
        #que a var mult onde cada coluna eh um atributo
novo = novo.reshape(1, -1)
modelo2.predict(novo)