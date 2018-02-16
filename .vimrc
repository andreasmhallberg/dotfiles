set nocompatible " don't pretend to be VI
filetype plugin on
filetype indent on

" {{{1 Plugin management
 " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jalvesaq/Nvim-R'                       " Successor of R-vimplugin. Requires tmux.
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
" Plugin 'vim-pandoc/vim-pandoc'                 " needed for folding
" Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'vim-scripts/textutil.vim' " Use pandoc instead.
" Plugin 'chrisbra/csv.vim'                    " not very good. use sc-im in the Terminal instead.
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'                     " :Tabular command to align stuff
Plugin 'plasticboy/vim-markdown'                     " Markdown syntax and folding
Plugin 'lervag/vimtex'
Plugin 'vim-scripts/directionalWindowResizer'  " c-<hjkl> to resize window
" Plugin 'vim-scripts/LanguageTool' " Spell and grammar checking. Not very useful in files with markup.
Plugin 'qpkorr/vim-renamer'                    " Batch rename files vim-style.
Plugin 'kien/ctrlp.vim'                        " Fuzzy file finder.
Plugin 'vim-scripts/YankRing.vim'              " after ctrlp to remap <c-p>
Plugin 'blueyed/vim-diminactive'               " Dims window that is not in focus

" All of your Plugins must be added before the following line
call vundle#end()            " required


set grepprg=grep\ -lHn
" set grepprg+=internal

" {{{1 settings

set clipboard=unnamed                        " unnamed register and *-register are the same. Copy to system clipboard by default. 
set gdefault                                 " Flag g[lobal] as default on searches.
set nojoinspaces                             " Don't add extra space when joining lines with shift-J.
set laststatus=2                             " Always show statusline.
set directory=~/.vim/temp                    " Dir for backup files
set whichwrap+=<,>,h,l,[,]                   " Makes h and l and arrow keyes wrap to pre/next line.
set path+=**                                 " make file-based commans search in subfolders
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
set number                                    " Display line numbers
set foldcolumn=0                              " No columns to show folds
set guifont=Source\ Code\ Pro\ ExtraLight:h18
set linespace=5
set cpoptions=|                              " | at end of changed (<c>) object
set linebreak               " Soft-wrap between words
set autoindent
set listchars=tab:▸\ ,eol:¬,nbsp:_ " Representation of invisible characters with set list
set splitright              " Open vsplit window to the right
set shortmess+=A            " No swapfile exists warning
set expandtab               " tab key inserts spaces. Needed for indentation with <
set shiftwidth=2            " Length of tab-character for indention 4 spaces for markdown syntax
set spell                   " check spelling by default
set spelllang=en_us
set formatoptions=rj        " r=automatically insert the current comment leader after hitting <Enter> in Insert mode.
                            " j=Where it makes sense, remove a comment leader when joining lines.

" }}}1
" {{{1 General stuff


" Always use minimalist foldtext
autocmd BufEnter * set foldtext=getline(v:foldstart)
set fillchars=fold:\ "(there's a space after that \)

" Enable ALT-key in vim. (Only on Mac)
if has('macunix')
    set macmeta
endif

"{{{1 vim-markdown
" no mappings. We only want folding
let g:vim_markdown_no_default_key_mappings = 1

" Fold at the title line
let g:vim_markdown_folding_style_pythonic = 1

" list levels are indented by 2 space
let g:vim_markdown_new_list_item_indent = 2

"}}}1

" Foldmethod for .vimrc
autocmd BufRead ~/.vimrc setlocal fdm=marker 


" Set wd for current file
autocmd BufEnter * silent! lcd %:p:h
" netrw list style
" let g:netrw_liststyle=3 " tree style listing
let g:netrw_banner=0 " supress banner

" Read docx through pandoc
autocmd BufReadPost *.docx :%!pandoc -f docx -t markdown -S



"{{{2 display & color

" list characters
set lcs+=nbsp:_

colorscheme solarized

syntax on

set bg=dark " Dark background

" Remove left and right scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


" Italic comments.
highlight Comment cterm=italic
"}}}2

