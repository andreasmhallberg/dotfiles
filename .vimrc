set nocompatible " don't pretend to be VI
filetype plugin on
filetype indent on
"{{{1 Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'klapheke/vim-chat'                     " syntax highlighting for CHAT-transcriptions
Plugin 'morhetz/gruvbox'                       " colorsheme
Plugin 'jalvesaq/Nvim-R'                       " Successor of R-vimplugin. Requires tmux.
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'                  " gc<movement> to comment
Plugin 'tpope/vim-repeat'                      " make mappings repeatable
Plugin 'tpope/vim-vinegar'
" Plugin 'vim-pandoc/vim-pandoc'               " needed for folding
Plugin 'vim-pandoc/vim-pandoc-syntax'          " good syntax, nested HTML, yaml, etc.
" Plugin 'vim-scripts/textutil.vim'            " Use pandoc instead.
Plugin 'chrisbra/csv.vim'                      " use sc-im for ascii stuff. Better.
Plugin 'sjl/gundo.vim'                         " visual undo tree
Plugin 'godlygeek/tabular'                     " :Tabular command to align stuff
" Plugin 'plasticboy/vim-markdown'             " Use vim-pandoc-syntax instead
Plugin 'lervag/vimtex'                         " tex stuff
Plugin 'vim-scripts/directionalWindowResizer'  " c-<hjkl> to resize window
" Plugin 'vim-scripts/LanguageTool'            " Spell and grammar checking. Not very useful in files with markup.
Plugin 'qpkorr/vim-renamer'                    " Batch rename files vim-style.
Plugin 'kien/ctrlp.vim'                        " Fuzzy file finder.
Plugin 'vim-scripts/YankRing.vim'              " after ctrlp to remap <c-p>
Plugin 'blueyed/vim-diminactive'               " Dims window that is not in focus

" All Plugins must be added before the following line
call vundle#end()            " required

"{{{1 Settings

set clipboard=unnamed                        " unnamed register and *-register are the same. Copy to system clipboard by default. 
" set gdefault                                 " Flag g[lobal] as default on searches. Good in theory but mostly confusing.
set nojoinspaces                             " Don't add extra space when joining lines with shift-J.
set laststatus=2                             " Always show statusline.
set directory=~/.vim/temp                    " Dir for backup files
set whichwrap+=<,>,h,l,[,]                   " Makes h and l and arrow keyes wrap to pre/next line.
set path+=**                                 " make file-based commans search in subfolders
" set complete +=kspell " Complete from dictionary when spell is on. Mostly annoying. Technical words will be written more than once and that way added to completion list.
set belloff=all                              " turn off all warnings bells
set keymap=us-altlatin                       " Load US-alt-latin keymap. See ~/dotfiles
set nowrapscan                               " No wraparournd end of file in normal searches
set nohlsearch                               " No high-light search hits
set incsearch                                " Search while typing
set ignorecase                               " Ignore case when searching
set smartcase                                " Case-sensitive when upper case is used in search string
set complete +=s~/mylatexstuff/bibliotek.bib " Load bibtex dumpfile to completion files
set wildmenu                                 " Show command completion alternatives
set autoread                                 " autoread when a file is changed from the outside
set backspace=indent,eol,start               " backspace over everything in insert mode
set hidden                                   " Allow unsaved buffers to be hidden.
set virtualedit=block                        " Allow block selection over empty lines.
if has("gui_running" )
  set termguicolors                          " 24-bit colors in terminal
endif
set scrolloff=4                              " When scrolling, keep the cursor 4 lines from the top/bottom
set sidescrolloff=4                          " When scrolling, keep the cursor 4 side



" DISPLAY

" Statusline
set statusline=%F  " Full path and file name.
set statusline+=%m " Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
set statusline+=%= " Separator between left and right alignmet
set statusline+=%l " Line number
set statusline+=/
set statusline+=%L " Lines in buffer
set statusline+=\ 
set statusline+=%y " Filetype
set statusline+=\ 
set statusline+=%k " Current keymap

