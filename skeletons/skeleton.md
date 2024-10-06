---
title:
lang: sv
author: Andreas Hallberg
papersize: a4
fontsize: 12pt
mainfont: Linux Libertine
date:
section-numbers: true
header-includes:
  - \usepackage[bottom]{footmisc} 
 #  - \usepackage{titleps}
 #  - \newpagestyle{mystyle}{\sethead{}{\bfseries\sffamily\Large\color{black!20} DRAFT --- DO NOT DISTRIBUTE}{}\setfoot{}{\thepage}{}}
 #  - \pagestyle{mystyle}
  - |
    ```{=latex}
    \babelfont[arabic]{rm}[Scale=1.5]{Lateef}
    ```
  - \def\UrlFont{\itshape}
    # Disable pagebreaks tables
 #  - \preto{\longtable}{\begin{minipage}{\textwidth}}
 #  - \appto{\endlongtable}{\bigskip\end{minipage}}
notes-after-puncturation: true
# for pandoc-crossref
tabPrefix:
  - 'Table'
  - 'Tables'
figPrefix:
  - 'Figure'
  - 'Figures'
---

\frenchspacing
\lefthyphenmin=3
\righthyphenmin=3
