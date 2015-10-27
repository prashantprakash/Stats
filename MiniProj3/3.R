px <- 61/414
py <- 74/501
m <- 414
n <- 501
phat <- px - py 
alpha <- 0.05
SE <- sqrt( ((px*(1-px))/m) + ((py*(1-py))/n))
CI <- phat + qnorm(1-(alpha/2))*SE*c(-1,1)
CI
