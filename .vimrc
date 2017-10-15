set nocompatible " don't pretend to be VI
filetype plugin on
filetype indent on
" {{{1 Plugin management
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jalvesaq/Nvim-R' " Successor of R-vimplugin. Requires tmux.
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-scripts/textutil.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'lervag/vimtex'
Plugin 'vim-scripts/directionalWindowResizer'
Plugin 'vim-scripts/LanguageTool'
Plugin 'qpkorr/vim-renamer'
Plugin 'thinca/vim-fontzoom'
Plugin 'kien/ctrlp.vim'
Plugin 'blueyed/vim-diminactive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" {{{1 General stuff

" Enable ALT-key in vim. (Only on Mac)
if has('macunix')
    set macmeta
endif

" Mapping to invoce ctrlp fuzzy file finder
let g:ctrlp_map = '<Leader>f'

" Foldmethod for .vimrc
autocmd BufRead ~/.vimrc setlocal fdm=marker 

" Set wd for current file
autocmd BufEnter * silent! lcd %:p:h
" netrw list style
" let g:netrw_liststyle=3 " tree style listing
let g:netrw_banner=0 " supress banner

                                             " {{{1 settings
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
" set termguicolors                            " 24-bit colors in terminal  



" DISPLAY
set number                                    " Display line numbers
set foldcolumn=0                              " No columns to show folds
set guifont=Source\ Code\ Pro\ ExtraLight:h16
set linespace=5
set scrolloff=4                               " When scrolling, keep the cursor 8 lines from the top and 8 lines from the bottom
set cpoptions+=|                              " | at end of changed (<c>) object


set linebreak               " Soft-wrap between words
set autoindent
set listchars=tab:▸\ ,eol:¬ " Representation of invisible characters with set list
set splitright              " Open vsplit window to the right
set shortmess+=A            " No swapfile exists warning
set expandtab               " tab key inserts spaces
set shiftwidth=4            " Length of tab-character for indention 4 spaces for markdown syntax
set spell                   " check spelling by default
set spelllang=en_us
set formatoptions=rj        " r=automatically insert the current comment leader after hitting <Enter> in Insert mode.
                            " j=Where it makes sense, remove a comment leader when joining lines.





" Regard markdown extension variants as pandoc
autocmd Filetype mkd set ft=pandoc
autocmd Filetype md  set ft=pandoc
autocmd Filetype markdown  set ft=pandoc

" Vim Pandoc. Add .bib to completion
 let g:pandoc#biblio#bibs = ['/Users/xhalaa/mylatexstuff/bibliotek.bib']
 let g:pandoc#completion#bib#mode = 'fallback'




" LanguageTool
let g:languagetool_jar='/Applications/LanguageTool-3.6/languagetool-commandline.jar'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,'
    \ . 'COMMA_PARENTHESIS_WHITESPACE,CURRENCY'

"

" Override conceal applied by varies packages. No pseudo wysywyg here.
autocmd BufEnter * silent! set cole=0


"{{{2 syntax color
colorscheme solarized

" Visibility of invisible chars set list. low|normal|high
let g:solarized_visibility= "medium"

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
set statusline=%f " filenamre relative to current folder
set statusline+=%=  " separator between left and right alignmet
set statusline+=%k " current keymap
" }}}1
" {{{1 Leader commands

" Window command prefix
nmap <Leader>w <C-w>
" Gundo toggle window
nnoremap <Leader>u :GundoToggle<CR>
" Execute last command
nmap <Leader>c :<Up><CR>
" Next item in location list window
nmap <Leader>nn :lne<CR>

" {{{2 Markdown compilation  

"  to tex
autocmd Filetype pandoc 
            \ nmap <Leader>pt :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % --latex-engine=xelatex --biblatex --bibliography ~/mylatexstuff/bibliotek.bib -s -o '%'.tex<CR>

" to txt
autocmd Filetype pandoc 
            \ nmap <Leader>px :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions %  --bibliography ~/mylatexstuff/bibliotek.bib -Ss -o '%'.txt<CR>

"  to pdf  
autocmd Filetype pandoc 
            \ nmap <Leader>pp :w<CR>:cd %:p:h<CR>:!pandoc -f
            \ markdown+implicit_figures+table_captions %
            \ --latex-engine=xelatex
            \ --columns=200
            \ --bibliography ~/mylatexstuff/bibliotek.bib
            \ -N -S -o '%'.pdf 
            \ && open '%'.pdf<CR>

