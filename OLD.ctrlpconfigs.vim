"{{{2 ctrlp
" Speed up with ripgrep
" https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
 " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'


 
let g:ctrlp_use_caching = 1          "  Save cache  between searches. Dafault 1
let g:ctrlp_follow_symlinks = 2      "  follow symlinks. 2 - follow all symlinks indiscriminately.
let g:ctrlp_show_hidden = 1          "  Search also for hidden files/dirs
let g:ctrlp_clear_cache_on_exit = 0  "  Default 1
let g:ctrlp_max_files = 0            "  Unlimited Cashe
let g:ctrlp_show_hidden = 1          "  Include dotfiles in search

" Things to ignore.
" Don't use ^ in regex here. Deosn't work
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v(Applications|Downloads|Library|Trash|mmpr)$',
    \ }

" Define new function to do different operations depending on filetype.
" https://github.com/kien/ctrlp.vim/issues/232

" In ctrlp-window
"   - <CR> will 
"     - open text files in vim
"     - open file externally if not a text file
"     - open docx via pandoc as markdown in vim
"   - Ctrl-x will insert the path and file
"     name (useful for attaching files in mutt)   

function! NewOpenFunc(action, line)
  " Open pdf/sound/image files in external program with '!open'
  if fnamemodify(a:line, ':e') =~?
      \ '^\(rtf\|ma4\|mp3\|mp4\|jpeg\|jpg\|png\|pptx\|doc\|docx\)\?$'
    " Get the filename
    let filename = fnameescape(fnamemodify(a:line, ':p'))

    call ctrlp#exit()

    " Open the file
    silent! execute '!open' filename

  elseif fnamemodify(a:line, ':e') =~?
      \ '^pdf\?$'
    " Get the filename
    let filename = fnameescape(fnamemodify(a:line, ':p'))

    call ctrlp#exit()

    " Open the file
    silent! execute 'AsyncRun xpdf' filename

  " Open docx via pandoc
  " elseif fnamemodify(a:line, ':e') =~?
  "     \ '^docx\?$'
  "   " Get the filename
  "   let filename = fnameescape(fnamemodify(a:line, ':p'))

  "   call ctrlp#exit()

  "   " Open the file
  "   silent! execute 'ene'
  "   silent! execute 'r!pandoc -t markdown -f docx' filename
  "   setlocal ft=markdown

   " ctrl-x to insert filepath in buffer
   " https://vi.stackexchange.com/questions/8976/is-there-a-way-to-insert-a-path-of-the-file-instead-of-opening-it-with-ctrlp-plu
   elseif a:action =~ 'v'    
      " Get the filename
      let filename = fnameescape(fnamemodify(a:line, ':p'))

      " Close CtrlP
      call ctrlp#exit()

      " insert the contents of filename into the buffer
      put =filename
  else

    " For textfile, simulate pressing <c-o>r to replace current buffer
    call feedkeys("\<c-o>r")
    
  endif
endfunction

let g:ctrlp_open_func = { 'files': 'NewOpenFunc' }

" }}}2
