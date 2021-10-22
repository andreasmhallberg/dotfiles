gsed -i'' 's/begin{longtable}/begin{tabular}/g' $1
gsed -i'' 's/end{longtable}/end{tabular}/g' $1
gsed -i'' '/\\endfirsthead/,/\\endhead/d' $1
gsed -i'' 's/\\begin{tabular}/\\begin{table}\n&/' $1
gsed -i'' 's/\\end{tabular}/&\n\\end{table}/' $1
gsed -i'' 's/\\tabularnewline//' $1
gsed -i -n '/\\begin{tabular}/{h;n;G};p' $1 # Move caption outside of tabular env
