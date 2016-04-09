library(ggplot2)
library(hexbin)
dataDirectory <- "../SF_Salaries-LA_Salaries/dataset/" 
sf <- read.csv(paste(dataDirectory, 'Salaries.csv', sep=""), header = TRUE)
la <- read.csv(paste(dataDirectory, 'LA_Salaries.csv', sep=""), header = TRUE)


sfla <- rbind(sf, la) 
d <- ggplot(sfla, aes(Year, TotalPay, fill = TotalPay)) +
     stat_binhex(na.rm = TRUE) 
d + facet_wrap(~ Agency)

