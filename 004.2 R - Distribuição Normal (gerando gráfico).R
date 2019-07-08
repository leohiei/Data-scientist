# Gerando diagrama de normalidade

# Gerando dados aleatórios que estão normalmente distribuídos
  # var = chamando a funçãO(quantdade de variáveis)
x = rnorm(100)

# gerando gráfico de distribuição com qqnorm
  # chamando a função(passando a variável)
qqnorm(x)
# gerando a linha de ajuste
qqline(x)

# teste de normalidade com shapiro
shapiro.test(x)
