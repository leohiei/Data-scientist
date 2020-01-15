# séries temporais

AirPassengers
#Apresenta o início da série
start(AirPassengers)
# Apresenta o fim da série
end(AirPassengers)
# start / end útil para colocar dentro de outras funções

plot(AirPassengers)
#visualizando dadoa agregados/ano
plot(aggregate(AirPassengers))
# há uma suavização da evolução pois está ocultando o valor total do ano

#visualizando gráfico agregado por mês
monthplot(AirPassengers)
# é visto que há um pico nos meses de Junho, Julho e Agosto, verão na américa do norte

# análisando um período da série usando a função window, essa função extrai o subconjunto da série
  #var = função(dados, inicio=vetor(), final=vetor())
subst = window(AirPassengers, start=c(1960,1), end=c(1960,12))
subst
plot(subst)

