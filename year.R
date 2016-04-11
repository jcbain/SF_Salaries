library(dplyr)
library(RSQLite)
library(tidyr)
library(ggplot2)
library(readr)
library(stringr)
library(scales)
library(mixtools)
library(ProjectTemplate)

data_csv <- read_csv("~/Downloads/SF_Salaries-master/output/sample.csv", na=c("Not Provided"))
(glimpse(data_csv))
data <- data_csv

data %>%
  group_by(JobTitle) %>%
  summarise(Frequency = n()) %>%
  arrange(desc(Frequency)) %>%
  head

counts <- table(data$gender, data$JobTitle)
barplot(counts, main="Job Distribution by gender",
        xlab="Number of jobs", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

ggplot(data=data, aes(x=Year, y=mean(TotalPayBenefits), fill=gender)) +
  geom_bar(stat="identity", position=position_dodge())


ggplot(data=data, aes(x=JobTitle, y=TotalPayBenefits, fill=gender)) +
  geom_bar(stat="identity", position=position_dodge())



