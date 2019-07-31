# Checando nome das colunas
colnames(mtcars)
  #dimensão
dim(mtcars)

# Criando modelo de regressao linear simples
  # usaremos as variáveis mpg(consumo de galoes por milha) e disp(polegadas cubicas)
# buscando correlação
  #tudo das primeiras 4 variaveis
cor(mtcars[1:4])
# de acordo temos um caso de regressao negativa forte entre mpg e disp
  # o que quer dizer que quando uma cresce a outra decresce mas existe uma relacao entre elas

# vamos usar mpg como var de resposta e disp como explanatoria
  # modelo = funcao(y ~ x, dados)
modelo = lm(mpg ~ disp, data=mtcars)
# checando coeficiente de deterrminacao, ou R²
  # R² é sempre postivo
summary(modelo)$r.squared
# vimos que quando temos mais de uma var independente/explanatoria o R tende
  #aumentar de forma artificial e nao necessariamente esta explicando melhor o modelo
  #e para isso usamo o coeficiente de determinacao ajustado
summary(modelo)$adj.r.squared

# gerando grafico
plot(mpg ~ disp, data=mtcars)
abline(modelo)
# vemos que a linha de melhor ajuste sobe para a esquerda, o que prova a correlacao negativa 
#apos confirmado, podemos usar o modelo para fazer previsoes

# a partir de uma determinada polegada cubica, vamos prever o consumo do veiculo
predict(modelo, data.frame(disp=200))

#vamos adicionar duas vars, hp(cavalos) e cyl(num de cilindros) como vars explanatorias
  # para criar modelo de regressao linear multipla
    # mesmo metodo, formula diferente
modelo = lm(mpg ~ disp + hp + cyl, data=mtcars)
# checando coeficiente de variacao
summary(modelo)$r.squared
  #valor subiu em relacao ao anterior
#checando ajustado
summary(modelo)$adj.r.squared
  #ajustado eh o mais importante pois erle se adequa ao num de vars explanatorias
#aqui podemos fazer a previsao da mesma forma, a diferenca eh que eh preciso atribuir
  #valores a todas as vars explanatorias que usamos no modelo
predict(modelo, data.frame(disp=200, hp=100, cyl=4))
