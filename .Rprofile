# almost never use scientific notation
options(csipen=10)

# Set CRAN mirror to a default location
options(repos = "http://cran.uk.r-project.org")

# Load packages
library(pander)
library(ggplot2)
library(lme4)
library(lmerTest)
library(GGally)
library(reshape) # provides function melt to transform wide to long

# Funcions
  # transform proportion to percent with two decimals
roundpercent <- function(x) round(x*100,1)

 # get standard error of ninary variable
 # https://stackoverflow.com/questions/38583729/standard-error-binary-variable-r
se.bin <- function(x) sqrt((mean(x)*(1-mean(x)))/length(x))
