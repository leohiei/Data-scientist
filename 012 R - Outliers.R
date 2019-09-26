# Checando Outliers (anomalias) na pacote iris

#Visualizando gráfico
boxplot(iris$Sepal.Width)
  #como checado no grafico existem 3 outliers superiores e uma inferior
#boxplot mostra outliers por padrão, caso não queira ver os outliers adicionar outline=F
  #boxplot(iris$Sepal.Width, outline=F)

# Checando outliers de forma numérica para ver quais variáveis são essas
  #digitando boxplot.stats(iris$Sepal.Width) irá mostrar todos os parametro usados para gerar o gráfico
#quero só outliers
boxplot.stats(iris$Sepal.Width)$out

#Instalar pacote outliers caso seja a primeira vez
install.packages('outliers')
#ativando biblioteca
library(outliers)

#Checando a função outlier
outlier(iris$Sepal.Width)
  #como checado aqui ele considerga apenas um valor superior como outlier
  #por padrão essa função encontrar outliers superiores, caso queira inferiores usar opposite=T
outlier(iris$Sepal.Width, opposite=T)