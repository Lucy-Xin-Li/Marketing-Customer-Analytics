## Bass Diffusion Model and Market Size Estimation ##

## data procesing ##
data = read.csv('adoptionseries2_with_noise.csv')
str(data)

data$A.t=cumsum(data$N.t.)
data$A.t=c(0,data$A.t[1:13])
data$A.t.square=data$A.t^2

## Method1: Get Parameter a b c ##
bass.linear=lm(N.t.~A.t+A.t.square,data=data)
a=as.numeric(bass.linear$coefficients[1])
b=as.numeric(bass.linear$coefficients[2])
c=as.numeric(bass.linear$coefficients[3])

## Method1: Get Parameter p q M ##
p=(sqrt(b*b-4*a*c)-b)/2
q=(sqrt(b*b-4*a*c)+b)/2
M=-q/c
p
q
M

## Method1: Predict N.t[30] ##
n=30
N.t=data$N.t.
A.t=data$A.t
l=length(data$A.t)
A.t[l+1]=data$A.t[l]+data$N.t.[l]

for(i in (l+1):n){
  N.t=c(N.t,a+b*A.t[i]+c*A.t[i]*A.t[i])
  A.t[i+1]=N.t[i]+A.t[i]
}
N.t[n]

## Method2: Get Parameter with an estimated Market size ##
Bass.nls <- nls(N.t. ~ 100*P+(Q-P)*A.t - Q/100*A.t*A.t, start = list(P = 0, Q = 0),data=data)
a=summary(Bass.nls)
P=a$coefficients[1]
Q=a$coefficients[2]

## Method2: Predict N.t[30] ##
n=30
l=length(data$A.t)
A.t=data$A.t
N.t=data$N.t.

A.t[l+1]=data$A.t[l]+data$N.t.[l]
for(i in (l+1):n){
  N.t=c(N.t,100*P+(Q-P)*A.t[i] - Q/100*A.t[i]*A.t[i])
  A.t[i+1]=N.t[i]+A.t[i]
}
N.t[n]

## Method3: Continuous Case - Get Parameter with an estimated Market size ##
A.t=data$A.t
N.t=data$N.t.
t=data$t
Bass.nls.con <- nls(N.t ~ 100*(1-exp(-(p+q)*t))/(1+(q/p)*exp(-(p+q)*t)) - 100*(1-exp(-(p+q)*(t-1)))/(1+(q/p)*exp(-(p+q)*(t-1))), start = list(p = 0.0005, q = 0.5))
Continuous=summary(Bass.nls.con)

p=Continuous$parameters[1]
q=Continuous$parameters[2]

## Method3: Continuous Case - Predict N.t[30] ##
n=30
t=1:n
l=length(data$A.t)
A.t[l+1]=data$A.t[l]+data$N.t.[l]
for(i in (l+1):n){
  N.t=c(N.t,100*(1-exp(-(p+q)*t[i]))/(1+(q/p)*exp(-(p+q)*t[i])) - 100*(1-exp(-(p+q)*t[i-1]))/(1+(q/p)*exp(-(p+q)*t[i-1])))
  A.t[i+1]=N.t[i]+A.t[i]
}
N.t[n]