"  to docx. -S needed for parsing of daises in non TeX.
autocmd Filetype pandoc
    \ nmap <Leader>pd :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % -S --bibliography ~/mylatexstuff/bibliotek.bib -o '%'.docx<CR>

"  to beamer 
autocmd Filetype pandoc
    \ nmap <Leader>pb :w<CR>:!pandoc -t beamer -f
    \ markdown+implicit_figures+table_captions %
    \ --latex-engine=xelatex
    \ --bibliography ~/mylatexstuff/bibliotek.bib
    \ -S -o '%'.pdf
    \ && open '%'.pdf<CR>

" {{{2 TeX compilation
autocmd Filetype tex
  \ nmap <Leader>pp  :w<CR>:cd %:p:h<CR>:! xelatex --aux-directory=~/latexaux --synctex=1 --src-specials %
  \ && mv '%<'.pdf '%<'.tex.pdf
  \ && open '%'.pdf<CR> 

" Bibtex run
" %< "gives current filename without extension
autocmd Filetype tex nmap <Leader>b :w<CR>:cd %:p:h<CR>:! biber %<<CR>
" OBS!!! Run
"      rm -rf `biber --cache`
" to fix bug crash bug.


" {{{2 Language switching
"
" Switch to Swedish typing
nmap <Leader>s :<C-U>call SweType()<CR>
" Switch to English typing
nmap <Leader>e :<C-U>call EngType()<CR>
" Switch to Arabic typing
nmap <Leader>a :<C-U>call AraType()<CR>


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

" run last command
nnoremap <CR> @:

autocmd Filetype tex call LaTeXmaps()

function! LaTeXmaps()

  nmap <Leader>sc <ESC>bi\textsc<ESC>lyse}e
  nmap <Leader>ar <ESC>bi\textarabic<ESC>lyse}e
  nmap <Leader>it <ESC>bi\textit<ESC>lyse}e
  nmap <Leader>bf <ESC>bi\textbf<ESC>lyse}e
  nmap <Leader>em <ESC>bi\emph<ESC>lyse}e
  nmap <Leader>ar <ESC>bi\textarabic<ESC>lyse}e
  nmap <Leader>i "iyiwea\index<ESC>lyse}e

  " Input covington example frame.
  nmap <Leader>ce i\begin{example} \label{ex:}<ESC>o\gll <ESC>o<ESC>o\glt `'<ESC>o\speaker{}{}<ESC>o\lineno{}<ESC>o\glend<ESC>o\end{example}<ESC>

  " Input yanked rcode in comment.
  " Requires vim-latex-textobj plugin.
  nmap <Leader>rc i\begin{rcode}<CR>\end{rcode}<ESC>"0Pvae3>


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
" {{{1 MOVEMENT & EDITING ---------------



" Choose first word in spellinglist
nmap zz 1z=e

" Command to find and replace repeated word, word duplet or triplet.
command! DoubleWordsCorr %s/\v\c<(\w+(\s|\w)+(\s|\w)+)\s+\1>/\1/gc
" Move to previous buffer

nnoremap ## :b#<CR>

" Move visually on soft-wrapped lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" Makes h and l and arrow keyes wrap to pre/next line.
set whichwrap+=<,>,h,l,[,]

" Move to win horizontally
nmap HH <C-w>h
nmap LL <C-w>l

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

" Space to insert space character before
nnoremap <Space> i<Space><ESC>

" abbreviation command for common misspellings
iabbrev tow two
iabbrev teh the 
iabbrev Andras Andreas

" Remove word in input mode. Best mapping ever.
inoremap jj <Esc>ciw
" imap <BS><BS> <NOP> " to train above

" When inserting empty line, return to cursor position
nnoremap <silent> <Plug>EmptyLineAbove meO<ESC>`e:call repeat#set("\<Plug>EmptyLineAbove")<CR>
nmap O<ESC> <Plug>EmptyLineAbove

" Insert empty line below, repeatable
nnoremap <silent> <Plug>EmptyLineBelow meo<ESC>`e:call repeat#set("\<Plug>EmptyLineBelow")<CR>
nmap o<ESC> <Plug>EmptyLineBelow

" {{{2 Delimiters

" Type delimiters in input withing them. The following space, comma or dot  makes it possible to write '{}' and keep typing
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap ** **<Left>
inoremap "" ""<Left>
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

"{{{1 R

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif


