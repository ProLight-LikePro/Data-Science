library(tidyverse)
library(readxl)

DPJM <- read_excel("D:/Data Science/my project/DPJM.xlsx", 
                   sheet = "Sheet1")

# manipulate data
DPJM$Kuartal <- as.factor(DPJM$Kuartal)

# check normality for saham
hist(DPJM$Saham)

# multiple regression for saham
DPJM %>%
  lm(Saham ~ CR + DAR + NPM + EPS, data = .) %>%
  summary()

# check normality for NPM
hist(DPJM$NPM)

# check linearity for NPM
DPJM %>%
  plot(NPM ~ DAR, data = .)

# create regression line
abline(lm(DPJM$NPM ~ DPJM$DAR), lty = 1)

# linear regression for NPM
DPJM %>%
  lm(NPM ~ DAR, data = .) %>%
  summary()

# prediction for NPM
DPJM %>%
  lm(NPM ~ DAR, data = .) %>%
  predict(data.frame(DAR = c(-10)))