# O T de Student é usado para amostras pequenas, abaixo de 30

from scipy.stats import t

#Uma pesquisa com 9 cientistas, desvio padrÃ£o 10, mostra que o cientista de dados 
  #ganha R$75 por hora. Qual a probabilidade do salário ser menor que R$80 por hora?
    #média = 75, amostra = 9, dp = 10, < 80
    
#consultando a tabela P sabemos que o t=1,5, o grau de liberdade é 8 (sempre amostra-1)
  #Calculando a probabilidade
t.cdf(1.5, 8)
# Qual a ptobabilidade do salÃ¡rio ser maior que 80?
t.sf(1.5, 8)
    # ou 1 - t.cdf(1.5, 8)
#esse método nos dá o balor em porcentagem
t.sf(1.5, 8) * 100
