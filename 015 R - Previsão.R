# Em séries temporais não há muito sentido em buscar prever um dado observado entre variáveis já coletadas
# Normalmente se faz previsão para períodos futuros; diga-se extrapolar o cnjunto de dados coletados na observação
# Previsão em série temporal é extrapolação, ou seja, ir além dos dados observados
AirPassengers
# Formas simples de extrapolação
mean(AirPassengers)
  #cálculo da média
  # A probabilidade de haver uma grande margem de erro nessa previsão é grande
  #Principalmente por não ser uma série temporal estacionária; não flutua em torno de uma mesma 
    #média e uma mesma variância

#Em vez da média da séria toda, vou utilizar a do último ano, o que vai minimizar a margem de erro
mean(window(AirPassengers, start=c(1960,1), end=c(1960,12)))
  # O resultado da média é um valor mais parecido com aquilo que é visto no ano de 1960, o que confere maior precisão

#Sofisticando os dados usando médias móveis, que consiste em cada intervalo, ou ponto, ela vai considerar N elementos 
  #antes, que posso usar como parâmetros, então a média vai se ajustando de acordo com o passar do tempo
  #Para isso é necessário o pacote forecast, necessário uma só vez
#install.packages("forecast")
  # em caso de erro: sudo apt-get install r-base-dev
#carregando pacote
library(forecast)

#Criando e calculando a média móvel
mediamovel = ma(AirPassengers,order = 12)
  #variavel = comando(dados, quantidade de meses usados considerados em cada medida de tempo)
mediamovel
  #NA nos 5 primeiros meses de 1949 pois ainda não haviam dados, 
  #a Média Móvel passa a ser calculada a partir de Julho de 1949 de acordo com a ordem usada
    #quantidade de meses usadas para calcular a media

#Usando forecast para realizar a previsão
  #ferramente genérica para vários tipos de previsão
previsao = forecast(mediamovel, h=12)
  #h=12 é quantos meses quero fazer a previsão
previsao
  #visto nível de confiança e previsão
plot(previsao)
  #a média móvel deixa o efeito da linearidade mais suavizado, é visto a variância na década de 1960 com a previsão
    #as cores são de acordo com a precisão da previsão, mais distante, maior margem de erro

#sofisticando ainda mais com arima. usando a versão auto.arima que realiza o ajuste da previsão 
  #da melhor forma possível, de acordo com as características da série temporal
arima = auto.arima(AirPassengers)
  #objeto criado
arima
#realizando previsão
previsao = forecast(arima, h=12)
previsao
#previsão semelhanto ao da mediamovel, mas importante a checagem do plot
plot(previsao)
  #manteve-se o efeito sazonal e a previsão também o considerou, cores mantendo o mesmo significado
