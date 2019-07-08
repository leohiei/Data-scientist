# Em uma caixa cujo a média de peso dos objetos é 8 quilos, 
# qual a probabilidade de tirar um objeto de abaixo 6 quilos? o desvio padrão é de 2
# media = 8, objeto < 6, dp = 2

# Como o objeto está abaixo da média, ou seja, na esquerda, usamos o pnorm
  #pnorm(peso, média, desvio padrão)
pnorm(6, 8, 2)

# qual a probabilidade de tirar um objeto de acima 6 quilos? o desvio padrão é de 2
# media = 8, objeto > 6, dp = 2

# Como o objeto é de média cumulativa, ou seja, na esquerda (6), passa a média (8) até a direita
  # usamos o pnorm com parametro falso
    #pnorm(peso, média, desvio adrão, parâmetro lower.tail=F)
pnorm(6, 8, 2, llower.tail = F)
  # outro método seria 1 - pnorm(6, 8, 2); traria o mesmo resultado,  
    # o calculo insere a área da esquerda menos a probabilidade total que é igual a 1

# qual a probabilidade de tirar um objeto de abaixo de 6 quilos ou acima de 10 quilos?
pnorm(6, 8, 2) + pnorm(10, 8, 2, lower.tail = F)
    # ou pnorm(6, 8, 2) + (1 - pnorm(10, 8, 2))

# qual a probabilidade de tirar um objeto abaixo de 10 quilos e acima de 8 quilos?
  # Como o objeto é de média cumulativa, ou seja, da direita (10), passa a média (8) até a esquerda
    # subtraímos a direita da esquerda
pnorm(10, 8, 2) - pnorm(8, 8, 2)
------------------------------------------------
> pnorm(6, 8, 2)
[1] 0.1586553
> pnorm(6, 8, 2, lower.tail = F)
[1] 0.8413447
> 1 - pnorm(6, 8, 2)
[1] 0.8413447
> pnorm(6, 8, 2) + pnorm(10, 8, 2, lower.tail = F)
[1] 0.3173105
> pnorm(6, 8, 2) + (1 - pnorm(10, 8, 2))
[1] 0.3173105
> pnorm(10, 8, 2) - pnorm(8, 8, 2)
[1] 0.3413447
> 
