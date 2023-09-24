####+++++++++++++++++++ITC 255 Fall 23+++++#

#Descriptive methods
    #Univar case 
      #FDT 
#Upload the data dataset tips

dfTips=read.csv(url('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv'))

#Overview of our Dataset
names(dfTips)
dim(dfTips)
head(dfTips)
tail(dfTips)
View(dfTips)

#FDT of a QL var
#smoker


AbsFreq=table(dfTips$smoker)
AbsFreq
RelFreq=round(prop.table(AbsFreq), 2)
RelFreq
CumFreq=cumsum(RelFreq)
CumFreq

FDTSmoker=cbind(AbsFreq, RelFreq, CumFreq)
FDTSmoker


#Write our own function
x=12
y=-10

sum(x,y)
x+y
x-y

#Write a function that returns the +, -, * and / of two numbers
 #name of the funciton >> you give it 
   #function
     # inputs
       #what should be done with inputs
#Local 
BasicOp=function(x,y){
  s=x+y
  d=x-y
  p=x*y
  q=x/y
  return(c(s, d, p, q))
}


BasicOp(10,3)


#write a function that creates and FDT of a QL var


FDTQL=function(x){
  ABSFreq=table(x)
  RELFreq=round(prop.table(ABSFreq),2)
  CUMFreq=cumsum(RELFreq)
  FDTx=cbind(ABSFreq, RELFreq, CUMFreq)
  
  return(FDTx)
}

FDTQL(dfTips$smoker)
FDTQL(dfTips$sex)


##Construction FDT of a Qunat variable 
  #Loops and conditional functions work in R
    #1. Transform the variable into a categorical var
      #based a definition/we specify them 

#Lets use the variable tips

summary(dfTips$tip)

#define catgories: small whtn tip<3 meduim when tip is 3>= but less than 7, large otherwise

#selection + Loop
catTips=c()  #create an empty vector

for (k in 1:length(dfTips$tip)) {
  if(dfTips$tip[k]<3){
    catTips[k]="AsmallTip"
  } else if (dfTips$tip[k] >=3 & dfTips$tip[k]<7) {
    catTips[k]="BmeduimTip"
  } else {
    catTips[k]="Clargetip"
  }
}



tipAmount=cbind(dfTips$tip, catTips)

View(tipAmount)

#2. Next apply the FDTQL function on the trasnformed variable 
FDTQL(catTips)

#+++++++++

#Descriptive methods
    #Univar case 
      #Graphs 
        #Categorical vars (pie and bar)

#create the FDT 
fdtSmoker=FDTQL(dfTips$smoker)[,2]
fdtSmoker

pie(fdtSmoker, 
    col = rainbow(2), 
    main = 'Smoker distribution')

barplot(fdtSmoker, 
        col=rainbow(2), 
        main = 'Smoker distribution')

#Descriptive methods
  #Univar case 
    #Graphs 
      #Num vars (hist and density)

hist(dfTips$tip, 
     col='blue', 
     main = 'Tips distibution')

plot(density(dfTips$tip), 
     col='#0033FF', 
     main='Tips distribution')





