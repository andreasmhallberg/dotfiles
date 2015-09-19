" {{{1 General stuff
call pathogen#infect()
call pathogen#helptags()

" Foldmethod for .vimrc
autocmd BufRead ~/.vimrc setlocal fdm=marker 

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
" Length of tab-character for indention
" 4 spaces for markdown syntax
set shiftwidth=4

" Automatically write buffer when switching to another
set autowriteall

set formatoptions=rqj

" Enable ALT-key in vim
set macmeta

" Remove left and right scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Representation of invisible characters with set list
set listchars=tab:▸\ ,eol:¬

"{{{1 SPELLCHECK

set spell
set spelllang=en_us

" Choose first word in list
nmap zz 1z=e

" Alert for repeated word
syn match SpellBad /\c\v<(\w+)\s+\1>/



"{{{1 DISPLAY -------------------
" Display linennumbers
" set number

" GUIFONTS
"set guifont=Letter\ Gothic:h14 
    " Nice and very bright but no arabic diacrtitics.
"set guifont=AnonymousPro:h14 
    " Brigh. No arabic diacrtitics.
set guifont=Consolas:h14
    " Very nice and has arabic characters and italics.
"set guifont=Source\ Code\ Pro:h14
   " Has various heavynesses byt no italics
"set guifont=Ubuntu\ Mono:h15
   " Has bold and italics

set linespace=5
" Italic comments.
highlight Comment cterm=italic

" When scorlling, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=15

" $ at end of chnaged (<c>) object 
set cpoptions+=$

" Show as much as possible of a wrapped last line, not just '@'.

" {{{1 MOVEMENT & EDITING ---------------
" Remmao window prefix
nmap <Leader>w <C-w>

" Capital movement for horizontal window switch
nnoremap H <C-W>h
nnoremap L <C-W>l

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

" Always use very magic regex
nnoremap / /\v
vnoremap / /\v

" Always search globally, i.e. on whole line
set gdefault

" Set undo points at end of sentence.
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u

" Command completion.
set wildmenu

" Mapping for file exploration
:nmap <F8> :Explore<CR>

" Next item in location list window
nmap <Leader>nn :lne<CR>

" Conceal what is to be concealed
set cole=2
" Also when cursor is on the line, in all the modes
set concealcursor=


" {{{1  MARKDOWN & LECTURE NOTES
" Function and mappeing to compile lecturenotes in markdown to pdf via
" xelatex. Folder must cuntain lecturnotes.tex with preample and
" \input{notes.tex}

"nmap <Leader>xn :cd %:p:h<CR>:!pandoc -o notes.tex %<CR>:!sed -i.bak 's/, center,/, left,/g' notes.tex<CR>:!xelatex lecturenotes.tex<CR>:!bibtex lecturenotes.tex<CR>:!xelatex lecturenotes.tex<CR>

nmap <Leader>n :w<CR>:!pandoc -o lecturenotes.pdf --latex-engine=xelatex --number-sections -H toheader.tex %<CR>

" {{{1 CHARACTER INPUT

" abbrevation command for common misspellings
iab tow two

" Disable repeated use of backspace. Use instead movements jj.
inoremap <BS><BS> <NOP>

" Remove word in input mode
inoremap jj <Esc>vbc

nnoremap == i==========<Esc>

" Type delimiters in input withing them. The following space, comma or dot  makes it possible to write '{}' and keep tuping
imap {} {}<ESC>i
imap {}<Space> {}<Space>
imap {}, {},
imap {}. {}.

imap () ()<ESC>i

imap [] []<ESC>i


" Enable Arabic transcription. (simulate Alt-Latin mapping)
inoremap <M-a>a ā
inoremap <M-a>A Ā
inoremap <M-a>i ī
inoremap <M-a>I Ī
inoremap <M-a>u ū
inoremap <M-a>U Ū
inoremap <M-a>ō ō
inoremap M-a>Ō Ō 
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

" EALLx
noremap <M-e> ´
noremap <M-w> ẇ
noremap <M-y> ẏ


