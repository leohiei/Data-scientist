# Detecando outliers (anomalias)
#Indicação de pacote pyod para geração de gráficos outliers
import matplotlib.pyplot as plt
import pandas as pd
from pyod.models.knn import KNN

iris = pd.read_csv('iris.csv')

#Usando boxplot para detectação gráfica
plt.boxplot(iris.iloc[:, 1])
    #como checado no grafico existem 3 outliers superiores e uma inferior
    #caso não queira ver os outliers adicionar showfliers=False
plt.boxplot(iris.iloc[:, 1], showfliers=False)
# Extraindo esses valores
    #Buscando os valores que estão acima de 4 e abaixo de 2.25
        # | pipe/barrinha significa or em python
out = iris[(iris['sepal width'] > 4.0) | (iris['sepal width'] < 2.1)]

#Transformando dados para realizar outro método de outliers
sepal_width = iris.iloc[:, 1]
sepal_width = sepal_width.values.reshape(-1, 1)
outlier = KNN()
outlier.fit(sepal_width)
# chegcado no terminal alguns parametros KNN que podem ser usados
previsao = outlier.labels_
    #retornou uma tabela com 0 e 1, onde 1 são outliers
    