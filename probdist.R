####Discrete distributions

#binomial 
#dbinomial ::: returns probs
#dbinomail(X=x, n, p)     Pr(X=x; n, p)   x<=n

dbinom(1, 2, 0.5)    #dbinom(x, n, p)

x=c(0:12)
x

y=dbinom(0:12, 12, 0.5)
y
plot(x,y, type="o", ylim=c(0, 0.25))


#pbinomial cumulative 
pbinom(7, 12, 0.4)   #Pr(X<=4, 12, 0.4) #Pr(X<=4, 12, 0.4)=0.43  Pr(X=0, 12, 0.4)+Pr(X=1)+..+Pr(X=4)

#=0.44 prob of getting 4 or less successes in 12 tries.

x=c(0:12)
x
y=pbinom(0:12, 12, 0.4)
plot(x,y)


#Example: the chance of making a purchase is 30%. We choose 5 customers at random.
#calculate the prob of 3 customers making a purchase?
dbinom(3,5,0.3)
#calculate the prob of 0, 1,2, 3, 4,5 of them making a purchase?
dbinom(0:5, 5, 0.3)
#calculate the prob 4 or less of them making a purchase?
pbinom(4, 5, 0.3)
#pbinom(0,5,0.3) =dbinom(0,5,0.3)   TRUE / FALSE
pbinom(0:5, 5, 0.3)



#qbinomial is the inverse of pbinomial 
#we choose 12 students at random. 20% of students got A last semester. 
qbinom(0.50, 12, 0.2)   

#rbinomial generates binomial data
#Consider a production company. The chance of producing a defect item is 2%. Suppose the company 
#produces 150 units per hour. Approximate the number defect items for each hour of today (24*7=168 hrs).

#n=150
#p=0.02=2%
#r=24


ndi=rbinom(168, 150, 0.02)
hist(ndi, probability = T)

mean(ndi)

###Poisson distribution # of occurances per unit of time
dpois(2, 4)   #Pr(X=2)   
ppois(4, 4)    #Pr(X<=4)
qpois(0.62, 4)   #quantile(0.62)

#Consider an online shop. On average the shop has 4 visits every hour. Approximate 
# the number visit for the next 24*7=168 *hours 8-9, 9-10, 10-11*.

rpois(168, 4)

x=rpois(168, 4)   #
hist(x, probability = T)


##Geometric distribution #a success in kth try
#x=0,1,2,3,4.... is the failures in the sequences  p(x)=Pr(X=x)=p(1-p)^x
dgeom(0, 0.5)     #FFFS
pgeom(3, 0.5)     
qgeom(0.93, 0.5)

#Consider an online Shop. The chance of making a purchase for each customer 
#visiting is 40%. Approximate the number of customers not making purchase 
# for the next three hours 8-9, 9-10, 10-11:  

rgeom(168, 0.4)



x=rgeom(168, 0.4)    
hist(x)

##Normial distribution 

dnorm(18:60, 26, 6)
pnorm(27, 26, 6)
qnorm(0.60, 26, 6)

#Suppose we want generate 1000 numbers which has normal distribution with mean 
#3, and sd=1
a=rnorm(1000, 3,1)
plot(density(a))



