# O T de Student é usado para amostras pequenas, abaixo de 30

#Uma pesquisa com 9 cientistas, desvio padrão 10, mostra que o cientista de dados 
  #ganha R$75 por hora. Qual a probabilidade do salário ser menor que R$80 por hora?
    #média = 75, amostra = 9, dp = 10, < 80

#consultando a tabela P sabemos que o t=1,5, o grau de liberdade é 8 (sempre amostra-1)
  #Calculando a probabilidade
pt(1.5, 8)

# Qual a ptobabilidade do salário ser maior que 80?
pt(1.5, 8, lower.tail = F)
 # ou 1 - pt(1.5, 8)
--------------------------------------------------
> pt(1.5, 8)
[1] 0.9139984
> pt(1.5, 8, lower.tail = F)
[1] 0.08600165
> 1 - pt(1.5, 8)
[1] 0.08600165
> 
