# This file is sourced in restore.sh to install packages

# type='mac.binary' prefers binaries even if these are slightly older. This makes installing less error-prone.

install.packages("GGally")
install.packages("igraph")
install.packages("network")
install.packages("pander") # converts stuff to pandoc markdown
install.packages('BayesFactor')
install.packages('GGally')# ggplairs
install.packages('Hmisc')# xtable to convert to latex
install.packages('effects')
install.packages('emmeans')# constrasts in lm
install.packages('ggcorrplot')
install.packages('ggplot2')
install.packages('lme4')
install.packages('lmerTest')
install.packages('network')
install.packages('plotly')
install.packages('quantmod')# findPeaks
install.packages('readxl') # read_xlsx()
install.packages('reshape2')# new reshape
install.packages('rmarkdown')
install.packages('stringr')
install.packages('sna')
install.packages('xtable')
install.packages('penalized') # force positive or negative slope in regress. https://stackoverflow.com/questions/27244898/force-certain-parameters-to-have-positive-coefficients-in-lm
