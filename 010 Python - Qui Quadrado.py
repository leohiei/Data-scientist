import numpy as np
# importacao para trabalhar com tabelas de contingencia
from scipy.stats import chi2_contingency

novela = np.array([[19, 6], [46, 32]])
chi2_contingency(novela)
# o parametro que importa eh o segundo, este eh o valor de P, por ser maior que
    # o alfa (0.05) nao podemos rejeitar a hipótese nula, nesse caso nao ha
        # diferenca significativa alem do acaso
-------------
import numpy as np

from scipy.stats import chi2_contingency

novela = np.array([[19, 6], [46, 32]])

chi2_contingency(novela)
(1.6825632201806293, 0.19458420874360915, 1, array([[15.77669903,  9.22330097],
        [49.22330097, 28.77669903]]))
