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