set guioptions-=r                        " Remove left and right scrollbar
set guioptions-=R
set guioptions-=l
set guioptions-=L

set number                               " Display line numbers
set foldcolumn=0                         " No columns to show folds
set guifont=Source\ Code\ Pro\ Light:h16
set linespace=5 " More space between lines. Default=0
set cpoptions=|                          " | at end of changed (<c>) object
set linebreak                            " Soft-wrap between words
set autoindent
set listchars=tab:▸\ ,eol:¬,nbsp:_       " Representation of invisible characters with set list
set splitright                           " Open vsplit window to the right
set shortmess+=A                         " No swapfile exists warning
set expandtab                            " tab key inserts spaces. Needed for indentation with <
set shiftwidth=2                         " Length of tab-character for indention 4 spaces for markdown syntax
set spell                                " check spelling by default
set spelllang=en_us
set formatoptions=rj                     " r=automatically insert the current comment leader after hitting <Enter> in Insert mode.
                                         " j=Where it makes sense, remove a comment leader when joining lines.

" }}}1
"{{{1 General stuff

" Foldmethod for .vimrc
autocmd BufRead ~/.vimrc setlocal fdm=marker 

" Enter to run last macro
nnoremap <CR> @@

" Always use minimalist foldtext
autocmd BufEnter * set foldtext=getline(v:foldstart)
set fillchars=fold:\ "(there's a space after that \)

" Enable ALT-key in vim. (Only on Mac)
if has('macunix')
    set macmeta
endif

" Set wd for current file
autocmd BufEnter * silent! lcd %:p:h

" Read docx through pandoc
autocmd BufReadPost *.docx :%!pandoc -f docx -t markdown -S


" Different cursor shapes in Iterm2
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"{{{1 Plugin configs
"{{{2 vimtex 
" See ~/vim/after/syntax/tex.vim for disabling of spellcheck in rcode and

" Vimtex settings
let g:vimtex_complete_close_braces = 1


" From vimtex help
            let g:vimtex_view_general_viewer
                  \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
            let g:vimtex_view_general_options = '-r @line @pdf @tex'

            " This adds a callback hook that updates Skim after compilation
            let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
            function! UpdateSkim(status)
              if !a:status | return | endif

              let l:out = b:vimtex.out()
              let l:tex = expand('%:p')
              let l:cmd = [g:vimtex_view_general_viewer, '-r']
              if !empty(system('pgrep Skim'))
                call extend(l:cmd, ['-g'])
              endif
              if has('nvim')
                call jobstart(l:cmd + [line('.'), l:out, l:tex])
              elseif has('job')
                call job_start(l:cmd + [line('.'), l:out, l:tex])
              else
                call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
              endif
            endfunction

"  folding
let g:vimtex_fold_enabled=1
"{{{2 DiffChar
" Set wrap in diff
au FilterWritePre * if &diff | set wrap | endif

let g:DiffUpdate = 1
let g:DiffUnit = 'Word3'
let g:DiffModeSync = 1

" Reduce error reports
" autocmd InsertEnter * :RDCha
" autocmd InsertLeave * :TDCha
"{{{2 netrw
let g:netrw_banner=0 " supress banner
"{{{2 diminiactive
" The following drastically improves dimming over long wrapped lines.
" https://github.com/blueyed/vim-diminactive/issues/2
if exists('+colorcolumn')
    function! InactivateWindow(inactivate)
        if a:inactivate == 1
            " using 0 as the third parameter lets me still see Search'd patterns in inactive windows.
            let w:inactiveWindowMatchId = matchadd("ColorColumn", "\\%>0v", 0, 9999)
        else
            if exists("w:inactiveWindowMatchId")
                call matchdelete(w:inactiveWindowMatchId)
            endif
        endif
    endfunction
    augroup DimInactiveWindows
        au!
        "This highlights text beyond the 256 char mark, but it only changes the background of areas WITH text...
        au WinLeave * call InactivateWindow(1)
        au WinEnter * call InactivateWindow(0)
    augroup END