" No wiggly line in terminal 
if has('terminal')
  hi SpellBad cterm=underline
endif

nmap <Leader>f :CtrlP<Space>~/<CR>
nmap <Leader>x :Explore<cr>

" Regard markdown extension variants as pandoc
" autocmd Filetype mkd set ft=pandoc
" autocmd Filetype md  set ft=pandoc
" autocmd Filetype markdown  set ft=pandoc

" Vim Pandoc. Add .bib to completion
 let g:pandoc#biblio#bibs = ['/Users/xhalaa/mylatexstuff/bibliotek.bib']
 let g:pandoc#completion#bib#mode = 'fallback'


" Override conceal applied by varies packages. No pseudo wysywyg here!
autocmd BufEnter * silent! set cole=0



" Soft wrap gundo preview
augroup MyGundo
    au!
    au BufWinEnter __Gundo_Preview__ :setl linebreak wrap
augroup end

" List characters opaque
let g:solarized_visibility='low'

"{{{ completion
" Use TAB for completions
inoremap <Tab> <c-n>
inoremap <S-Tab> <Tab>

" set complete +=kspell " Complete from dictionary when spell is on. Mostly
" annoying. Technical words will be written more than once and that way added
" to completion list.


"}}}

" {{{1 Statusline
set statusline=%F " path and filename
set statusline+=%m " Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
set statusline+=%= " separator between left and right alignmet
set statusline+=%y
set statusline+=\ 
set statusline+=%k " current keymap
" }}}1
" {{{1 ctrlp
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

" {{{2 Open non-text files in external program with '!open'
" https://github.com/kien/ctrlp.vim/issues/232
" ÖVERFET!!!!!

function! PdfOpenFunc(action, line)
        if fnamemodify(a:line, ':e') =~?
              \ '^\(rtf\|pdf\|ma4\|mp3\|jpeg\|png\|pptx\)\?$'
            " Get the filename
            let filename = fnameescape(fnamemodify(a:line, ':p'))

            " Close CtrlP
            call ctrlp#exit()

            " Open the file
            silent! execute '!open' filename
        else
            " Not a HTML file, simulate pressing <c-o>r to replace current buffer
            call feedkeys("\<c-o>r")
        endif
endfunction

let g:ctrlp_open_func = { 'files': 'PdfOpenFunc' }

" }}}
" }}}1
" {{{1 Leader commands

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

" {{{2 Markdown compilation  

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
    \ --pdf-engine=pdflatex
    \ --bibliography ~/mylatexstuff/bibliotek.bib
    \ -smart -o '%'.pdf
    \ && open '%'.pdf<CR>

"  to html. -S needed for parsing of daises in non TeX.
autocmd Filetype markdown
    \ nnoremap <Leader>ph :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % -smart --bibliography ~/mylatexstuff/bibliotek.bib -o '%'.html<CR>



" {{{2 TeX compilation
autocmd Filetype tex
  \ nnoremap <Leader>pp  :w<CR>:cd %:p:h<CR>:! xelatex --aux-directory=~/latexaux --synctex=1 --src-specials %
  \ && mv '%<'.pdf '%<'.tex.pdf
  \ && open '%'.pdf<CR> 

" Bibtex run
" %< "gives current filename without extension
autocmd Filetype tex nnoremap <Leader>b :w<CR>:cd %:p:h<CR>:! biber %<<CR>
" OBS!!! Run
"      rm -rf `biber --cache`
" to fix bug crash bug.


" {{{2 Language switching
"
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

" {{{1 LaTeX mappings
" Mappings only used in .tex files 

autocmd Filetype tex call LaTeXmaps()

