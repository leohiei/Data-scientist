plot(AirPassengers)
  #Encontrado uma tendência crescente de acordo com o gráfico, aparenta ser linear
    #alguns picos de provável sazonalidade

#Decompor em elementos de sazonalidade, tendência e aleatório(aquele que não pode ser explicado via função)

#função decompose
dec = decompose(AirPassengers)
dec

#Observando cada um dos elementos
dec$seasonal
dec$trend
dec$random
plot(dec$seasonal)
  #plotando a sazonalidade não vemos a tendência, sendo o sazonal separado dos demais
  #é visto que há uma linearidade, mesmo contendo picos, são eles constantes
    #o plot de cada um vai apresentar o gráfico determinado

plot(dec$trend)
  #visto no gráfico a tendência de crescimento, com uma redução em determinadas épocas mas 
    #mantendo uma linearidade de crescimento

plot(dec)
  #Podemos ver e analisar ytodos os elementos dentrode um gráfico