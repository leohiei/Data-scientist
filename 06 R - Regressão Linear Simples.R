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

-----------------------------------------
> dim(cars)
[1] 50  2
> head(cars)
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10
> cor(cars)
          speed      dist
speed 1.0000000 0.8068949
dist  0.8068949 1.0000000
> modelo = lm(speed ~ dist, data=cars)
> modelo

Call:
lm(formula = speed ~ dist, data = cars)

Coefficients:
(Intercept)         dist  
     8.2839       0.1656  

> plot(modelo)
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
> plot(speed ~ dist, data=cars)
> abline(modelo)
> modelo$coefficients
(Intercept)        dist 
  8.2839056   0.1655676 
> modelo$coefficients[1] + modelo$coefficients[2] * 22
(Intercept) 
   11.92639 
> predict(modelo, data.frame(dist=22))
       1 
11.92639 
> 
