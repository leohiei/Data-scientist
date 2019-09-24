import pandas as pd
from scipy import stats
import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.multicomp import MultiComparison

remed = pd.read_csv('anova.csv', sep = ';')

# var de respostas sera horas

#grafico caixa
    # grid =F tira as linhas do grafico
remed.boxplot(by = 'Remedio', grid = False)
    #Checando o grafico podemos dizer que a mediana do remedio A e B é a mesma
        # A tem disteibuição mais homogenea, pois se concentra mais na central
        # B concentração mais para baixo
        # C concentração mais para cima

# Aplicando método Anova
    # importando método OLS, que é o método de regressão
#criando var e realizando divisão
    #fit para realizar o treinamento
modelo1 = ols('Horas ~ Remedio', data = remed).fit()
#utilizando Anova
res1 = sm.stats.anova_lm(modelo1)

modelo2 = ols('Horas ~ Remedio * Sexo', data = remed).fit()
res2 = sm.stats.anova_lm(modelo2)

# Checados os valores de P e constatando se existe ou não variações
    #caso haja é preciso realizar teste de tukey árga encpontrar variação
mc = MultiComparison(remed['Horas'], remed['Remedio'])
res_mc = mc.tukeyhsd()
print(res_mc)
# O resultado mostra que nas relações de grupo o valor de P não deve ser rejeitado
    #com base no parametro de valor 0.05
    
# gerando um grafico específico para este tipo de resultado
res_mc.plot_simultaneous()