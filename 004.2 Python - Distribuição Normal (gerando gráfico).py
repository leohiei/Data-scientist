# Gerando diagrama de normalidade

# bibliotecas
from scipy import stats
from scipy.stats import norm
import matplotlib.pyplot as plt 

# a função rvs gera dados aleatórios nesta distribuição normal
dados = norm.rvs(size = 100)

#gerando gráfico
stats.probplot(dados, plot = plt)

# teste para checar se está normalmente distribuido
stats.shapiro(dados)