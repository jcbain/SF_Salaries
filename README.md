# CS 4001/7001 Project 2 *San Francisco Salaries* Group

#### By: [Keevey Song](https://github.com/Keevey), [Peng Zhao](https://github.com/pengzhao001), [Rasha Gargees](https://github.com/rashasg), [Andrew Pistole](https://github.com/APistole) & [James Bain](https://github.com/jcbain)

### Dataset and Original Script

Our San Francisco dataset comes from Kaggle and you can find it [here](https://www.kaggle.com/kaggle/sf-salaries).

Our group modified the original scripts, *[Explore SF Salary Data](https://www.kaggle.com/msjgriffiths/d/kaggle/sf-salaries/explore-sf-salary-data)* by [msjgriffiths](https://www.kaggle.com/msjgriffiths) and *[Data Exploration / Predicting Salaries](https://www.kaggle.com/mevanoff24/d/kaggle/sf-salaries/data-exploration-predicting-salaries/notebook)* by [CaliSwag18](https://www.kaggle.com/mevanoff24).

### Instructions on modified file execution

#### For salary and gender analysis
Ensure that the `sample.csv` is in the `output\` subdirectory, as it contains the gender of the randomly sampled individuals. Run the `modified.Rmd` from the parent directory. You can skip down to the section at the bottom titled, `Inferring Gender`, which contains the entire analysis.

#### For SF and LA comparisons
Put `job_compare.ipynb` and `SF_LA_Salaries.csv` under the same path. Make sure the `Seaborn` library has been installed. Open the notebook and execute the code blocks. The detailed instructions of all steps are embedded in markdowns.

### Modified Analyses

The original analysis was very thorough, so seeking modifications or tweaking of any sort given the original analysis was somewhat difficult. This meant that we had to bring in some variables from the outside in order for us to get anything interesting.

At end of the `Modified.Rmd` file, is an analysis that draws in gender as a new variable. In order to do this, we had to split the first name from the rest of the name in the *EmployeeName* column. We then used the `gender` package, which provides a gender prediction based on first name. However, the `gender()` function adds a lot of "fluff" (or what we are calling "fluff") to every single name such as *percent_male* and *percent_female* (Okay, these aren't as trivial as we are suggesting, but for this initial analysis we don't use these for reasons we will get to here shortly).

We were only interested in the projected gender of the each individual, so we created a function, `workerFunc()` to extract just the predicted gender of each name passed to it. I attempted to apply this to all 150,000 rows, and albeit small in comparison to some datasets, it took too long for an quick weekend analysis (> 10 hours). We decided to randomly sample the dataset instead, for which we extracted 1500 rows (a lot more time efficient!).We were interested in a simple pay comparison between genders in San Francisco, so I ran a simple summary on *TotalPay* for females and then again for males. Males, at least in the sample mean get paid $21,000 more.

Before we were able to create the plot that shows year vs. total pay, we tried hard to build a plot that could show job field vs. total pay and separated by gender. The script in Kaggle did something similar but used sqlite file. So we tried to convert csv file to sqlite file but it failed. It turned out that sqlite can only save output as sql file, csv file, txt file, or db file but not sqlite file... We had no idea where sqlite file comes from. And then we tried to read db file or sql file in order to use sql query to classify the job categories but we failed again. Fortunately, this plot shows something interesting.

The original dataset only contains salaries in San Francisco. It would be interesting to see if there are any differences between major cities in California, such as San Francisco and Los Angeles. The original [data source](http://transparentcalifornia.com/agencies/salaries/) contains salaries data of all cities and counties in California. The data of Los Angeles in 2011, 2012, 2013, 2014 were downloaded and processed/merged using the code that has been used to generate the SF data by Kaggle. Then this LA salaries file and the original SF salaries file were combined into a master file called `SF_LA_Salaries.csv` manually. Then categorize jobs in `SF_LA_Salaries.csv` with function `find_job_title` in the original script.

### Plots

The following plot depicts the sampled distribution of total pay for males and females. The mean for both genders are also displayed as vertical lines on the graph.

![total_pay_gender](https://github.com/jcbain/SF_Salaries/blob/master/plots/pay_gender.png)

Notice where the frequencies of pay for males and females are concentrated. Males tend to be paid more.

This plot shows the trend of total pay of each gender from 2012 - 2014. Generally speaking, people would think that men would earn more money than women and the data before 2014 displays exactly this. However, in 2014, the pay of women is almost equal to pay of men.

![gender_year](https://github.com/jcbain/SF_Salaries/blob/master/plots/gender_year.png)

Then compare the count of each category of jobs in SF and LA by the `countplot` function in the `Seaborn` library. The following visualization shows the comparison.

![job_cat](https://github.com/jcbain/SF_Salaries/blob/master/plots/job_cat_LA_SF.png)

 It's very interesting that the number of employees in police category in LA is almost 3 times that of SF. Does this mean LA is a more dangerous place to live compared to SF? According to [California Department of Justice's record in 2013](https://en.wikipedia.org/wiki/California_locations_by_crime_rate), the violent crime rates per 1,000 persons of LA and SF are 5.59 and 7.56 respectively, and the property crime rates per 1,000 persons of LA and SF are 15.90 and 13.96. They are pretty close. Then I realized that the population in LA is about 12 times larger than SF and things became reasonable. Many people work in transit field in SF and very few people in LA are in this field although LA has a much larger population. This is because SF has a much better public transportation system and people there almost do not need to drive. The public transportation system can create many positions in SF. Another interesting finding is there are much more people working in medical field in SF than LA given the fact that LA has a much larger population.
 
In the Kaggle, there were analysis for the data from SF. However, it is interesting to compare the data of SF with other city. We compared the total pay of SF with the LA for 4 years (2011-2014).
The graph shows a  comparison between the total pay of San Francisco and Los Angeles grouped by year. In total the salaries were similar to each other. However. there are some salaries in Los Angeles larger than that of San Francisco with some exception in the year 2011.

![job_cat](https://github.com/jcbain/SF_Salaries/blob/master/plots/SF-LA.png)

In addition to that we compared the average of total pay in these cities. 
The average salaries for all years was larger for Los Angeles than San Francisco except for the year 2013. the following graphs show that

![job_cat](https://github.com/jcbain/SF_Salaries/blob/master/plots/SF.png)


![job_cat](https://github.com/jcbain/SF_Salaries/blob/master/plots/LA.png)