endif
"{{{2 csv

autocmd BufRead,BufEnter *.csv set filetype=csv
autocmd BufRead,BufEnter *.dat set filetype=csv

"{{{2 ctrlp
" Speed up with gipgrep
" https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " So quick that caching is not necessary
  let g:ctrlp_use_caching = 0

" leader find to fuzzy find from home directory
 
let g:ctrlp_follow_symlinks = 2 " follow symlinks
let g:ctrlp_show_hidden = 1 " seach for hidden files/dirs
let g:ctrlp_clear_cache_on_exit = 0 " save ctrlp chache between sessoins
let g:ctrlp_max_files = 0 " unlimited cashe

" Don't use ^ in regex here. Deosn't work
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v(Applications|Downloads|Library|Trash)$',
    \ }

" let g:ctrlp_show_hidden = 1 " include dotfiles in search

"{{{ Open non-text files in external program with '!open'
" https://github.com/kien/ctrlp.vim/issues/232
" ÖVERFET!!!!!

function! PdfOpenFunc(action, line)
  if fnamemodify(a:line, ':e') =~?
      \ '^\(rtf\|pdf\|ma4\|mp3\|mp4\|jpeg\|jpg\|png\|pptx\)\?$'
    " Get the filename
    let filename = fnameescape(fnamemodify(a:line, ':p'))

    call ctrlp#exit()

    " Open the file
    silent! execute '!open' filename

  " Open docx via pandoc

  elseif fnamemodify(a:line, ':e') =~?
      \ '^docx\?$'
    " Get the filename
    let filename = fnameescape(fnamemodify(a:line, ':p'))

    call ctrlp#exit()

    " Open the file
    silent! execute ' r!pandoc -t markdown -f docx' filename
    setlocal ft=markdown

  else



    " Not a HTML file, simulate pressing <c-o>r to replace current buffer
    call feedkeys("\<c-o>r")
  endif
endfunction

let g:ctrlp_open_func = { 'files': 'PdfOpenFunc' }

" }}}
" }}}2
"{{{2 gundo
" Soft wrap gundo preview
augroup MyGundo
    au!
    au BufWinEnter __Gundo_Preview__ :setl linebreak wrap
augroup end

" Wider gundo window
    let g:gundo_width = 60
" Auto-close gundo window on revert.
    let g:gundo_close_on_revert=1

"{{{2 vim-pandoc
" symlink ~/.vim/after/syntax/markdown.vim -> ~/.vim/bundle/vim-pandoc-syntsax/pandoc.vim
" to get pandoc syntax in markdown file type.

" Add .bib to completion
 let g:pandoc#biblio#bibs = ['/Users/xhalaa/mylatexstuff/bibliotek.bib']
 let g:pandoc#completion#bib#mode = 'fallback'
"{{{2 vim-markdown
" no mappings. We only want folding
let g:vim_markdown_no_default_key_mappings = 1

" Fold at the title line
let g:vim_markdown_folding_style_pythonic = 1

" list levels are indented by 2 space
let g:vim_markdown_new_list_item_indent = 2

" Highlighting for YAML header
let g:vim_markdown_frontmatter = 1

"{{{2 nvim-r
" Don't type <- with _
   let R_assign = 0
"}}}1
"{{{1 Display & Color

" colorscheme solarized
syntax on
colorscheme gruvbox " super sexy
set bg=dark " Dark background


" Italic comments.
highlight Comment cterm=italic

" No wiggly line in terminal 
if has('terminal')
  hi SpellBad cterm=underline
endif

" Override conceal applied by varies packages. No pseudo WYSYWYG here!
autocmd BufEnter * silent! set cole=0
"}}}1
"{{{1 Completion
" Use TAB for completions
inoremap <Tab> <c-n>
inoremap <S-Tab> <Tab>

"}}}1
"{{{1 Leader commands

