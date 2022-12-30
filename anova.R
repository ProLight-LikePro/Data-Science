library(tidyverse)
library(readxl)

DPJM <- read_excel("D:/Data Science/my project/DPJM.xlsx", 
                   sheet = "Sheet1")

# manipulate data
DPJM$Kuartal <- as.factor(DPJM$Kuartal)
class(DPJM$Kuartal)
levels(DPJM$Kuartal)

# anova test for saham
DPJM %>%
  aov(Saham ~ Kuartal, data = .) %>%
  summary()

# anova test for CR
DPJM %>%
  aov(CR ~ Kuartal, data = .) %>%
  summary()

# anova test for DAR
DPJM %>%
  aov(DAR ~ Kuartal, data = .) %>%
  summary()

# anova test for NPM
DPJM %>%
  aov(NPM ~ Kuartal, data = .) %>%
  summary()

# anova test for EPS
DPJM %>%
  aov(EPS ~ Kuartal, data = .) %>%
  summary()

# tukey HSD for EPS
DPJM %>%
  aov(EPS ~ Kuartal, data = .) %>%
  TukeyHSD() %>%
  plot()