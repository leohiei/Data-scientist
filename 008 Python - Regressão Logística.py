import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LogisticRegression

# necessario passar o parametro do separador, apos checar isto no arquivo
    #caso o separador seja virgula nao eh necessario passar parametro
eleicao = pd.read_csv('Eleicao.csv', sep =';')
# gerando grafico entre despesas e situacao
plt.scatter(eleicao.DESPESAS, eleicao.SITUACAO)
    # de acordo com grafico, acima eleitos, abaixo nao-eleitos
# visualizando alguns dados
#visualizando coeficiente de correlacao
np.corrcoef(eleicao.DESPESAS, eleicao.SITUACAO)
    #correlacao positiva e forte; quanto mais gasta, mais chance de ser eleito
#criando modelo de regressao
despesas_eleicao = eleicao.iloc[:, 2].values
    #var x, independente
#reshape; adiciona uma coluna; formato de matriz
despesas_eleicao = despesas_eleicao[:, np.newaxis]
situacao_eleicao = eleicao.iloc[:, 1].values
    #var y, dependente
grafico = LogisticRegression()
grafico.fit(despesas_eleicao, situacao_eleicao)
    #treinando modelo
#visualizando dados
    #inclinacao
grafico.coef_
    #interceptacao
grafico.intercept_
#visualizando grafico
plt.scatter(despesas_eleicao, situacao_eleicao)
#criando var = gerando nums aleatorios(quero gerar nums a partir de 10,
    # ate o max 3000(valores do menor ao maior em despesas),
    # quero gerar 100 resultados)
despesas_test = np.linspace(10, 3000, 100)
    #usaremos esses nums para criar uma previsao com o modelo
#criando funcao para poder gerar o grafico
def model(x):
    return 1 / (1 + np.exp(-x))
        #isso eh uma funcao que recebe um num e retorna a sigmoide
res = model(despesas_test * grafico.coef_ + grafico.intercept_).ravel()
    #ravel transforma o numpy array que esta em matriz para vetor
plt.plot(despesas_test, res, color = 'red')

# realizando previsoes
eleicao_previsoes = pd.read_csv('NovosCandidatos.csv', sep=';')
#selecionando colunas
despesas_prev = eleicao_previsoes.iloc[:, 1].values
despesas_prev = despesas_prev.reshape(-1, 1)
# realizando previsoes
prev_test = grafico.predict(despesas_prev)
    #checando na variavel que os 0 nao seriam eleitos e 1 seriam
# visualizando de outra forma no console; a var pode apreesentar erro de array
        #caso executada diretamente do arquivo, devido a mistura de dados
eleicao_previsoes = np.column_stack((eleicao_previsoes, despesas_prev))