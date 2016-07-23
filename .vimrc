" {{{1 General stuff
call pathogen#infect()
call pathogen#helptags()

" Set to auto read when a file is changed from the outside
set autoread

" Foldmethod for .vimrc
autocmd BufRead ~/.vimrc setlocal fdm=marker 

" swapfiel location
set dir=~/temp

colorscheme solarized
" Visibiliyt of invisible chars set list. low|normal|high
"g:solarized_visibility= "low"
syntax on

"filetype plugin indent on " (Mosty annoying)
set nocompatible
filetype plugin on

" Soft-wrap on words
set linebreak

set autoindent

" tab key inserts spaces
set expandtab
" Length of tab-character for indention
" 2 spaces for markdown syntax
set shiftwidth=2
" Tab is 4 spaces in markdown
let ftToIgnore = ['markadown']
autocmd WinEnter,BufEnter * if index(ftToIgnore, &ft) < 0 
    \ | setlocal shiftwidth=4
    \ | endif


set formatoptions=rqj

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

"{{{1 SPELLCHECK

set spell
set spelllang=en_us

" Choose first word in list
nmap zz 1z=e

" LanguageTool
let g:languagetool_jar='/Applications/LanguageTool-3.1/languagetool-commandline.jar'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,'
    \ . 'COMMA_PARENTHESIS_WHITESPACE,CURRENCY'

"{{{1 DISPLAY -------------------
" Display linen numbers
set number

" Dark background
set bg=dark

" Remove left and right scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Add a bit extra margin to the left
set foldcolumn=2

" GUIFONTS
"set guifont=Letter\ Gothic:h14 
    " Nice and very bright but no arabic diacrtitics.
"set guifont=AnonymousPro:h14 
    " Brigh. No arabic diacrtitics.
" set guifont=Consolas:h12
    " Very nice and has arabic characters and italics.
set guifont=Source\ Code\ Pro:h14
   " Has various heavynesses byt no italics
"set guifont=Ubuntu\ Mono:h15
   " Has bold and italics

set linespace=5
" Italic comments.
highlight Comment cterm=italic

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
"nmap <Leader>xn :cd %:p:h<CR>:!pandoc -o notes.tex %<CR>:!sed -i.bak 's/, center,/, left,/g' notes.tex<CR>:!xelatex lecturenotes.tex<CR>:!bibtex lecturenotes.tex<CR>:!xelatex lecturenotes.tex<CR>

" Compile markdown to tex  
nmap <Leader>pt :w<CR>:cd %:p:h<CR>:!pandoc % -S --latex-engine=xelatex --biblatex --bibliography ~/mylatexstuff/bibliotek.bib -o test.tex
" Compile markdown to pdf  
nmap <Leader>pp :w<CR>:cd %:p:h<CR>:!pandoc % -S --latex-engine=xelatex --biblatex --bibliography ~/mylatexstuff/bibliotek.bib -o test.pdf

" Switch to Swedish typing
nmap <Leader>s :<C-U>call SweType()<CR>
" Switch to English typing
nmap <Leader>e :<C-U>call EngType()<CR>
" Switch to Arabic typing
nmap <Leader>a :<C-U>call AraType()<CR>

" {{{2 LaTeX mappings
function! LaTeXmaps()
nmap <Leader>sc <ESC>bi\textsc{<ESC>ea}<ESC>
nmap <Leader>it <ESC>bi\textit{<ESC>ea}<ESC>
nmap <Leader>bf <ESC>bi\textbf{<ESC>ea}<ESC>
nmap <Leader>em <ESC>bi\emph{<ESC>ea}<ESC>
nmap <Leader>ar <ESC>bi\textarabic{<ESC>ea}<ESC>
nmap <Leader>i "iyiwea\index{<ESC>pi}<ESC>

