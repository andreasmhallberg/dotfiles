set nocompatible
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
"  }}}1
" {{{1 General stuff

" No wraparournd end of file in normal searches
set nowrapscan
" No high-light search hits
set nohlsearch 
"Search while typing
set incsearch
" Ignore case when searching
set ignorecase
" Case-sensitive when upper case is used in search string
set smartcase

" Use TAB for completions
inoremap <Tab> <c-n>
inoremap <S-Tab> <c-x><c-l>

" Load bib file to make cite keys available in autocompletion
bad ~/mylatexstuff/bibliotek.bib
 
" Show command completion alternatives
set wildmenu

" Set to auto read when a file is changed from the outside
set autoread

" Foldmethod for .vimrc
autocmd BufRead ~/.vimrc setlocal fdm=marker 

" Set wd for current file
autocmd BufEnter * silent! lcd %:p:h

filetype plugin on
filetype indent on

" Soft-wrap on words
set linebreak

set autoindent

" tab key inserts spaces
set expandtab
"
" Length of tab-character for indention
" 4 spaces for markdown syntax
set shiftwidth=4

set formatoptions=rj
" r    Automatically insert the current comment leader after hitting <Enter> in Insert mode.
" j    Where it makes sense, remove a comment leader when joining lines.

" Enable ALT-key in vim. (Only on Mac)
if has('macunix')
    set macmeta
endif

" Representation of invisible characters with set list
set listchars=tab:▸\ ,eol:¬

" Move to previous buffer
nnoremap ## :b#<CR>

" Open vsplit window to the right
set splitright

" No swapfile exists warning
set shortmess+=A

"{{{1 SPELLCHECK

set spell
set spelllang=en_us

" Choose first word in list
nmap zz 1z=e

" Command to find and replace repeated word, word duplet or triplet.
command! DoubleWordsCorr %s/\v\c<(\w+(\s|\w)+(\s|\w)+)\s+\1>/\1/gc


" LanguageTool
let g:languagetool_jar='/Applications/LanguageTool-3.6/languagetool-commandline.jar'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,'
    \ . 'COMMA_PARENTHESIS_WHITESPACE,CURRENCY'

"
"{{{1 DISPLAY -------------------
" Display line numbers
set number

" Override conceal applied by varies packages. No pseudo wysywyg here.
autocmd BufEnter * silent! set cole=0


"{{{2 syntax color
colorscheme solarized
" Visibiliyt of invisible chars set list. low|normal|high
let g:solarized_visibility= "medium"

syntax on

" Dark background
set bg=dark

" Remove left and right scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Italic comments.
highlight Comment cterm=italic
"}}}2

" Add a bit extra margin to the left
set foldcolumn=0

" GUIFONTS
"set guifont=Letter\ Gothic:h14 
    " Nice and very bright but no Arabic diacritics.
"set guifont=AnonymousPro:h14 
    " Brigh. No arabic diacritics.
" set guifont=Consolas:h14
    " Very nice and has Arabic characters and italics.
set guifont=Source\ Code\ Pro:h14
   " Has various heavynesses byt no italics
"set guifont=Ubuntu\ Mono:h15
   " Has bold and italics

set linespace=5

" When scorlling, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" | at end of chnaged (<c>) object 
set cpoptions+=|

" Show as much as possible of a wrapped last line, not just '@'.

" Soft wrap gundo preview
augroup MyGundo
    au!
    au BufWinEnter __Gundo_Preview__ :setl linebreak wrap
augroup end

" List characters opaque
let g:solarized_visibility='low'


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

"  to pdf  
autocmd Filetype pandoc 
            \ nmap <Leader>pp :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % --latex-engine=xelatex --bibliography ~/mylatexstuff/bibliotek.bib -N -S -o '%'.pdf 
            \ && open '%'.pdf<CR>

"  to docx. -S needed for parsing of daises in non TeX.
autocmd Filetype pandoc
    \ nmap <Leader>pd :w<CR>:cd %:p:h<CR>:!pandoc -f markdown+implicit_figures+table_captions % -S --bibliography ~/mylatexstuff/bibliotek.bib -o '%'.docx<CR>

"  to beamer 
autocmd Filetype pandoc
    \ nmap <Leader>pb :w<CR>:!pandoc -t beamer % --latex-engine=xelatex --bibliography ~/mylatexstuff/bibliotek.bib -S -o '%'.pdf && open '%'.pdf<CR>

" {{{2 TeX compilation
autocmd Filetype tex
  \ nmap <Leader>pp  :w<CR>:cd %:p:h<CR>:! xelatex --aux-directory=~/latexaux --synctex=1 --src-specials %
  \ && mv '%<'.pdf '%<'.tex.pdf
  \ && open '%'.pdf<CR> 

" Backwards compability for above
autocmd Filetype tex nmap <Leader>x <Leader>pp

" Bibtex run
" %< "gives current filename without extension
autocmd Filetype tex nmap <Leader>b :w<CR>:cd %:p:h<CR>:! biber %<<CR>
" OBS!!! Run
"      rm -rf `biber --cache`
" to fix bug crash bug.


" {{{2 Language switching
" Switch to Swedish typing
nmap <Leader>s :<C-U>call SweType()<CR>
" Switch to English typing
nmap <Leader>e :<C-U>call EngType()<CR>
" Switch to Arabic typing
nmap <Leader>a :<C-U>call AraType()<CR>