" Switch to Swedish
function! SweType()
  set spelllang=sv
  inoremap ; ö
  inoremap ;; ;
  inoremap : Ö
  inoremap :: :
  inoremap [ å
  inoremap { Å
  inoremap ' ä
  inoremap '' '
  inoremap " Ä
  inoremap "" "
  inoremap [[ [
  inoremap {{ {
endfunction
nmap <Leader>s :<C-U>call SweType()<CR>


" Switch to English
function! EngType()
  set spelllang=en_us
  inoremap ; ;
  iunmap ;;
  inoremap : :
  iunmap ::
  inoremap [ [
  iunmap [[
  inoremap { {
  iunmap {{
  inoremap ' '
  iunmap ''
  inoremap " "
  iunmap ""
endfunction
nmap <Leader>e :<C-U>call EngType()<CR>


" Gundo toggle window
nnoremap <Leader>u :GundoToggle<CR>

"{{{1 LATEX 
" No spell checking in comments.
let g:tex_comment_nospell= 1

" Don't conceal TeX code
let g:tex_conceal=""

" See ~/vim/after/syntax/tex.vim for disabling of spellcheck in rcode and
" comment environments

" TeX quote marks for surrond plugin.
" E.g. ysw-
autocmd FileType tex let b:surround_45 = "``\r''"

" LaTeX mappings on words.
function! LaTeXmaps()
nmap <Leader>sc <ESC>bi\textsc{ea}
nmap <Leader>it <ESC>bi\textit{ea}
nmap <Leader>bf <ESC>bi\textbf{ea}
nmap <Leader>em <ESC>bi\emph{ea}
nmap <Leader>ar <ESC>bi\textarabic{ea}
nmap <Leader>7  <ESC>bi\7{ea}
nmap <Leader>6  <ESC>bi\6{ea}
nmap <Leader>5  <ESC>bi\5{ea}
nmap <Leader>i  <ESC>bi\widx{ea}
endfunction
autocmd BufRead *.tex call LaTeXmaps()

" Input covington example frame.
nmap <Leader>ce i\begin{example} \label{ex:}<ESC>o\gll <ESC>o<ESC>o\glt `'<ESC>o\speaker{}{}<ESC>o\lineno{}<ESC>o\glend<ESC>o\end{example}<ESC>

" Input yanked rcode in comment.
" Requires vim-latex-textobj plugin.
nmap <Leader>rc i\begin{rcode}<CR>\end{rcode}<ESC>"0Pvae3>

" Compile with XeLaTeX with \lx
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=~/Desktop/latexaux --synctex=1 --src-specials --interaction=nonstopmode $*'

" LaTeX compilation and bibtex run
" Saves, sets ed and compiles
map <Leader>x :w<CR>:cd %:p:h<CR>:! xelatex -aux-directory=~/latexaux --synctex=1 --src-specials %<CR>
" Run biber. rm -rf `biber --cache` clears cash to fix bug.
map <Leader>b :w<CR>:cd %:p:h<CR>:! biber %<<CR>" %< gives current filename without extension


" Key mapping to Tabularize LaTeX tabular
map <Leader>t :<C-U>Tabularize /&<CR>
" Do not go to location of first warning when compiling
let g:Tex_GotoError=0

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

"{{{1 Project specific for Case in spoken SA 
map <Leader>xc :w<CR>:cd ~/Desktop/bok/<CR>:! xelatex -aux-directory=~/Desktop/bok/latexaux --synctex=1 --src-specials ~/Desktop/bok/111.caseinspokenMSA.tex<CR>
map <Leader>bc :! biber ~/Desktop/bok/111.caseinspokenMSA.tex<<CR>
map <Leader>c :e ~/Desktop/bok/111.caseinspokenMSA.tex<CR>:cd ~/Desktop/bok/<CR>:arg *.tex<CR>:setlocal fdm=marker<CR>

autocmd BufRead ~/Desktop/bok/111.caseinspokenMSA.tex setlocal fdm=marker 

"{{{1 R

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif
"}}}1
" {{{1 MailApp
" Tell MailApp where to look for bundle file

" Default 'from'
let MailApp_from = "Andreas Hallberg <andreas.hallberg@mellost.lu.se>"

" Add signature
nmap <Plug>AddMailSignature Go<CR><CR>Andreas Hallberg<CR><CR>Doktorand, semitiska spr<C-V>u00e5k<CR>SOL-centrum<CR>Lunds universitet<CR>Box 201, 221 00 Lund<CR><CR>Ph.D. student, Semitic languages<CR>Centre for Languages and Literature<CR>Lund University<CR>Box 201, 221 00 Lund<ESC>
nmap <Leader>si <Plug>AddMailSignature
