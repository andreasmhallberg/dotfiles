syn match Statement "_" containedin=ALL " Stop _ being an error
syn match Statement '\v^\\footnote\{.*\}%$'
syn match Constant "\v\\w*cites?\{[a-z_-]+\}"

