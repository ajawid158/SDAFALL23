dtTips=read.csv('tips.csv')
head(dtTips)

#2 QL Variables
#Joint Table
#Gender and smoker associated?

jtSomkGender=table(dtTips$sex, dtTips$smoker)
jtSomkGender

chisq.test(jtSomkGender)  #chi square test

#p-value = 1 meaning that there is NO Association

#Note:if the p-value<0.05 we have very Strong association
# if p-value<0.1 we have a moderate association 
#if p-value>0.1 there is not association
#who give more tip, male or female

#1 Binary (QL) and 1 QNT
#whether Gender has to do anything with the amount of tip?
library(dplyr)
names(dtTips)

genGroup=group_by(dtTips, sex)
summarise(genGroup, mean(tip), sd(tip), min(tip), max(tip))

t.test(dtTips$tip~dtTips$sex)
#p-value = 0.1378>0.1 no association  

#ql is not binary and a QNT 
#
#which day the customers pay more tips

dayGroup=group_by(dtTips, day)
summarise(dayGroup, mean(tip), sd(tip), min(tip), max(tip))

summary(aov(dtTips$tip~dtTips$day))
#pvalue=0.174=17.4%>0.1 no significant association

#2 QNT vars
#how tip changes as total_bill changes 

scatter.smooth(dtTips$total_bill, dtTips$tip)
abline(v=25, col='red')

cor(dtTips$total_bill, dtTips$tip)
cov(dtTips$total_bill, dtTips$tip)
