library(ggplot2)
library(hexbin)
dataDirectory <- "E:/sf/output/" 
sf <- read.csv(paste(dataDirectory, 'Salaries.csv', sep=""), header = TRUE)
la <- read.csv(paste(dataDirectory, 'LA_Salaries.csv', sep=""), header = TRUE)


sfla <- rbind(sf, la) 
d <- ggplot(sfla, aes(Year, TotalPay, fill = TotalPay)) +
     stat_binhex(na.rm = TRUE) 
d + facet_wrap(~ Agency)
dff11 = NULL
dff12 = NULL
dff13 = NULL
dff14 = NULL
for (i in 1:length(sf$Year))
 {
if (sf$Year[i] == 2011)
{
  dff11 = rbind(dff11,sf$TotalPay[i])
} 
 else if (sf$Year[i] == 2012)
  {dff12 = rbind(dff12,sf$TotalPay[i])}
  
  else if (sf$Year[i] == 2013)
  {dff13 = rbind(dff13,sf$TotalPay[i])}
  
  else if (sf$Year[i] == 2014)
  {dff14 = rbind(dff14,sf$TotalPay[i])}
  
  
  
  }
avg11 = sum(dff11)/length(dff11)
avg12 = sum(dff12)/length(dff12)
avg13 = sum(dff13)/length(dff13)
avg14 = sum(dff14)/length(dff14)
avg11
avg12
avg13
avg14
yearsSF = c("2011","2012","2013","2014")
avgSF = c(avg11,avg12,avg13,avg14)

qplot(x=yearsSF, y=avgSF,color=yearsSF, size=avgSF,ylim=c(avg11,avg13+500)) 



la11 = NULL
la12 = NULL
la13 = NULL
la14 = NULL
for (i in 1:length(la$Year))
{
  if (la$Year[i] == 2011)
  {
    la11 = rbind(la11,la$TotalPay[i])
  } 
  else if (la$Year[i] == 2012)
  {la12 = rbind(la12,la$TotalPay[i])}
  
  else if (la$Year[i] == 2013)
  {la13 = rbind(la13,la$TotalPay[i])}
  
  else if (la$Year[i] == 2014)
  {la14 = rbind(la14,la$TotalPay[i])}
  
  
  
}
avgla11 = sum(la11)/length(la11)
avgla12 = sum(la12)/length(la12)
avgla13 = sum(la13)/length(la13)
avgla14 = sum(la14)/length(la14)
avgla11
avgla12
avgla13
avgla14
yearsLA = c("2011","2012","2013","2014")
avgLA = c(avgla11,avgla12,avgla13,avgla14)

qplot(x=yearsLA, y=avgLA,color=yearsLA, size=avgLA) 



