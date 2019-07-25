# Chamando biblioteca de dados e vendo dimensão
dim(cars)

#Qual velocidade o carro estava a partir da distância que çlevou para frear?
  #var independente ou de resposta = speed, e a var explanatória = dist

#visualizando os primeiros dados
  #OBS: speed em milhas e dist em pés
head(cars)

# checando a correlação entre as variáveis
cor(cars)
  # correlação perfeita entre speed e dist

# criando variavel e chamando função lm (linear model)
modelo = lm(speed ~ dist, data=cars)
# chamando o modelo criado
modelo
#chamando gráfico
plot(modelo)
#criando gráfico
plot(speed ~ dist, data=cars)
# criando linha de melhor ajuste
abline(modelo)

# Prevendo manualmente a speed do carro
  # exemplo: dist = 22 pés

#Checando coeficiente
modelo$coefficients

#fórmula do cálculo
modelo$coefficients[1] + modelo$coefficients[2] * 22

#Obtendo o resultado com a função predict
predict(modelo, data.frame(dist=22))



