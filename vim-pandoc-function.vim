
let g:pandoc_putput_extension = '.pdf'

function! PandocMarkdownCompilation()
  w
  execute 'AsyncRun pandoc ' . '%' .
  \ ' -f markdown+implicit_figures+table_captions+multiline_tables+smart
  \ --pdf-engine=xelatex
  \ --filter pandoc-crossref
  \ --columns=200
  \ --verbose
  \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
  \ --csl ~/jobb/styles/' . g:pandoc_citation_style .
  \ ' -o ' . '%' . g:pandoc_putput_extension
endfunction

function! PandocMarkdownCompilationToPdf()
  let g:pandoc_putput_extension = '.pdf'
  call PandocMarkdownCompilation()
endfunction

autocmd Filetype markdown,markdown.pandoc nnoremap <leader>pp
      \ :let g:pandoc_putput_extension = '.pdf'<cr>
      \ :call PandocMarkdownCompilation()<cr>
autocmd Filetype markdown,markdown.pandoc nnoremap <leader>pd
      \ :let g:pandoc_putput_extension = '.docx'<cr>
      \ :call PandocMarkdownCompilation()<cr>
