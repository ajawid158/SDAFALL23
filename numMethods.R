
#univar methods

dfTips=read.csv(url('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv'))
head(dfTips)


#Descriptive methods
#Univar case 
#Numerical methods
#Center of distribution (mean, median)

mean(dfTips$tip)
median(dfTips$tip)

#tip
plot(density(dfTips$tip))

#Center
#Midpoint/median, where most observations are, average,middle, Mode 
mean(dfTips$tip)
median(dfTips$tip)

#location (quantiles and percentiles)
quantile(dfTips$tip)
quantile(dfTips$tip, 0.4)
#write a fun that returns any location in the dist

myQnt=function(x,q){
  pr=quantile(x, q)
  return(pr)
}

#1- myQnt()

boxplot(dfTips$tip,
        horizontal = T, 
        col='#0033FF')

boxplot.stats(dfTips$tip) #outliers
quantile(dfTips$tip, .9)

View(dfTips)
#remove the outliers

tipNew=dfTips$tip[dfTips$tip<5.5]


boxplot(tipNew, horizontal = T)
mean(tipNew)

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

quantile(dfTips$tip, ecdf(dfTips$tip)(4))

#Next:Data Manipulation dplyr package