# Linear Regression

Above we conducted a linear regression to test whether there was a relationship between the price (dependent variable) and review_score_rating (independent variable). As you can see in the output the estimated coefficient is 15.990. This means that the price increases with 15.990 if the independent variable (review_score_rating) increases by one unit. Moreover, from the linear regression we can conclude that there is a significant relationship between price and review_scores rating, since it is <0.05.

Several assumptions have to be tested to see if a linear regression analysis actually could be performed:
- Normality
- Linearity
- Homoscedasticity (equality of variance)
- Independence of observations


## Normality:

<img width="368" alt="image" src="https://user-images.githubusercontent.com/98964062/167111415-cc25f5d0-7e51-4c74-ba38-2fcb68de746f.png">

As you can see, the graph is not normally distributed. However, this is also not a problem since ‘5’ is the maximum score and consumers could not give any higher. Therefore, in this case it is also not possible to meet this assumption. 

## linearity:

<img width="325" alt="image" src="https://user-images.githubusercontent.com/98964062/167111685-38c49e16-7669-4190-aaa3-061ae186ad81.png">

In this case, there is a nonlinear association between review_scores_rating and the price. However, this is not a problem for interpreting the linear regression because we do have a large dataset. 


## Homoscedasticity:

<img width="321" alt="image" src="https://user-images.githubusercontent.com/98964062/167111746-0ce8cd2d-e5e9-4072-b583-9e4f97c85db1.png">

As you can see, there is heteroscedasticity instead of homoscedasticity. So the variance is not equal across the observations. However, also this is not a problem to interpret the linear regression because of the large dataset.


##Independence of observations:
We can assume that the observations are independent, and thus that there is no pattern, because we have a large dataset