" {{{1 LaTeX mappings
" Mappings only used in .tex files 

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


  " Key mapping to Tabularize LaTeX tabular: Unescaped &
  " Tabularize by & unless escaped
  map <Leader>t mtvip:Tabularize /\\\@<!&<CR>`t
  " Tabularize gloss (by spaces)
  map <Leader>tc :'<,'>s/\v +/ /<CR>:'<,'>Tabularize / <CR>

endfunction

" }}1


" {{{1 Markdown mappings and function
" Mappings only used in markdown files 




autocmd Filetype mkd      call MarkdownMaps()
autocmd Filetype md       call MarkdownMaps()
autocmd Filetype md       call MarkdownMaps()
autocmd Filetype pandoc call MarkdownMaps()

function! MarkdownMaps()


    " Do comments in Markdown as suggested here http://stackoverflow.com/a/20885980/3210474
    " No comment in HTML or TeX output.
    set commentstring=[//]:\ #\ (%s)

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
" backspace over everything in insert mode
set backspace=indent,eol,start 



" Move on soft-wrapped lines
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


" {{{1 CHARACTER INPUT

" Space to insert one character before
nnoremap <Space> i<Space><ESC>


" abbreviation command for common misspellings
iabbrev tow two
iabbrev teh the 

" Remove word in input mode
" Must go through visual mode to get character under cursor. 
inoremap jj <Esc>ciw
imap <BS><BS> <NOP>

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

" Normal behaviour if folowed by space, enter, comma, full stop
inoremap {}<Space> {}<Space>
inoremap {}<CR> {}<CR>
inoremap {}, {},
inoremap {}. {}.

inoremap []<Space> []<Space>
inoremap []<CR> []<CR>
inoremap [], [],
inoremap []. [].

inoremap **<Space> **<Space>
inoremap **<CR> **<CR>
inoremap <>, <>,
inoremap <>. <>.

inoremap ""<Space> ""<Space>
inoremap ""<CR> ""<CR>
inoremap "", "",
inoremap "". "".


" {{{2 Enable Arabic transcription. (simulate Alt-Latin mapping)
inoremap <M-a>a ā
inoremap <M-a>A Ā
inoremap <M-.>b ḅ
inoremap <M-.>B Ḅ
inoremap <M-a>i ī
inoremap <M-a>I Ī
inoremap <M-a>u ū
inoremap <M-a>U Ū
inoremap <M-a>U Ū
inoremap <M-.>m ṃ
inoremap <M-.>M Ṃ
inoremap <M-a>O Ō 
inoremap <M-a>e ē
inoremap <M-a>E Ē
inoremap <M-p> ʿ
inoremap <M-P> ʾ
inoremap <M-.>d ḍ
inoremap <M-.>D Ḍ
inoremap <M-.>s ṣ
inoremap <M-.>S Ṣ
inoremap <M-.>t ṭ
inoremap <M-.>T Ṭ
inoremap <M-.>z ẓ
inoremap <M-.>Z Ẓ
inoremap <M-.>h ḥ
inoremap <M-.>H Ḥ
inoremap <M-w>g ġ
inoremap <M-w>G Ġ
inoremap <M-x>d ḏ
inoremap <M-x>D Ḏ
inoremap <M-x>t ṯ
inoremap <M-x>T Ṯ
inoremap <M-v>s š
inoremap <M-v>S Š

nmap r<M-a>a rā
nmap r<M-a>A rĀ
nmap r<M-a>i rī
nmap r<M-a>I rĪ
nmap r<M-a>u rū
nmap r<M-a>U rŪ
nmap r<M-a>ō rō
nmap r<M-a>Ō rŌ 
nmap r<M-a>e rē
nmap r<M-a>E rĒ
nmap r<M-p> rʿ
nmap r<M-P> rʾ
nmap r<M-.>d rḍ
nmap r<M-.>D rḌ
nmap r<M-.>s rṣ
nmap r<M-.>S rṢ
nmap r<M-.>t rṭ
nmap r<M-.>T rṬ
nmap r<M-.>z rẓ
nmap r<M-.>Z rẒ
nmap r<M-.>h rḥ
nmap r<M-.>H rḤ
nmap r<M-w>g rġ
nmap r<M-w>G rĠ
nmap r<M-x>d rḏ
nmap r<M-x>D rḎ
nmap r<M-x>t rṯ
nmap r<M-x>T rṮ
nmap r<M-v>s rš
nmap r<M-v>S rŠ

" EALLx
noremap <M-e> ´
noremap <M-w> ẇ
noremap <M-y> ẏ

" {{{2 Switch to Swedish
function! SweType()
" To switch back from Arabic
  set keymap=swe-us
  set norightleft
  set spelllang=sv
endfunction

"{{{2 Switch to English
function! EngType()
" To switch back from Arabic
  set keymap=
  set norightleft
  set spelllang=en_us
endfunction

" {{{2 Switch to Arabic
function! AraType()
    set keymap=arabic-pc "Modified keymap. File in .vim/keymap
    set rightleft
endfunction

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
"}}}1
" {{{ vim-pandoc
" No conceal
let g:pandoc#syntax#conceal#use=0

" File extension synonyms
autocmd BufEnter *.md :setlocal filetype=pandoc " vim-pandoc plugin
autocmd BufEnter *.mkd :setlocal filetype=pandoc " vim-pandoc plugin
autocmd BufEnter *.markdown :setlocal filetype=pandoc " vim-pandoc plugin

" }}}
