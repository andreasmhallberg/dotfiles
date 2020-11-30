# This file is sourced in restore.sh to install packages

install.packages(
   'BayesFactor'
  ,'ggplot2'
  ,'lme4'
  ,'emmeans' # constrasts in lm
  ,'lmerTest'
  ,'plotly'
  ,'reshape2' # new reshape
  ,'xtable'
  ,'Hmisc' # xtable to convert to latex
  ,'effects'
  ,"GGally"
  ,"network"
  ,"igraph"
  ,"pander" # converts stuff to pandoc markdown
  ,'ggcorrplot'
  ,'GGally' # ggplairs
  ,'rmarkdown'
  ,'quantmod' # findPeaks
)