function! LaTeXmaps()

  nnoremap <Leader>sc <ESC>bi\textsc<ESC>lyse}e
  nnoremap <Leader>ar <ESC>bi\textarabic<ESC>lyse}e
  nnoremap <Leader>it <ESC>bi\textit<ESC>lyse}e
  nnoremap <Leader>bf <ESC>bi\textbf<ESC>lyse}e
  nnoremap <Leader>em <ESC>bi\emph<ESC>lyse}e
  nnoremap <Leader>ar <ESC>bi\textarabic<ESC>lyse}e
  nnoremap <Leader>i "iyiwea\index<ESC>lyse}e

  " Input covington example frame.
  nnoremap <Leader>ce i\begin{example} \label{ex:}<ESC>o\gll <ESC>o<ESC>o\glt `'<ESC>o\speaker{}{}<ESC>o\lineno{}<ESC>o\glend<ESC>o\end{example}<ESC>

  " Input yanked rcode in comment.
  " Requires vim-latex-textobj plugin.
  nnoremap <Leader>rc i\begin{rcode}<CR>\end{rcode}<ESC>"0Pvae3>


  " Key mapping to Tabularize LaTeX tabular
  " Tabularize by & unless escaped
  " Requires vimtex for `vie` operation  
  map <Leader>t vip:Tabularize /\\\@<!&<CR>

  " Tabularize gloss (by spaces)
  map <Leader>tc vie:s/\v +/ /<CR>vie:Tabularize / <CR>

endfunction

" }}1
" {{{1 Markdown mappings and function
" Mappings only used in markdown files 

autocmd Filetype pandoc call MarkdownMaps()

function! MarkdownMaps()


    " Do comments in Markdown as suggested here http://stackoverflow.com/a/20885980/3210474
    " No comment in HTML or TeX output.
    set commentstring=<!--%s-->

    " Let Tabularize do pipe tables 
    nnoremap <Leader>t vip:Tabularize /\|<CR>

endfunction
" }}}1
" {{{1 DiffChar
" Set wrap in diff
au FilterWritePre * if &diff | set wrap | endif

let g:DiffUpdate = 1
let g:DiffUnit = 'Word3'
let g:DiffModeSync = 1

" Reduce error reports
" autocmd InsertEnter * :RDCha
" autocmd InsertLeave * :TDCha

" }}}
" {{{1 MOVEMENT & EDITING

nnoremap Y yg_

" Choose first word in spellinglist
nnoremap zz 1z=e

" Command to find and replace repeated word, word duplet or triplet.
command! DoubleWordsCorr %s/\v\c<(\w+(\s|\w)+(\s|\w)+)\s+\1>/\1/gc
" Move to previous buffer

nnoremap ## :b#<CR>
 

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

" gundo plugin
" Wider gundo window
    let g:gundo_width = 60
" Auto-close gundo window on revert.
    let g:gundo_close_on_revert=1

nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

" {{{2 CHARACTER INPUT

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

imap <A-j> 1
imap <A-k> 2
imap <A-l> 3
imap <A-u> 4
imap <A-i> 5
imap <A-o> 6
imap <A-7> 7
imap <A-8> 8
imap <A-9> 9
" Alt-,
imap ¬ 0

 
" Space to insert space character before
nnoremap <Space> i<Space><ESC>

" abbreviation command for common misspellings
ab tow two
ab teh the
ab Andras Andreas
ab ruel rule
ab ARabic Arabic
ab arabic Arabic


" Remove word in input mode. Best mapping ever.
inoremap jj <Esc>ciw
" imap <BS><BS> <NOP> " to train above

" When inserting empty line, return to cursor position
nnoremap <silent> <Plug>EmptyLineAbove meO<ESC>`e:call repeat#set("\<Plug>EmptyLineAbove")<CR>
nmap O<Esc> <Plug>EmptyLineAbove

" Insert empty line below, repeatable
nnoremap <silent> <Plug>EmptyLineBelow meo<ESC>`e:call repeat#set("\<Plug>EmptyLineBelow")<CR>
nmap o<Esc> <Plug>EmptyLineBelow

" {{{2 Delimiters

" Type delimiters in input withing them. The following space, comma or dot  makes it possible to write '{}' and keep typing
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap ** **<Left>
inoremap **** ****<Left><Left>
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


"{{{1 LATEX 
"
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

" vimtex folding
let g:vimtex_fold_enabled=1

"{{{1 Reading notes

" Don't fold 
autocmd BufRead ~/jobb/readingnotes/* setlocal nofoldenable

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
