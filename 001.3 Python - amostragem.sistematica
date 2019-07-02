import numpy as np
import pandas as pd
#importando fgunção para arredondamento
from math import ceil

# nossa quantidade maxíma de população é 150 mas só queremos selecionar 15
populacao = 150
amostra = 15
# comando ceil arredonda para cima; ex: caso valor de amostra fosse 14,
# iria arredondar resultado para 11
div = ceil(populacao / amostra)

#definindo aelatoriedade entre 1 e resultado de div
#div + 1 é necessário pois se somente div o elemento superior (no caso, 10)
#não entraria
ale = np.random.randint(low = 1, high = div + 1, size = 1)

# variável recebe o valor gerado em ale, por isso 0
acumulador = ale[0]
# criando lista vazia que armazena valores sorteados
sorteados = []
# aqui ele executa o código de acordo com a quantidade de amostras que desejo;
for i in range(amostra):
    #print(acumulador)
# retorna uma lista com os valores da amostra
    sorteados.append(acumulador)
# realizar uma soma com base no div
    #acumulador recebe ela mesma mais o valor de div
    acumulador += div

#chamar nossa base de dados iris
iris = pd.read_csv('iris.csv')
# gerar uma base de dados com a quantidade de registros desejada
# comando loc serve para fazer a localização de um número
iris_base = iris.loc[sorteados]
