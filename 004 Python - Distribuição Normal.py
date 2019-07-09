from scipy.stats import norm

# Em uma caixa cujo a média de peso dos objetos é 8 quilos, 
# qual a probabilidade de tirar um objeto de abaixo 6 quilos? o desvio padrão é de 2
# media = 8, objeto < 6, dp = 2

# .sf para direita, .cdf para esquerda
# Como o objeto está abaixo da média, ou seja, na esquerda, usamos o norm.cdf
norm.cdf(6, 8, 2)

# qual a probabilidade de tirar um objeto acima 6 quilos? o desvio padrão é de 2
# media = 8, objeto > 6, dp = 2

# Como o objeto é de média cumulativa, ou seja, na esquerda (6), 
    #passa a média (8) até a direita, usamos o norm.sf
norm.sf(6, 8, 2)
        # 1 - norm.cdf(6, 8, 2) apresenta o mesmo resultado

# qual a probabilidade de tirar um objeto abaixo de 6 quilos ou 
    # acima de 10 quilos?
norm.cdf(6, 8, 2) + norm.sf(10, 8, 2)

# qual a probabilidade de tirar um objeto abaixo de 10 quilos e acima de 
    #8 quilos? Como o objeto é de média cumulativa, ou seja, da direita (10), 
        #passa a média (8) até a esquerda, subtraímos a direita da esquerda
norm.cdf(10, 8, 2) - norm.cdf(8, 8, 2)
--------------------------------------
from scipy.stats import norm

norm.cdf(6, 8, 2)
Out[2]: 0.15865525393145707

norm.sf(6, 8, 2)
Out[3]: 0.8413447460685429

norm.cdf(6, 8, 2) + norm.sf(10, 8, 2)
Out[4]: 0.31731050786291415

norm.cdf(10, 8, 2) - norm.cdf(8, 8, 2)
Out[5]: 0.3413447460685429
