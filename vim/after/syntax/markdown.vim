" LaTeX commands
syn match Statement "\\[a-zA-Z]\+"

" material within ``
syn match Constant "`[^`]\{-}`"

" put this last to overried above 
syn match Underlined "\\\(if[a-z]\+\|else\|fi\)\>"

" fold html comments
syn region MDHtmlFold start="^<!--" end="-->$" transparent keepend fold

" Pandoc citation
syn match MDPandocCitation '@\zs[a-z0-9_]\+'
syn match MDPandocTblFigLab '[@#]\zs\(tbl\|fig\):[a-z0-9]\+'

" block quotes
syn match MDCitation '^\s*>.\+$'

syn match Constant 'First\|Second\|Third\|Fourth,'
syn match Constant '\<(\?[a-z0-9])'

" links
hi link MDPandocCitation Statement
hi link MDPandocTblFigLab Statement
hi link MDCitation Comment
hi link MDInlineFootnote Type
