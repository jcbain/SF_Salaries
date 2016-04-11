# CS 4001/7001 Project 2 *San Francisco Salaries* Group

#### By: Keevey Song, Peng Zhao, Rasha Gargees, Andrew Pistole & James Bain

### Dataset and Original Script

Our San Francisco dataset comes from Kaggle and you can find it [here](https://www.kaggle.com/kaggle/sf-salaries).

Our group modified the original scripts, *[Explore SF Salary Data](https://www.kaggle.com/msjgriffiths/d/kaggle/sf-salaries/explore-sf-salary-data)* by [msjgriffiths](https://www.kaggle.com/msjgriffiths) and *[Data Exploration / Predicting Salaries](https://www.kaggle.com/mevanoff24/d/kaggle/sf-salaries/data-exploration-predicting-salaries/notebook)* by [CaliSwag18](https://www.kaggle.com/mevanoff24).

### Instructions on modified file execution
Put `job_compare.ipynb` and `SF_LA_Salaries.csv` under the same path. Make sure the `Seaborn` library has been installed. Open the notebook and execute the code blocks. The detailed instructions of all steps are embedded in markdowns. 

### Modified Analysis

The original analysis was very thorough, so seeking modifications or tweaking of any sort given the original analysis was somewhat difficult. This meant that we had to bring in some variables from the outside in order for us to get anything interesting.

At end of the `Modified.Rmd` file, is an analysis that draws in gender as a new variable. In order to do this, we had to split the first name from the rest of the name in the *EmployeeName* column. We then used the `gender` package, which provides a gender prediction based on first name. However, the `gender()` function adds a lot of "fluff" (or what we are calling "fluff") to every single name such as *percent_male* and *percent_female* (Okay, these aren't as trivial as we are suggesting, but for this initial analysis we don't use these for reasons we will get to here shortly).

We were only interested in the projected gender of the each individual, so we created a function, `workerFunc()` to extract just the predicted gender of each name passed to it. I attempted to apply this to all 150,000 rows, and albeit small in comparison to some datasets, it took too long for an quick weekend analysis (> 10 hours). We decided to randomly sample the dataset instead, for which we extracted 1500 rows (a lot more time efficient!).We were interested in a simple pay comparison between genders in San Francisco, so I ran a simple summary on *TotalPay* for females and then again for males. Males, at least in the sample mean get paid $21,000 more.

The original dataset only contains salaries in San Francisco. It would be interesting to see if there are any differences between major cities in California, such as San Francisco and Los Angeles. The original [data source](http://transparentcalifornia.com/agencies/salaries/) contains salaries data of all cities and counties in California. The data of Los Angeles in 2011, 2012, 2013, 2014 were downloaded and processed/merged using the code that has been used to generate the SF data by Kaggle. Then this LA salaries file and the original SF salaries file were combined into a master file called `SF_LA_Salaries.csv` manually. Then categorize jobs in `SF_LA_Salaries.csv` with function `find_job_title` in the original script.

### Plots

Then compare the count of each category of jobs in SF and LA by the `countplot` function in the `Seaborn` library. The following visualization shows the comparison.

It's very interesting that the number of employees in police category in LA is almost 3 times that of SF. Does this mean LA is a more dangerous place to live compared to SF? According to [California Department of Justice's record in 2013](https://en.wikipedia.org/wiki/California_locations_by_crime_rate), the violent crime rates per 1,000 persons of LA and SF are 5.59 and 7.56 respectively, and the property crime rates per 1,000 persons of LA and SF are 15.90 and 13.96. They are pretty close. Then I realized that the population in LA is about 12 times larger than SF and things became reasonable. Many people work in transit field in SF and very few people in LA are in this field although LA has a much larger population. This is because SF has a much better public transportation system and people there almost do not need to drive. The public transportation system can create many positions in SF. Another interesting finding is there are much more people working in medical field in SF than LA given the fact that LA has a much larger population.
