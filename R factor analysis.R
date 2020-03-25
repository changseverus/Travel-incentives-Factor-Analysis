# traveling factor analysis

library(haven)
library(stats)

# load data
dat<-read_sav("travel_survey.sav")

# view data, run basic EDA
str(dat)
head(dat)
summary(dat)


# First, decide how many factors to extract, use eigenvalues and screeplot to determine
library(nFactors)
ev<-eigen(cor(dat))
ap<-parallel(subject=nrow(dat),var=ncol(dat),rep=100,cent=.05)
ns<-nScree(x=ev$values,aparallel=ap$eigen$qevpea)
plotnScree(ns)

# run maximum likelihood factor analysis
# based on previous results, extracting 6 factors with varimax rotation
trav_fac<-factanal(dat,6,rotation="varimax")

# see the loadings of each factors, how they are influenced by the original features
trav_fac$loadings








