import numpy as np
from scipy import stats

#criando var de dados
jogador_salario = [40000, 12000, 18000, 250000, 30000, 140000, 
                    300000, 40000, 800000]
#Exibindo um resumo de cálculos dos dados
stats.describe(jogador_salario)
# calcular a média
np.mean(jogador_salario)
#calculando a mediana
np.median(jogador_salario)
# visualizando quartis, criando [em colchetes quais quartis eu quero],
# var e apresentando resultado
quartis = np.quantile(jogador_salario, [0, 0.25, 0.5, 0.75, 1])
# desvio padrão
#std significa standard deviation
# parametro ddof para obter mesmo resultado do R
np.std(jogador_salario, ddof = 1)