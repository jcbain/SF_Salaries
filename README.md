# CS 4001/7001 Project 2 *San Francisco Salaries* Group

#### By: Keevey Song, Peng Zhao, Rasha Gargees, Andrew Pistole & James Bain

### Dataset and Original Script

Our San Francisco dataset comes from Kaggle and you can find it [here](https://www.kaggle.com/kaggle/sf-salaries).

Our group modified the original script, *[Explore SF Salary Data](https://www.kaggle.com/msjgriffiths/d/kaggle/sf-salaries/explore-sf-salary-data)* by [msjgriffiths](https://www.kaggle.com/msjgriffiths).


### Modified Analysis

The original analysis was very thorough, so seeking modifications or tweaking of any sort given the original analysis was somewhat difficult. This meant that we had to bring in some variables from the outside in order for us to get anything interesting. At end of the `Modified.Rmd` file, is an analysis that draws in gender as a new variable. In order to do this, we had to split the first name from the rest of the name in the *EmployeeName* column. We then used the `gender` package, which provides a gender prediction based on first name. However, the `gender()` function adds a lot of "fluff" (or what we are calling "fluff") to every single name such as *percent_male* and *percent_female* (Okay, these aren't as trivial as we are suggesting, but for this initial analysis we don't use these for reasons we will get to here shortly).

We were only interested in the projected gender of the each individual, so we created a function, `workerFunc()` to extract just the predicted gender of each name passed to it. I attempted to apply this to all 150,000 rows, and albeit small in comparison to some datasets, it took too long for an quick weekend analysis (> 10 hours). We decided to randomly sample the dataset instead, for which we extracted 1500 rows (a lot more time efficient!).We were interested in a simple pay comparison between genders in San Francisco, so I ran a simple summary on *TotalPay* for females and then again for males. Males, at least in the sample mean get paid $21,000 more.

### Plots
