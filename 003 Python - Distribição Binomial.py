# Recursos estatísticos
from scipy.stats import binom

# Ao jogar uma moeda 5 vezes, qual a probabilidade de dar cara 3 vezes?
prob = binom.pmf(3, 5, 0.5)

# Ao passar por 4 sinais em 4 tempos, qual a probabilidade e pegar sinal verde
# nenhuma, 1 2 3 ou 4 vezes seguidas?

# nenhuma vez
binom.pmf(0, 4, 0.25)
# uma vez
binom.pmf(1, 4, 0.25)
# duas vezes
binom.pmf(2, 4, 0.25)
# três vezes
binom.pmf(3, 4, 0.25)
# quatro vezes
binom.pmf(4, 4, 0.25)
# probabilidade cumulativa; acumula todos os resultados acima
binom.cdf(4, 4, 0.25)

# Caso o sinal for em 2 tempos?
binom.pmf(4, 4, 0.5)

#Em uma prova de 12 questões devo acertar 7, cada questão tem 4 alternativas;
# qual a probabilidade de a certo?
binom.pmf(7, 12, 0.25)
# exibindo porcentagem
binom.pmf(7, 12, 0.25) * 100

from scipy.stats import binom

prob = binom.pmf(3, 5, 0.5)

binom.pmf(3, 5, 0.5)
Out[3]: 0.3125

binom.pmf(0, 4, 0.25)
Out[4]: 0.31640625000000006

binom.pmf(1, 4, 0.25)
Out[5]: 0.4218750000000001

binom.pmf(2, 4, 0.25)
Out[6]: 0.21093750000000006

binom.pmf(3, 4, 0.25)
Out[7]: 0.046875000000000035

binom.pmf(4, 4, 0.25)
Out[8]: 0.003906250000000001

binom.pmf(4, 4, 0.5)
Out[9]: 0.0625

binom.pmf(7, 12, 0.25)
Out[10]: 0.011471271514892573

binom.pmf(7, 12, 0.25) * 100
Out[11]: 1.1471271514892574
