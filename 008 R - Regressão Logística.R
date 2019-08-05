#Buscando primeiro conjunto de dados eleicao
  #cria var = chama leitor(escolher arquivo, tipo de separado de dados, cabecalho)
    #importando dados eleicao
eleicao = read.csv(file.choose(), sep=";", header = T)
#visualizando
fix(eleicao)
#gerando grafico de comparacao entre eleicao e despesas, com a situacao (eleito ou nao)
plot(eleicao$DESPESAS, eleicao$SITUACAO)
summary(eleicao)
#checando se existe correlacao entre dispesas e situacao
cor(eleicao$DESPESAS, eleicao$SITUACAO)
  #checado uma correlacao forte

#criando modelo; funcao glm (general linear model); cria varios tipos de regressao linear
  #parametro binomial para regressao logistica
modelo = glm(SITUACAO ~ DESPESAS, data = eleicao, family = "binomial")
summary(modelo)

#gerando plot comparando despesas com situacao, pintando de vermelho e alterando formato do ponto
plot(eleicao$DESPESAS, eleicao$SITUACAO, col="red", pch=20)
#gerando plot de despesas com os valores do modelo ajustados
points(eleicao$DESPESAS, modelo$fitted, pch = 4)

#Usando este metodo para avaliar novos candidatos
  #importando dados NovosCandidatos
prevereleicao = read.csv(file.choose(), sep=";", header = T)
fix(prevereleicao)
#prevendo a probabilidade de serem eleitos a partir do investimento de cada um
#criando uma nova coluna dentro dos dados
prevereleicao$RESULT = predict(modelo, newdata = prevereleicao, type = "response")
#lendo resultado
prevereleicao$RESULT
  #apresenta por ordem de despesas (de 1 a 7) aquele com mais probabilidade
#visualizando dados
fix(prevereleicao)
------------------
> eleicao = read.csv(file.choose(), sep=";", header = T)
> 
> fix(eleicao)
> plot(eleicao$DESPESAS, eleicao$SITUACAO)
> summary(eleicao)
             CANDIDATO     SITUACAO         DESPESAS   
  Gary Peterson   : 1   Min.   :0.0000   Min.   :  10  
  Pamela Bryant   : 1   1st Qu.:0.0000   1st Qu.: 300  
 Andrea Washington: 1   Median :1.0000   Median : 800  
 Annie Brooks     : 1   Mean   :0.5106   Mean   :1086  
 Anthony Harris   : 1   3rd Qu.:1.0000   3rd Qu.:1700  
 Barbara White    : 1   Max.   :1.0000   Max.   :3300  
 (Other)          :41                                  
> cor(eleicao$DESPESAS, eleicao$SITUACAO)
[1] 0.8121872
> modelo = glm(SITUACAO ~ DESPESAS, data = eleicao, family = "binomial")
> plot(eleicao$DESPESAS, eleicao$SITUACAO, col="red", pch=20)
> points(eleicao$DESPESAS, modelo$fitted, pch = 4)
> prevereleicao = read.csv(file.choose(), sep=";", header = T)
> fix(prevereleicao)
> prevereleicao$RESULT = predict(modelo, newdata = prevereleicao, type = "response")
> prevereleicao$RESULT
[1] 0.009923466 0.010425261 0.026438255 0.108027149 0.470635921 0.946475247 0.999967947
> 
> fix(prevereleicao)
> plot(prevereleicao$DESPESAS, prevereleicao$RESULT)
> plot(prevereleicao$DESPESAS, prevereleicao$RESULT, col="red", pch = 20)
