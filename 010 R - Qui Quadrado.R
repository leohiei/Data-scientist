# teste de qui quadrado
  #criando a funcao de tabela
    #nrow(num de linhas), byrow=T distribuir valores por linha
novela = matrix(c(19, 6, 43, 32), nrow=2, byrow=T)
fix(novela)
#nomeando linhas e colunas
  #rownames (nome das linhas)
  #colnames (nome das colunas)
rownames(novela) = c('Masculino', 'Feminino')
colnames(novela) = c('Assiste', 'Nao assiste')
fix(novela)
# chamando a funcao qui de quadrado
chisq.test(novela)
# o resultado de p-value mostra que por ser maior queo alfa (0.05) nao podemos rejeitar a hipótese nula, nesse caso nao ha
   # diferenca significativa alem do acaso
-------------------
> novela = matrix(c(19, 6, 43, 32), nrow=2, byrow=T)
> fix(novela)
> rownames(novela) = c('Masculino', 'Feminino')
> colnames(novela) = c('Assiste', 'Nao assiste')
> fix(novela)
> chisq.test(novela)

	Pearson's Chi-squared test with Yates' continuity correction

data:  novela
X-squared = 2.0374, df = 1, p-value = 0.1535
