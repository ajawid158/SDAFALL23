#data manipulation with dplyr package
library(dplyr)
dfTips=read.csv('tips.csv')
View(dfTips)
names(dfTips)
dim(dfTips)

#filter rows
fcust=filter(dfTips, sex=='Female')
head(fcust)
dim(fcust)

fNonS=filter(dfTips, sex=="Female", smoker=='No')
head(fNonS)
dim(fNonS)

#logical operators &, |, !
unique(dfTips$day)

weekend=filter(dfTips, day=='Sun'| day=='Sat')  #day==Sat | Sun
head(weekend)
View(weekend)
dim(weekend)
nrow(dfTips)
filter(dfTips, day=='Sun' & day=='Sat') 
#weekend and female
wkEndF=filter(dfTips, (day=='Sun'|day=='Sat') & sex=='Female')
head(wkEndF)
dim(wkEndF)

#Weekdays 
filter(dfTips, sex !='Female')
unique(dfTips$day)

wkDays=filter(dfTips, day!='Sun' &  day !='Sat')
head(wkDays)
View(wkDays)

#use the function %in%
unique(dfTips$size)

filter(dfTips, size %in% c(5,6))
filter(dfTips, day %in% c('Sun','Sat'))

#for numerical >, <, ==
filter(dfTips, size<4)


#Arrange
names(dfTips)

head(arrange(dfTips, -desc(tip)))
head(arrange(dfTips, sex))   #decode the values F=1 Male 0

View(dfTips)
#select
names(dfTips)
x0=select(dfTips, c(total_bill, tip, size))
head(x0)
head(dfTips)
select(dfTips, size, everything())
head(dfTips)

dfTips=select(dfTips, total_bill:size)
head(dfTips)

select(dfTips, tip:smoker)
head(select(dfTips, -(tip:smoker)))


#rename
names(dfTips)

dfTips1=rename(dfTips, Bill=total_bill)
head(dfTips1)


#mutate
head(dfTips)
#total spending=total_bill+tip
head(mutate(dfTips, total_cost=total_bill+tip))
head(mutate(dfTips, tax=total_bill*0.2))

#summarize
summarise(dfTips, mean(total_bill), sd(total_bill),  mean(tip), sd(tip))

gender=group_by(dfTips, sex)

summarise(gender, mean(total_bill), sd(total_bill))
smoker=group_by(dfTips, smoker)
summarise(smoker, mean(tip), sd(tip))
names(dfTips)

#pull a column as a vector 
smk = pull(dfTips, smoker)

head(smk)


#sample_n
dim(dfTips)
sampledfTips=sample_n(dfTips, 100)
head(sampledfTips)
View(sampledfTips)