" Input covington example frame.
nmap <Leader>ce i\begin{example} \label{ex:}<ESC>o\gll <ESC>o<ESC>o\glt `'<ESC>o\speaker{}{}<ESC>o\lineno{}<ESC>o\glend<ESC>o\end{example}<ESC>

" Input yanked rcode in comment.
" Requires vim-latex-textobj plugin.
nmap <Leader>rc i\begin{rcode}<CR>\end{rcode}<ESC>"0Pvae3>


" LaTeX compilation and bibtex run
" Saves, sets ed and compiles
map <Leader>x :w<CR>:cd %:p:h<CR>:! xelatex --aux-directory=~/latexaux --synctex=1 --src-specials %<CR>
" Run biber. rm -rf `biber --cache` clears cash to fix bug.
map <Leader>b :w<CR>:cd %:p:h<CR>:! biber %<<CR>" %< gives current filename without extension


" Key mapping to Tabularize LaTeX tabular
map <Leader>t :<C-U>Tabularize /&<CR>
" Tabularize gloss
map <Leader>tc :'<,'>s/\v +/ /<CR>:'<,'>Tabularize / <CR>
endfunction
autocmd BufRead *.tex call LaTeXmaps()
" }}}2

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

" No high-light search hits
set nohlsearch 
"Search while typing
set incsearch
" Ignore case when searching
set ignorecase
" Case-sensitive when upper case is used in search string
set smartcase

" Move to win horizontally
nmap HH <C-w>h
nmap LL <C-w>l

" Set undo points at end of sentence.
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u

" Command completion.
set wildmenu


" Conceal what is to be concealed
set cole=2
" Also when cursor is on the line, in all the modes
set concealcursor=

" Wider gundo window
    let g:gundo_width = 60
" Auto-close gundo window on revert.
    let g:gundo_close_on_revert=1

nnoremap U :syntax sync fromstart<CR>:redraw!<CR>


" {{{1 CHARACTER INPUT

" Space to insert one character before
nnoremap <Space> :exec "normal i".nr2char(getchar())."\e"<CR>


" Command to find and replace repeated word or phrase.
command! DoubleWordsCorr %s/\v\c<(\w+(\s|\w)+)\s+\1>/\1/gc

" abbreviation command for common misspellings
iabbrev tow two
iabbrev teh the 

" Remove word in input mode
" Must go through visual mode to get character under cursor. 
inoremap jj <Esc>vbc
imap <BS><BS> <NOP>

" Type delimiters in input withing them. The following space, comma or dot  makes it possible to write '{}' and keep typing
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
" To keep typing after {}
inoremap {}<Space> {}<Space>
inoremap {}, {},
inoremap {}. {}.

" {{{2 Enable Arabic transcription. (simulate Alt-Latin mapping)
inoremap <M-a>a ā
inoremap <M-a>A Ā
inoremap <M-a>i ī
inoremap <M-a>I Ī
inoremap <M-a>u ū
inoremap <M-a>U Ū
inoremap <M-a>o ō
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
  set keymap=
  set norightleft
  set spelllang=sv
  inoremap ; ö
  noremap r; rö
  inoremap ;; ;
  nnoremap r;; r;
  inoremap : Ö
  nnoremap r: rÖ
  inoremap :: :
  nnoremap r:: r:
  inoremap [ å
  nnoremap r[ rå
  inoremap { Å
  nnoremap r{ rÅ
  inoremap ' ä
  nnoremap r' rä
  inoremap '' '
  nnoremap r'' r'
  inoremap " Ä
  nnoremap r" rÄ
  inoremap "" "
  nnoremap r"" r"
  inoremap [[ [
  nnoremap r[[ r[
  inoremap {{ {
  nnoremap r{{ r{
endfunction

"{{{2 Switch to English
function! EngType()
" To switch back from Arabic
  set keymap=
  set norightleft
  set spelllang=en_us
  inoremap ; ;
  unmap r;
  iunmap ;;
  unmap r;;
  inoremap : :
  unmap r:
  iunmap ::
  unmap r::
  inoremap [ [
  unmap r[
  iunmap [[
  unmap r[[
  inoremap { {
  unmap r{
  iunmap {{
  unmap r{{
  inoremap ' '
  unmap r'
  iunmap ''
  unmap r''
  inoremap " "
  unmap r"
  iunmap ""
  unmap r""
endfunction

" {{{ Switch to arabic
function! AraType()
set keymap=arabic
set rightleft
endfunction

" To switch back from Arabic
  set keymap=
"{{{1 LATEX 
" No spell checking in comments.
let g:tex_comment_nospell= 1

" Don't conceal TeX code
let g:tex_conceal=""
"
" See ~/vim/after/syntax/tex.vim for disabling of spellcheck in rcode and
" comment environments



"{{{2 settings fomr latex-suite
"View Pdf with
let g:Tex_ViewRule_pdf = 'Skim'

" Run compiler, bibtex etc. as many times as neede for pdf output
let g:Tex_MultipleCompileFormats = 'pdf'

" Disable annoying completions
let g:Imap_FreezeImap=1

let g:Tex_FoldedEnvironments= 'frame,rcode,figure,sidewaysfigure,table,sidewaystable,nonfloattable,tikzpicture,comment'

" Do not fold part and chapter
let g:Tex_FoldedSections = 'section,subsection,paragraph'

" Do not fold items
let g:Tex_FoldedMisc = 'preamble,<<<'
" }}}2
"{{{1 R

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif
"}}}1
" {{{1 MailApp

" Default 'from'
let MailApp_from = "Andreas Hallberg <andreas.hallberg@mellost.lu.se>"

" Add signature
nmap <Plug>AddMailSignature Go<CR><CR>Andreas Hallberg<CR><CR>Doktorand, semitiska spr<C-V>u00e5k<CR>SOL-centrum<CR>Lunds universitet<CR>Box 201, 221 00 Lund<CR><CR>Ph.D. student, Semitic languages<CR>Centre for Languages and Literature<CR>Lund University<CR>Box 201, 221 00 Lund<ESC>
nmap <Leader>si <Plug>AddMailSignature
