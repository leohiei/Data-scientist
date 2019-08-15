# o num de acidentes de carro por dia eh 2, qual a probab de em 1 dia ocorrer 3 acidentes?
  # X = 3, media(lambda) = 2
# calculo da probab
dpois(3, lambda = 2)
# o num de acidentes de carro por dia eh 2, qual a probab de em 1 dia ocorrer 3 ou menos acidentes?
  # X <= 3, media(lambda) = 2
ppois(3, lambda = 2)
# o num de acidentes de carro por dia eh 2, qual a probabde em 1 dia ocorrer mais que 3 acidentes?
  # X > 3, media(lambda) = 2
ppois(3, lambda = 2, lower.tail = F)
------------------------------------
> dpois(3, lambda = 2)
[1] 0.180447
> ppois(3,lambda=2)
[1] 0.8571235
> ppois(3, lambda = 2, lower.tail = F)
[1] 0.1428765
> 
