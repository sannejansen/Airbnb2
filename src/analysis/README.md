# Linear Regression and Plots
**The R codes can be found in the file airbnb/Amsterdam AirBnB.R starting from line 315**

## Linear Regression
Above we conducted a linear regression to test whether there was a relationship between the price (dependent variable) and review_score_rating (independent variable). As you can see in the output the estimated coefficient is 15.990. This means that the price increases with 15.990 if the independent variable (review_score_rating) increases by one unit. Moreover, from the linear regression we can conclude that there is a significant relationship between price and review_scores rating, since it is <0.05.

Several assumptions have to be tested to see if a linear regression analysis actually could be performed:
- Normality
- Linearity
- Homoscedasticity (equality of variance)
- Independence of observations


### Normality

<img width="368" alt="image" src="https://user-images.githubusercontent.com/98964062/167111415-cc25f5d0-7e51-4c74-ba38-2fcb68de746f.png">

As you can see, the graph is not normally distributed. However, this is also not a problem since ‘5’ is the maximum score and consumers could not give any higher. Therefore, in this case it is also not possible to meet this assumption. 

### Linearity

<img width="325" alt="image" src="https://user-images.githubusercontent.com/98964062/167111685-38c49e16-7669-4190-aaa3-061ae186ad81.png">

In this case, there is a nonlinear association between review_scores_rating and the price. However, this is not a problem for interpreting the linear regression because we do have a large dataset. 


### Homoscedasticity

<img width="321" alt="image" src="https://user-images.githubusercontent.com/98964062/167111746-0ce8cd2d-e5e9-4072-b583-9e4f97c85db1.png">

As you can see, there is heteroscedasticity instead of homoscedasticity. So the variance is not equal across the observations. However, also this is not a problem to interpret the linear regression because of the large dataset.


### Independence of observations
We can assume that the observations are independent, and thus that there is no pattern, because we have a large dataset


## Plots

### One Neighbourhood
#### Line plot 
<img width="1440" alt="image" src="https://user-images.githubusercontent.com/98964062/167151655-75f31c90-224e-4f56-bd8e-dd4563b81437.png">

#### Scatterplot 
<img width="1440" alt="image" src="https://user-images.githubusercontent.com/98964062/167151718-7c3c81f8-b17e-48a6-b6fb-f7c67bdf7206.png">


### All Neighbourhoods
<img width="1440" alt="image" src="https://user-images.githubusercontent.com/98964062/167151547-6f0c32e7-5c94-4353-8da7-1954eca69a9b.png">

In this graph you can see the daily price over time of every neighbourhood. 
As you can see, the prices are the highest during the holidays, as a big spike can be seen right at the month January. This is obvious, ofcourse because on that date it's New Year's Eve and people rent out AirBnB's to celebrate. We can also see that prices drop immediately after New Year's and then slowly risee during the period of January until May. After May, prices stay at a pretty steady level for the rest of the year. Until December, when we can see a spike again. This is also due to the Holidays.
