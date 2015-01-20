execute pathogen#infect()


colorscheme solarized
syntax on
filetype plugin indent on
set nocompatible
"filetype plugin on
filetype indent on

" Soft-wrap on words
set linebreak

set formatoptions=rqj

" Enable ALT-key in vim
set macmeta

set spelllang=en_us

" Length of tab-character for indention
set shiftwidth=2

" -------- DISPLAY -------------------
" Display linennumbers
set number

" GUIFONTS
"set guifont=Letter\ Gothic:h14 
    " Nice and very bright but no arabic diacrtitics.
"set guifont=AnonymousPro:h14 
    " Brigh. No arabic diacrtitics.
"set guifont=Consolas:h14
    " Very nice, bright, and has arabic characters and italics.
set guifont=Source\ Code\ Pro:h14
   " Has various heavynesses byt no italics

set linespace=1
" Italic comments.
highlight Comment cterm=italic

" When scorlling, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=15

" $ at end of chnaged (<c>) object 
set cpoptions+=$

" Show as much as possible of a wrapped last line, not just '@'.

" ----- MOVEMENT ---------------
" backspace over everything in insert mode
set backspace=indent,eol,start 

" Move on soft-wrapped lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" Makes h and l and arrow keyes wrap to pre/next line.
set whichwrap+=<,>,h,l,[,]

" High-light search hits
"set hlsearch 
"Search while typing
set incsearch
" Ignore case when searching
set ignorecase
" Case-sensitive when upper case is used in search string
set smartcase

" Set undo points at end of sentence.
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u

" Command competion.
set wildmenu

" Mapping for file exploration
:nmap <F8> :Explore<CR>

" Mapping markdown syntax. For NvAlt editing.
map <Leader>m :set syntax=markdown<CR>

" ============= MARKDOWN LECTURE NOTES ====================
" Function and mappeing to compile lecturenotes in markdown to pdf via
" xelatex. Folder must cuntain lecturnotes.tex with preample and
" \input{notes.tex}

nmap <Leader>xn :cd %:p:h<CR>:!pandoc -o notes.tex %<CR>:!sed -i.bak 's/, center,/, left,/g' notes.tex<CR>:!xelatex lecturenotes.tex<CR>:!bibtex lecturenotes.tex<CR>:!xelatex lecturenotes.tex<CR>

" =========== CHARACTER INPUT ===============
" Space in nomral mode to inser one character
:nnoremap <Space> i_<EsC>r



" Remove word in input mode
:imap jj <Esc>dawa
" Disable  in insert mode to learn the new mapping.
:imap <BS> <BS>

" Insert empty line above
:nmap <C-O> O<Esc>j

" Insert empty line below
:nmap <C-o> o<Esc>k

" Enable Arabic transcription. (simulate Alt-Latin mapping)
inoremap <M-a>a ā
inoremap <M-a>A Ā
inoremap <M-a>i ī
inoremap <M-a>I Ī
inoremap <M-a>u ū
inoremap <M-a>U Ū
inoremap <M-a>ō ō
inoremap <M-a>Ō Ō 
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

inoremap <M-e> ´


" Switch to type Swedish
function SweType()
  inoremap ; ö
  inoremap : Ö
  inoremap [ å
  inoremap { Å
  inoremap ' ä
  inoremap " Ä
  inoremap <A-;> ;
  inoremap <A-:> :
  inoremap <A-'> '
  inoremap <A-"> "
  inoremap <A-[> [
  inoremap <A-{> {
  inoremap <A-]> ]
  inoremap <A-}> }
endfunction
nnoremap <Leader>s :<C-U>call SweType()<CR>


" Switch to type Swedish
function EngType()
  inoremap ; ;
  inoremap : :
  inoremap [ [
  inoremap { {
  inoremap ' '
  inoremap " "
endfunction
nnoremap <Leader>e :<C-U>call EngType()<CR>


" Replace with first suggestion when spellchekign
nnoremap ]z 1z=e
nnoremap ]zz 1z=]s

" Gundo toggle window
nnoremap <Leader>u :GundoToggle<CR>

" ============== lATEX ============= 
" No spell checking in comments.
let g:tex_comment_nospell= 1

" TeX quote marks for surrond plugin.
" E.g. "ysw-".
autocmd FileType tex let b:surround_45 = "``\r''"

" LaTeX mappings on words.
nnoremap <Leader>sc bi\textsc{ea}
nnoremap <Leader>it bi\textit{ea}
nnoremap <Leader>bf bi\textbf{ea}
nnoremap <Leader>em bi\emph{ea}
nnoremap <Leader>7 bi\7{ea}

" Input covington example fram.
nmap <Leader>ce i\beging{example} \label{ex:}<ESC>o\gll <ESC>o<ESC>o\glt `'<ESC>o\speaker{}{}<ESC>o\lineno{}<ESC>o\glend<ESC>o\end{example}<ESC>

" Input yanked rcode in comment
nmap <Leader>rc i\begin{comment}<CR>\end{comment}<ESC>"0P

" Compile with XeLaTeX with \lx
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=~/Desktop/latexaux --synctex=1 --src-specials --interaction=nonstopmode $*'

" Manual compilation
" 'cd'  is necessere to tell Vim to look in the actual directory of the file.
map <Leader>x :w<CR>:cd %:p:h<CR>:! xelatex -aux-directory=~/latexaux --synctex=1 --src-specials %<CR>
map <Leader>b :w<CR>:cd %:p:h<CR>:! bibtex %<<CR> " %< gives current filename without extension

"
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

let g:Tex_FoldedEnvironments= 'figure,table,nonfloattable,tikzpicture,comment'
" Do not fold part and chapter
let g:Tex_FoldedSections = 'section,subsection,paragraph'
" Do not fold items
let g:Tex_FoldedMisc = 'preamble,<<<'

" ================ Project specific for Case in spoken SA ==================
map <Leader>xc :w<CR>:cd %:p:h<CR>:! xelatex -aux-directory=~/latexaux --synctex=1 --src-specials ~/Desktop/bok/111.caseinspokenMSA.tex<CR>
map <Leader>bc :! bibtex ~/Desktop/bok/111.caseinspokenMSA.tex<<CR>
map <Leader>c :e ~/Desktop/bok/111.caseinspokenMSA.tex<CR>


" ============= R ======================
" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" Send to R from non R files
    map <F3> <C-C><ESC>:!start cmd /c clip2r.js<CR><CR>
    imap <F3> <ESC><C-C><ESC>:!start cmd /c clip2r.js<CR><CR>

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif

" Markdown folding for all R (and md) files.
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .* #{3,}$'
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
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr    
au BufEnter *.R setlocal foldexpr=MarkdownLevel()  
au BufEnter *.R setlocal foldmethod=expr    
