" This fucntion takes input as number of Simulation of trials and 
  return as mean of experiment performed"
calExpectedValue <- function(nSteps) {
nExp <- 3 
rate <- 0.2
# replciating the experiment number of times as entered by the user 
# rate is 0.2 /min becasue mean is given as 5 min 
X <- replicate(nSteps,max(rexp(nExp,rate = rate)))
# Building histogram 
# opening new window everytime
dev.new()
hist(X,probability = TRUE ,main = "Histogram" , col ="blue")
# building curve
curve(0.6*(1-exp(-0.2*x))^2*exp(-0.2*x), add = TRUE , col = "red")
# calculation mean 
expValue <- mean(X)
return (expValue)
}
# Initial Setup to perform experiment
nSteps <- 100000
nTrials <-1
# replication of whole experiment n number of times
expValue <-replicate(nTrials,calExpectedValue(nSteps))
# expvalue is a vector which contains mean for all trials 
expValue

