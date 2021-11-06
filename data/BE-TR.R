library(readxl)
library(tidyverse)
setwd("~/urbanstudy/field_paper/data")
be_tr <- read_xlsx("BE-TR.Meta-Analysis.database.v2.3Feb20.xlsx",sheet = "Database- RE")
be_tr6 <- read_xlsx("BE-TR.Empirical.Database(6).xlsx",sheet = "1. BE-TR_Database")


betr <- be_tr %>% select(Study_ID,Citation,Estimation_method,
                         `Year of data collection`,`sampling period_SS`,publication_period,
                         sample_size,Country,IV,IV_Indicator, )

betr6 <- be_tr6 %>% select(Study_ID,Citation,Estimation_method,
                         `Year of data collection`,
                         sample_size,Country,IV,IV_Indicator,Fit, Fit_Type )


table(betr$Estimation_method)
table(betr$Country)

NorAmeOLS <- betr %>% filter(Estimation_method %in% c("OLS","OLS (partial adjustment)"),
                             Country%in% c("USA","USA, Canada","Canada")) %>%
  arrange(desc(`Year of data collection`))

recentOLS <- betr %>% filter(Estimation_method %in% c("OLS","OLS (partial adjustment)"),
                publication_period=="2018 - 2019") %>% arrange(desc(`Year of data collection`))

recentPoi <- betr %>% filter(Estimation_method %in% c("Poisson regression","Poisson Regression")) %>%  #,publication_period=="2018 - 2019"
                             arrange(desc(`Year of data collection`))

recentNB <- betr %>% filter(Estimation_method %in% c("Negative binomial regression","Negative binomial regression (multilevel)")) %>%
  arrange(desc(`Year of data collection`))

recentProbit <- betr %>% filter(Estimation_method %in% c("Ordered probit")) %>%
  arrange(desc(`Year of data collection`))


densityM <- betr %>% filter(IV %in% c("Density")) %>%
  arrange(desc(`Year of data collection`))

recentR2 <- betr6 %>%   arrange(desc(Fit))
