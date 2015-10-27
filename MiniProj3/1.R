pc = c(0.05, 0.1, 0.25, 0.5, 0.9, 0.95)
#pc = c(0.05)
n = c(5, 10, 30, 50, 100)
for (ni in n){
  dev.new()
  par(mfrow=c(2,3))
  for(pi in pc) {
m<-100
n<-ni
p<-pi
phat<-rbinom(m,n,p)/n
phat
SE <-sqrt(phat*(1-phat)/n) 
alpha <- 0.10
ci<-qnorm(1-alpha/2)
matplot(rbind(phat-ci*SE,phat+ci*SE), rbind(1:m,1:m), type="l",lty=1,xlab="sample",ylab="CI")
abline(v=p)
  }
}