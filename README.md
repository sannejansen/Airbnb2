# **Watch Out: Do the Airbnb Prices in Amsterdam Increase Rapidly?**
![image](https://user-images.githubusercontent.com/98964062/166501741-9aa27bd8-3a58-4319-9058-2ec5d39fa900.png) Source: https://www.missethoreca.nl/293008/pvda-amsterdam-wil-verbod-op-airbnb

### *To what extent does the neighborhood popularity influence the prices of listings in Amsterdam?*

## **Research Motivation**
Airbnb is one of the largest platforms for sharing accomodations worldwide and is operating in 100,000 cities and towns around the world (Airbnb, 2021). Admiak (2018) found that most of the listings in European cities, are centered around major tourist cities. Airbnbs in these cities are evidently located and spread over different neighborhoods. According to Can (1992), the price of a listing will be determined based on two characteristics: the physical characteristics, such as number of bath and bedrooms, and by variables related to the neighbourhood. Neighborhoods thus play a significant role in determining the price of a listing. In many cities, there are up-and-coming neighborhoods. Airbnb hosts who are aware that a particular neighborhood is becoming more popular, could obviously benefit from this change in popularity. A price increase of a few euros will most likely not be noticed by people who book an Airbnb. The question which arises from this is therefore whether the popularity of neighborhoods affects the price of listings. This research is conducted over the city Amsterdam, and could in the future also be conducted over other cities. 

## **Method, Results and Conclusion**
We decided to look at a possible causal relationship between the popularity of a neighborhood and the price of a listing in Amsterdam. Therefore we have the price difference percentage over time by neighborhood, compared to all neighborhoods. After conducting our research we have come to a number of conclusions. The regression output can be found [here](https://github.com/sannejansen/Airbnb2/tree/main/src/analysis). Since it was not possible to analyze the number of listings in a given district over time, we made the following assumption: the popularity of a neigbourhood depends on the number of listings in that particular neighborhood. So, for example: the neighborhood with the most listings is the most popular, while the neighborhood with the least listings is the least popular. By making this assumption, these are the five most popular neighborhoods in Amsterdam:
1. Centrum-West
2. De Baarsjes - Oost-West
3. Centrum-Oost
4. De Pijp - Rivierenbuurt
5. Westerpark

As can be seen in the following table:
| Neighborhood | Number of Listings in Neighborhood |
| ------------- | ------------- |
| **Centrum-West** | **870** |
| **De Baarsjes – Oud-West** | **803** |
| **Centrum-Oost** | **618** | **618** |
| **De Pijp– Rivierenbuurt** | **553** |
| **Westerpark** | **371** |
| Zuid | 366 |
| Oud-Oost | 313 |
| Oud-Noord | 251 |
| Bos en Lommer | 248 |
| Oostenlijk Havengebied – Indische Buurt | 205 |
| Ijburg – Zeeburgereiland | 160 |
| Watergraafsmeer | 147 |
| Noord-West | 136 |
| Slotervaart | 101 |
| Noord-Oost | 93 |
| Geuzenveld – Slotermeer | 83 |
| Buitenveldert – Zuidas | 56 |
| De Aker – Nieuw Sloten | 50 |
| Gaasperdam – Driemond | 44 |
| Osdorp | 36 |
| Bijlmer-Centrum | 33 |
| Bijlmer-Oost | 19 |
 

The mean of the prices of the listings in a specific neigborhood from the first week are compared to the prices of the listings in the same neigborhood in the last week over the course of one year, to measure percent change in the price. The results are as followed:
| **Neigborhood** | **% Price Change** |
| ------------ | -------------|
| Centrum-West  |	-17.58% |
| De Baarsjes – Oud-West |	-13.80% |
| Centrum-Oost	| -20.73% |
| De Pijp – Rivierenbuurt |	-4.76% |
| Westerpark |	-5.80% |
| Zuid	| -21.33% |
| Oud-Oost | -14.53% |
| Oud-Noord	| -12.06% |
| Bos en Lommer | -11.18% |
| Oostenlijk Havengebied – Indische Buurt | -14.07% |
| Ijburg – Zeeburgereiland |	-3.80% |
| Watergraafsmeer |	-1.50% |
| Noord-West | -6.64% |
| Slotervaart | -59.27% |
| Noord-Oost | +2.62 |
| Geuzenveld – Slotermeer |	-7.97% |
| Buitenveldert – Zuidas |	-13.98% |
| De Aker – Nieuw Sloten | -6.85% |
| Gaasperdam – Driemond	| +3.81% |
| Osdorp | -22.07% |
| Bijlmer-Centrum | +2.19% |
| Bijlmer-Oost |	-16.57% |


After seeing these results, it can be concluded that most of the listings were priced lower at the end of the year, compared to the beginning, also in the popular neigborhoods. In this case it cannot be concluded that the popularity of a neigborhood affects the price of a listing. A possible explanation for the decrease in price, might be COVID-19. In order to keep attracting people, it is possible that the prices have been reduced during this period. To get a better insight, it would be interesting to redo the analysis, with data unaffected by COVID-19.


| **Neighborhood** | **% Review_scores_rating ** |
| ------------ | -------------|
| Centrum-West  | 4.75 |
| De Baarsjes – Oud-West | 4.82 |
| Centrum-Oost	| 4.79 |
| De Pijp – Rivierenbuurt | 4.81 |
| Westerpark | 4.81  |
| Zuid	| 4.81 |
| Oud-Oost | 4.80 |
| Oud-Noord	| 4.77 |
| Bos en Lommer | 4.82 |
| Oostenlijk Havengebied – Indische Buurt | 4.80 |
| Ijburg – Zeeburgereiland |	4.75 |
| Watergraafsmeer | 4.76 |
| Noord-West | 4.83 |
| Slotervaart | 4.83 |
| Noord-Oost | 4.85 |
| Geuzenveld – Slotermeer |	4.74 |
| Buitenveldert – Zuidas | 4.70 |
| De Aker – Nieuw Sloten | 4.77 |
| Gaasperdam – Driemond	| 4.72 |
| Osdorp | 4.78 |
| Bijlmer-Centrum | 4.66 |
| Bijlmer-Oost | 4.80 |

As you can see, all the review scores are between 4.66 and 4.85. The neighborhood Bijlmer-Centrum has the lowest score and neighborhood Noord-Oost has the highest score. The average review score is 4.78. 

## **Repository Overview**
```txt
├── airbnb # This is where the full R-code is stored
├── data # This is where the raw data is or will be stored (after running the make file)
├── gen 
│   ├── output # This is where the PDFs of the analyses are or will be stored (after running the make file)
│   └── temp # This is where temporary files are or will be stored (after running the make file)
└── src
    ├── analysis # This is where the codes for the analyses are stored and the linear regression and plots are discussed
    └── data-preparation # This is where the data can be downloaded and cleaned
```
## **Running Instructions**
### Dependencies<br/>
The following programs need to be installed to replicate the project:<br/>

- R and R studio<br/>
    - R and R studio can be installed following the set up instructions that can be found [here](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/) <br/>
      - Packages that need to be installed to run code in R: "haven", "dplyr", "ggplot2", "cluster", "factoextra", "car", "lubridate", "reshape2", "reshape", "TSstudio", and "tidyverse". <br/>
  
- make <br/>
    - For installation instructions on make for Mac and Windows users, you can click [here](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).

- Git
    - For setting up Git and Github, click [here](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/git/).
  
- Command Prompt (Windows) or Terminal (Mac)  <br/>
    - Download the Command Prompt for Windows users or Terminal for Mac users through Anaconda [here](https://www.anaconda.com/products/individual).
  
- Raw data <br/>
    - Obtain the raw data files on Airbnb on Inside Airbnb [here](http://insideairbnb.com/get-the-data.html).
      - The raw data we used for writing this code on Amsterdam can be found in this Github [here](https://github.com/sannejansen/Airbnb_Holmes/tree/my_project/raw_data).

### How to run <br/>
Clone the repository, this can be done by clicking the green button on the top right called "Code" and copying the HTTPS. Make sure to have git installed on your computer, instructions can be found on this page. Open the Command Prompt or Terminal on your laptop or desktop and type $ git clone https://github.com/sannejansen/Airbnb_Holmes.git. If the cloning was successful, a new sub-directory appears on your local drive in the directory where you cloned your repository. Then type make and press enter to run the repository.

## **Literature**
- Admiak, C. (2018). Mapping Airbnb supply in European cities. *Annals of Tourism Research*, 71(c), 67–71. [https://doi.org/10.1016/j.annals.2018.02.008](https://doi.org/10.1016/j.annals.2018.02.008)
- Airbnb. (2021, December 31). *About us*. Airbnb Newsroom. Retrieved from [https://news.airbnb.com/about-us/](https://news.airbnb.com/about-us/)
- Can, A. (1992). Specification and estimation of hedonic housing price models. *Regional Science and Urban Economics*, 22(3), 453–474. [https://doi.org/10.1016/0166-0462(92)90039-4](https://doi.org/10.1016/0166-0462(92)90039-4)

## **About**
This repository is created by five students of the master Marketing Analytics at Tilburg University. This repository is for the course Data Preparation and Workflow Management, coordinated and instructed by Associate Professor Hannes Datta.

### Authors, Email addresses and GitHub Stats Cards<br/>
- Dianne Burgess - MSc Marketing Analytics student
   - d.h.burgess@tilburguniversity.edu <br/>
   - https://github-readme-stats.vercel.app/api?username=DianneBurgess
- Hidde Devenijns - MSc Marketing Analytics & MSc Marketing Management student
   - h.w.a.devenijns@tilburguniversity.edu <br/>
   - https://github-readme-stats.vercel.app/api?username=HiddeDevenijns
- Iris Heuten - MSc Marketing Analytics & MSc Marketing Management student
   - i.r.b.heuten@tilburguniversity.edu <br/>
   - https://github-readme-stats.vercel.app/api?username=IrisTilburg
- Sanne Jansen - MSc Marketing Analytics & MSc Marketing Management student
   - s.m.p.jansen@tilburguniversity.edu <br/>
   - https://github-readme-stats.vercel.app/api?username=sannejansen
- Iris van Walraven - MSc Marketing Analytics & MSc Marketing Management student
   - i.r.m.vanwalraven@tilburguniversity.edu <br/>
   - https://github-readme-stats.vercel.app/api?username=irisvanwalraven