" open ctrlp fuzzy file finder
nmap <Leader>f :CtrlP<Space>~/<CR>
" open netrw
nmap <Leader>x :Explore<cr>
" Window command prefix
nnoremap <Leader>w <C-w>
" Gundo toggle window
nnoremap <Leader>u :GundoToggle<CR>
" Execute last command
nnoremap <Leader>c :<Up><CR>
" Next item in location list window
nnoremap <Leader>nn :lne<CR>
" open vimrc
nnoremap <Leader>m :e $MYVIMRC<CR>
" toggle wrap
nnoremap <Leader>r :set wrap!<CR>


"{{{2 Markdown compilation  

"  to tex
autocmd Filetype markdown 
            \ nnoremap <Leader>pt :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % --pdf-engine=xelatex --biblatex --bibliography ~/mylatexstuff/bibliotek.bib -s -o '%'.tex<CR>

" to txt
autocmd Filetype markdown 
            \ nnoremap <Leader>px :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions %  --bibliography ~/mylatexstuff/bibliotek.bib -Ss -o '%'.txt<CR>

"  to pdf  
autocmd Filetype markdown 
            \ nnoremap <Leader>pp :w<CR>:cd %:p:h<CR>:!pandoc -f
            \ markdown+implicit_figures+table_captions+multiline_tables %
            \ --pdf-engine=xelatex
            \ --columns=200
            \ -N
            \ --bibliography ~/mylatexstuff/bibliotek.bib
            \ -smar -o '%'.pdf 
            \ && open '%'.pdf<CR>

"  to docx. -smart needed for parsing of daises in non TeX.
autocmd Filetype markdown
    \ nnoremap <Leader>pd :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % -smart --bibliography ~/mylatexstuff/bibliotek.bib -o '%'.docx<CR>

"  to beamer 
autocmd Filetype markdown
    \ nnoremap <Leader>pb :w<CR>:!pandoc -t beamer -f
    \ markdown+implicit_figures+table_captions %
    \ --pdf-engine=xelatex
    \ --bibliography ~/mylatexstuff/bibliotek.bib
    \ -smart -o '%'.pdf
    \ && open '%'.pdf<CR>

"  to html. -S needed for parsing of daises in non TeX.
autocmd Filetype markdown
    \ nnoremap <Leader>ph :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % -smart --bibliography ~/mylatexstuff/bibliotek.bib -o '%'.html<CR>



"{{{2 TeX compilation
" run xelatex and rename output to .tex.pdf 
autocmd Filetype tex
  \ nnoremap <Leader>pp  :w<CR>:cd %:p:h<CR>:! xelatex --aux-directory=~/latexaux --synctex=1 --src-specials %
  \ && mv '%<'.pdf '%<'.tex.pdf
  \ && open '%'.pdf<CR> 

" Bibtex run
" %< "gives current filename without extension
autocmd Filetype tex
  \ nnoremap <Leader>b :w<CR>:cd %:p:h<CR>:! biber %<<CR>
" OBS!!! Run
"      rm -rf `biber --cache`
" to fix bug crash bug.


"{{{2 Language switching

" Switch to Swedish typing
nnoremap <Leader>s :<C-U>call SweType()<CR>
" Switch to English typing
nnoremap <Leader>e :<C-U>call EngType()<CR>
" Switch to Arabic typing
nnoremap <Leader>a :<C-U>call AraType()<CR>


"  Switch to Swedish
function! SweType()
" To switch back from Arabic
  set keymap=swe-us "Modified keymap. File in .vim/keymap
  set norightleft
  set spelllang=sv
endfunction

" Switch to English
function! EngType()
" To switch back from Arabic
  set keymap=us-altlatin "Modified keymap. File in .vim/keymap
  set norightleft
  set spelllang=en_us
endfunction

" Switch to Arabic
function! AraType()
    set keymap=arabic-pc "Modified keymap. File in .vim/keymap
    set rightleft
endfunction

"{{{1 LaTeX mappings
" Mappings only used in .tex files 

autocmd Filetype tex call LaTeXmaps()

