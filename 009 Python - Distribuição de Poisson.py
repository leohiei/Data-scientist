from scipy.stats import poisson
# o num de acidentes de carro por dia eh 2, qual a probab de em 1 dia ocorrer 
                                                                #3 acidentes?
  # X = 3, media(lambda) = 2
poisson.pmf(3, 2)
# o num de acidentes de carro por dia eh 2, qual a probab de em 1 dia ocorrer 
                                                        # 3 ou menos acidentes?
  # X <= 3, media(lambda) = 2
poisson.cdf(3, 2)
# o num de acidentes de carro por dia eh 2, qual a probabde em 1 dia ocorrer 
                                                       # mais que 3 acidentes?
  # X > 3, media(lambda) = 2
poisson.sf(3, 2)