#Bivariate Methods


dfTips=read.csv('tips.csv')
head(dfTips)

##Bivariate methods
dim(dfTips)
##CASE N0. 1: 2 QL vars
#Gender and time


#Chi SQ test
chisq.test(table(dfTips$sex, dfTips$time))

#p-value=0.002  <   0.05 


##CASE No. 2: 1 QL 1 QNT vars
#1 Binary and 1 QNT :::
names(dfTips)
#Gender, tip


#Decision: specify Alpha=5%

t.test(dfTips$tip~dfTips$sex)

#p-value = 0.1378 > 0.05


#1 Non Binary and 1 QNT :::
names(dfTips)

#Day, tip

summary(aov(dfTips$tip~dfTips$day))
 

##CASE No. 3: 2 QNT vars
#Linear association:::correlation test
names(dft)

#total bill and tip

cor(dfTips$total_bill, dfTips$tip)
