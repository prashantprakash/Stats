conf.init<-function(pcap,n,se.pcap){
  pcap = rbinom(n,1,pcap)
  ci<- mean(pcap) + c(-1, 1) * qnorm(1 - (alpha/2)) * se.pcap
  return(ci)
}

pc = c(0.05, 0.1, 0.25, 0.5, 0.9, 0.95)
#pc = c(0.05)
n = c(5, 10, 30, 50, 100)
for (ni in n){
  dev.new()
  par(mfrow=c(2,3))
  for(pi in pc) {
n=ni; pcap=pi
alpha = 0.05        
se.pcap = sqrt(pcap*(1-pcap)/n)    # compute SE
conf.int(pcap,n,se.pcap)
nsim<-100
ci.mat<-replicate(nsim,conf.int(pcap,n,se.pcap))
mean(pcap)

matplot(rbind(1:100,1:100),type="l",lty=1,ci.mat[,1:100],xlab="sample",ylab="CI")
abline(h=pcap)
mean((pcap>=ci.mat[1,])*(pcap<=ci.mat[2,]))
  }
}