function! LaTeXmaps()

  " Input yanked rcode in comment.
  " Requires vim-latex-textobj plugin.
  nnoremap <Leader>rc i\begin{rcode}<CR>\end{rcode}<ESC>"0Pvae3>

  " get documentation for package under cursor
  nnoremap <leader>d :!texdoc . <cword><cr>

  " Key mapping to Tabularize LaTeX tabular
  " Tabularize by & unless escaped
  " Requires vimtex for `vie` operation  
  map <Leader>t vip:Tabularize /\\\@<!&<CR>

  " Tabularize gloss (by spaces)
  " map <Leader>tc vie:s/\v +/ /<CR>vie:Tabularize / <CR>

endfunction

" }}1
"{{{1 Markdown mappings and function
" Mappings only used in markdown files 


" Clearly highlight LaTeX if-stantements for use in documents with multiple
" output versions. 
autocmd Filetype markdown syn match Underlined "\v^\\(if\S+|else|fi)$"
autocmd Filetype markdown syn match Statement "\\[a-zA-Z]\+"
autocmd Filetype markdown syn match Constant "`[^`]\{-}`"

" Mappings
autocmd Filetype markdown call MarkdownMaps()

function! MarkdownMaps()

  " Do comments in Markdown as suggested here http://stackoverflow.com/a/20885980/3210474
  " No comment in HTML or TeX output.
  set commentstring=<!--%s-->

  " Let Tabularize do pipe tables 
  nnoremap <Leader>t vip:Tabularize /\|<CR>

  " Move section wise
  nnoremap ]] /^#<CR>
  nnoremap [[ ?^#<CR>

endfunction

" Folding
autocmd Filetype markdown call MarkdownLevel()
autocmd Filetype markdown setlocal foldexpr=MarkdownLevel()  
autocmd Filetype markdown setlocal foldmethod=expr    

function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction

" }}}1
"{{{1 Movement & Editing

" {{{2 Calculate equation
" http://vim.wikia.com/wiki/VimTip216

vnoremap <Leader>bc "ey:call CalcBC()<CR>
function! CalcBC()
  let has_equal = 0
  " remove newlines and trailing spaces
  let @e = substitute (@e, "\n", "", "g")
  let @e = substitute (@e, '\s*$', "", "g")
  " if we end with an equal, strip, and remember for output
  if @e =~ "=$"
    let @e = substitute (@e, '=$', "", "")
    let has_equal = 1
  endif
  " sub common func names for bc equivalent
  let @e = substitute (@e, '\csin\s*(', "s (", "")
  let @e = substitute (@e, '\ccos\s*(', "c (", "")
  let @e = substitute (@e, '\catan\s*(', "a (", "")
  let @e = substitute (@e, "\cln\s*(", "l (", "")
  " escape chars for shell
  let @e = escape (@e, '*()')
  " run bc, strip newline
  let answer = substitute (system ("echo " . @e . " \| bc -l"), "\n", "", "")
  " append answer or echo
  if has_equal == 1
    normal `>
    exec "normal a" . answer
  else
    echo "answer = " . answer
  endif
endfunction
" }}}2

" Make Y behave like D and C
nnoremap Y yg_

" Choose first word in spellinglist
nnoremap zz 1z=e

" Command to find and replace repeated word, word duplet or triplet.
command! DoubleWordsCorr %s/\v\c<(\w+(\s|\w)+(\s|\w)+)\s+\1>/\1/gc

" Back space to alternate buffer
nnoremap <BS> :b#<CR>

" Move visually on soft-wrapped lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj


" Move to win horizontally
nnoremap HH <C-w>h
nnoremap LL <C-w>l

" Set undo points at end of sentence.
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u

nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

"{{{2 CHARACTER INPUT

" increment numbers
noremap + <c-a>
noremap - <c-x>

" Angular brackets
"〈 U+2329
" 〉U+232A
inoremap <A-<> 〈
inoremap <A->> 〉

" Indent without leaving insert mode
inoremap >> <ESC>me>>`ella

" Like numpad
nnoremap <A-j> 1
nnoremap <A-k> 2
nnoremap <A-l> 3
nnoremap <A-u> 4
nnoremap <A-i> 5
nnoremap <A-o> 6
nnoremap <A-7> 7
nnoremap <A-8> 8
nnoremap <A-9> 9
" Alt-,
nnoremap ¬ 0

inoremap <A-j> 1
inoremap <A-k> 2
inoremap <A-l> 3
inoremap <A-u> 4
inoremap <A-i> 5
inoremap <A-o> 6
inoremap <A-7> 7
inoremap <A-8> 8
inoremap <A-9> 9
" Alt-,
inoremap ¬ 0


" Space to insert space character before
nnoremap <Space> i<Space><ESC>

" Abbreviations for common misspellings because I'm stupid.
iab tow two
iab teh the
iab Andras Andreas
iab ruel rule
iab ARabic Arabic
iab arabic Arabic
iab widht width
iab lenght length
iab fo of
iab ot to

" Remove word in input mode. Best mapping ever.
inoremap jj <Esc>ciw
" imap <BS><BS> <NOP> " To learn the above

" When inserting empty line, return to cursor position
" Note careful placement of nmap/nnoremap.
" Insert empty line above, repeatable
nnoremap <silent> <Plug>EmptyLineAbove meO<ESC>`e:call repeat#set("\<Plug>EmptyLineAbove")<CR>
nmap O<Esc> <Plug>EmptyLineAbove

" Insert empty line below, repeatable
nnoremap <silent> <Plug>EmptyLineBelow meo<ESC>`e:call repeat#set("\<Plug>EmptyLineBelow")<CR>
nmap o<Esc> <Plug>EmptyLineBelow

"{{{2 Delimiters
" Type delimiters in input withing them. The following space, comma or dot  makes it possible to write '{}' and keep typing
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap <lt>> <><Left>
inoremap ** **<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap '' ''<Left>

" Normal behaviour if folowed by space, enter, comma, full stop
inoremap {}<Space> {}<Space>
inoremap {}<CR> {}<CR>
inoremap {}, {},
inoremap {}. {}.

inoremap ()<Space> ()<Space>
inoremap ()<CR> ()<CR>
inoremap (), (),
inoremap (). ().
       
inoremap []<Space> []<Space>
inoremap []<CR> []<CR>
inoremap [], [],
inoremap []. [].

inoremap **<Space> **<Space>
inoremap **<CR> **<CR>
inoremap **, **,
inoremap **. **.

inoremap <><Space> <><Space>
inoremap <><CR> <><CR>
inoremap <>, <>,
inoremap <>. <>.

inoremap ""<Space> ""<Space>
inoremap ""<CR> ""<CR>
inoremap "", "",
inoremap "". "".

inoremap ''<Space> ''<Space>
inoremap ''<CR> ''<CR>
inoremap '', '',
inoremap ''. ''.



"{{{1 Readingnotes
" https://github.com/andreasmhallberg/readingnotes

" Don't fold 
autocmd BufRead ~/jobb/readingnotes/* setlocal nofoldenable
autocmd BufRead ~/jobb/readingnotes/* call EngType()

" Highligt page refs at end of line
autocmd BufRead ~/jobb/readingnotes/* syn match Constant " \d\+\(-\{1,2}\d\+\)\?$" containedin=ALL

" Filter location list to get one hit per file 
" https://vi.stackexchange.com/a/15171/3316

function! FilterLocList()
  let a=getloclist(0)
  let file={}
  let result=[]
  for entry in a
    if !has_key(file, entry.bufnr)
      call add(result, entry)
      let file[entry.bufnr]=1
    endif
  endfor
  if !empty(result)
    call setloclist(0, result, 'r')
  endif
endfu

com! -nargs=0 FilterLocList :call FilterLocList()
"}}}1
"{{{1 Mutt related
autocmd BufRead ~/.mutt/* setlocal filetype=muttrc
"}}}1
"{{{ Test
