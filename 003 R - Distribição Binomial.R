# dbinom encontra uma probabilidade
# pbinom calcula a probabilidade cumulativa
# passando paramatetros dbinom(X, size, probab); 
# X =  num de sucessos; 
# size = num de experimentos executados;
# porcentagem da probabilidade

# Se eu jogar uma moeda 5 vezes, qual a probabilidade de dar cara 3 vezes?
dbinom(3, 5, 0.5)

# Se eu passar 4 sinais de 4 tempos cada, 
# qual a probabilidade de pegar 0, 1, 2, 3, ou 4 sinais verdes?

#Primeiro caso; probabilidade de não pegar nenhum sinal
dbinom(0, 4, 0.25)
# Segundo caso; probabilidade de pegar 1 sinal verde
dbinom(1, 4, 0.25)
# Terceiro caso; probabilidade de pegar 2 sinais verdes
dbinom(2, 4, 0.25)
# Quarto caso; probabilidade de pegar 3 sinais verdes
dbinom(3, 4, 0.25)
# Quinto caso; probabilidade de pegar 4 sinais verdes
dbinom(4, 4, 0.25)

#Inclui todas asprobabilidades do meu evento
pbinom(4, 4, 0.25)

# Numa prova de 12 questões, qual a probabilidade de acertar 7 questões, 
# sendo que cada questão tem 4 alternativas
dbinom(7, 12, 0.25)
