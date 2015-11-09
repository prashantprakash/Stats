# reading data from file 
data <- read.delim("/Users/Prashant/Stats/bp.txt",header = TRUE , sep  ="\t")
# draw box plot
boxplot(data ,names = c("armsys","fingsys") , main ="Blood presussre with two different types of system")
# draw QQ plot and histogram to understand the distribution
qqnorm(data[,c('armsys')])
qqline(data[,c('armsys')])

qqnorm(data[,c('fingsys')])
qqline(data[,c('fingsys')])

hist(data[,c('armsys')])
hist(data[,c('fingsys')])

# conclusion distribution is normal

# Confidence Interval with difference of mean 
alpha <- 0.05

armsys.mean <- mean(data[,c('armsys')])
fingsys.mean <- mean (data[,c('fingsys')])

armsys.sd <- sd(data[,c('armsys')])
fingsys.sd <- sd(data[,c('fingsys')])

m <- length(data[,c('armsys')])
n <- length (data[,c('fingsys')])

meandiff <- (armsys.mean - fingsys.mean) + c(-1,1) * qnorm(1- alpha/2) * sqrt((armsys.sd^2/m)+(fingsys.sd^2/n))  

# this CI is -9.0961939  0.5061939 , it contains 0 so we can have a plausible statement sayiing both means can be equal

# z-stat as the sample distribution is normal

zstat <- (armsys.mean - fingsys.mean)/sqrt((armsys.sd^2/m)+(fingsys.sd^2/n))

# -1.753323





