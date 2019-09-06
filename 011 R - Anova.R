tratamento = read.csv(file.choose(), sep = ";", header = T)
fix(tratamento)
# Criando analise de variancia
  # criando boxplot para que possamos analisar visualmente a variancia
    # var de resposta = tratamento$horas, ecplanatoria tratamento$remedio
boxplot(tratamento$Horas ~ tratamento$Remedio)
# analise de variancia de um fator
  #aov = analise of variance
an = aov(Horas ~ Remedio, data = tratamento)
summary(an)
# foi checado que o p-value esta acima do alfa escolhido de 0.05
  
# analise de variancia de dois fatores
an2 = aov(Horas ~ Remedio * Sexo, data = tratamento)
summary(an2)
# foi checado que o p-value esta acima do alfa escolhido de 0.05
  # criando teste de tuskey entre as categorias para chevcar de onde vem a variacao
an = aov(Horas ~ Remedio, data = tratamento)
tk = TukeyHSD(an)
# visualizando objeto
tk
# gerando grafico
plot(tk)