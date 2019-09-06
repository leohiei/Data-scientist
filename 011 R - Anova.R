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
------------------
> tratamento = read.csv(file.choose(), sep = ";", header = T)
> fix(tratamento)
> boxplot(tratamento$Horas ~ tratamento$Remedio)
> an = aov(Horas ~ Remedio, data = tratamento)
> summary(an)
            Df Sum Sq Mean Sq F value Pr(>F)
Remedio      2   4.08   2.042   0.538  0.592
Residuals   21  79.75   3.798               
> an2 = aov(Horas ~ Remedio * Sexo, data = tratamento)
> summary(an2)
             Df Sum Sq Mean Sq F value Pr(>F)
Remedio       2   4.08   2.042   0.533  0.596
Sexo          1   4.17   4.167   1.087  0.311
Remedio:Sexo  2   6.58   3.292   0.859  0.440
Residuals    18  69.00   3.833               
> an = aov(Horas ~ Remedio, data = tratamento)
> tk = TukeyHSD(an)
> tk
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = Horas ~ Remedio, data = tratamento)

$Remedio
      diff       lwr      upr     p adj
B-A -0.625 -3.080978 1.830978 0.7991405
C-A  0.375 -2.080978 2.830978 0.9218996
C-B  1.000 -1.455978 3.455978 0.5689472

> plot(tk)
> 
