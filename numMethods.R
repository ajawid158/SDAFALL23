
#univar methods

dfTips=read.csv(url('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv'))
head(dfTips)


#Descriptive methods
  #Univar case 
    #Numerical methods
      #Center of distribution (mean, median, mode)

#check the distribution
plot(density(dfTips$tip))

#Locate the center....why is it important to locate the center
#different approaches
mean(dfTips$tip)
median(dfTips$tip)

mymode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mymode(dfTips$tip)

#Other locations (quantiles)
quantile(dfTips$tip)    #quartiles
quantile(dfTips$tip, 0.4)
#write a fun that returns any location in the dist

myQnt=function(x,q){
  pr=quantile(x, q)
  return(pr)
}

myQnt(dfTips$tip, 0.35)

#what does 1- myQnt() would calculate?

boxplot(dfTips$tip,
        horizontal = T, 
        col='#0033FF')

outs=boxplot.stats(dfTips$tip)[4] #outliers

outs=data.frame(outs)
min(outs$out)
#remove the outliers

tipNew=dfTips$tip[dfTips$tip<6]


boxplot(tipNew, horizontal = T)
mean(tipNew)
median(tipNew)
mymode(tipNew)


plot(density(dfTips$tip))
#Variation
range(dfTips$tip)
sd(dfTips$tip)
var(dfTips$tip)   #center means the mean
mad(dfTips$tip)

##ECDF 
plot(ecdf(dfTips$tip), 
     col='blue', 
     main='ECDF of Tip', 
     xlab='tip')
abline(v=3.9, col='red', lty=3)
abline(h=0.8, col='darkgreen', lty=3)


ecdf(dfTips$tip)(4)
#83% paid 4 d or less as tip

quantile(dfTips$tip, ecdf(dfTips$tip)(4))


#quantile and ecdf are inverse of one another
quantile(dfTips$tip, 0.8) #we have the percentage...look for the value

ecdf(dfTips$tip)(6)    #we have the value ...look for the percentage


#Next:Data Manipulation dplyr package