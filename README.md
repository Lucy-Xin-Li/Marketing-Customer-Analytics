# Marketing-Customer-Analytics
Models and Codes for Customer Analytics

## Bass Diffusion Model
Discription: Three different forms of bass model for new product diffusion are provided in the code.

Dataset: adoptionseries2_with_noise.csv

Variables and Definetion: 
* t: time
* A.t: number of customers who have already adpoted prior to time t
* A.t(t)=N.t.(1)+N.t.(2)+N.t.(3)+...+N.t.(t-1)
* N.t.: number of new adopters at time t
* A.t.suqare: suqare of A.t
* M: market size, the eventual total number of adopters

Coefficient and Interpretation:
* p: coefficient of innovation
* q: coefficient of imitation

### Model 1: Bass Diffusion Model with Unknown Market Size for Discrete Data

N(t) = M*p+(q-p)*A(t)-q/M[A(t)]^2

### Model 2: Bass Diffusion Model with Certain Market Size for Discrete Data

M=100
* Note: The market size is usually estimated through external data. Suggested Methods: The Chain Ratio, Survey Research.

N(t) = M*p+(q-p)*A(t)-q/M[A(t)]^2

### Model 3: Bass Diffusion Model with Certain Market Size for Continuous Data

M=100
* Note: The market size is usually estimated through external data. Suggested Methods: The Chain Ratio, Survey Research.

N(t) = M*(1-exp(-(p+q)*t)/(1+q/p*exp(-(p+q)*t))-M*(1-exp(-(p+q)*(t-1))/(1+q/p*exp(-(p+q)*(t-1)))


## 




