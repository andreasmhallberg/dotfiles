set nocompatible " don't pretend to be VI
filetype plugin on
filetype indent on
"{{{1 Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'milkypostman/vim-togglelist'             "  toggle quickfix and location list on and off. \q and \l
Plugin 'muttaliasescomplete.vim'                 "  autocompletion of mutts addressbook. ~/.mutt/aliases as default
Plugin 'junegunn/goyo.vim'
Plugin 'skywind3000/asyncrun.vim'                "  syntax highlighting for CHAT-transcriptions
Plugin 'klapheke/vim-chat'                       "  syntax highlighting for CHAT-transcriptions
Plugin 'morhetz/gruvbox'                         "  colorsheme
" Plugin 'vim-syntastic/syntastic'                 "  syntax checker. Used for TeX and R
Plugin 'jalvesaq/Nvim-R'                         "  Successor of R-vimplugin. Requires tmux.
Plugin 'tpope/vim-surround'                      "  Useful mappings for netrw
Plugin 'tpope/vim-commentary'                    "  gc<movement> to comment
Plugin 'tpope/vim-repeat'                        "  make mappings repeatable
Plugin 'tpope/vim-vinegar'
Plugin 'vim-pandoc/vim-pandoc-syntax'            "  good syntax, nested HTML, yaml, etc.
Plugin 'chrisbra/csv.vim'                        "  use sc-im for ascii stuff. Better.
Plugin 'sjl/gundo.vim'                           "  visual undo tree
Plugin 'godlygeek/tabular'                       "  :Tabular command to align stuff
Plugin 'lervag/vimtex'                           "  tex stuff
Plugin 'jiangmiao/auto-pairs'
" Plugin 'vim-scripts/directionalWindowResizer'  "  c-<hjkl> to resize window
" Plugin 'vim-scripts/LanguageTool'              "  Spell and grammar checking. Not very useful in files with markup.
Plugin 'qpkorr/vim-renamer'                      "  Batch rename files vim-style.
" Plugin 'kien/ctrlp.vim'                        "  Fuzzy file finder. Replaced by fzf
Plugin 'vim-scripts/YankRing.vim'                "  After ctrlp to remap <c-p>
Plugin 'blueyed/vim-diminactive'                 "  Dims window that is not in focus
" Plugin 'TaDaa/vimade'
" Plugin 'rickhowe/diffchar.vim'

" All Plugins must be added before the following line
call vundle#end()            " required
"{{{1 Settings

set clipboard=unnamed                        " unnamed register and *-register are the same. Copy to system clipboard by default. 
" set gdefault                               " Flag g[lobal] as default on searches. Good in theory but mostly confusing.
set nojoinspaces                             " Don't add extra space when joining lines with shift-J.
set laststatus=2                             " Always show statusline.
set directory=~/.vim/temp                    " Dir for backup files
set whichwrap+=<,>,h,l,[,]                   " Makes h and l and arrow keys wrap to pre/next line.
set path+=**                                 " make file-based commands search in subfolders
" set complete +=kspell                      " Complete from dictionary when spell is on. Mostly annoying. Technical words will be written more than once and that way added to completion list.
set belloff=all                              " turn off all warnings bells
set keymap=us-altlatin                       " Load US-alt-latin keymap. See ~/dotfiles
set spell                                 "  check spelling by default
set spelllang=en_us
set nowrapscan                               " No wraparound end of file in normal searches
set nohlsearch                               " No high-light search hits
set incsearch                                " Search while typing
set ignorecase                               " Ignore case when searching
set smartcase                                " Case-sensitive when upper case is used in search string
set complete +=s~/mylatexstuff/bibliotek.bib " Load bibtex dumpfile to completion files
set complete +=s~/.mutt/aliases.jobb         " Load bibtex dumpfile to completion files
set wildmenu                                 " Show command completion alternatives
set autoread                                 " autoread when a file is changed from the outside
" set backspace=indent,eol,start             " backspace over everything in insert mode
set hidden                                   " Allow unsaved buffers to be hidden.
set virtualedit=block                        " Allow block selection over empty lines.
if has("gui_running" )
  set termguicolors                          " 24-bit colors in terminal
endif
set scrolloff=10                              " When scrolling, keep the cursor 4 lines from the top/bottom
set sidescrolloff=4                          " When scrolling, keep the cursor 4 side
set display+=lastline                        " Display as much as possible of last line rather than @s



" DISPLAY


set guicursor=a:blinkoff0  "  Make the cursor not blink
" Statusline
set statusline=%F          "  Full path and file name.
set statusline+=%m         "  Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
set statusline+=%=         "  Separator between left and right alignmet
set statusline+=\ 
set statusline+=\ 
set statusline+=%l         "  Line number
set statusline+=/
set statusline+=%L         "  Lines in buffer
set statusline+=\ 
set statusline+=%y         "  Filetype
set statusline+=\ 
set statusline+=%k         "  Current keymap

set guioptions-=r                        " Remove left and right scrollbar
set guioptions-=R
set guioptions-=l
set guioptions-=L
set number                                "  Display line numbers
set foldcolumn=0                          "  No columns to show folds
set guifont=Source\ Code\ Pro\ Light:h14
set linespace=5                           "  More space between lines. Default=0
set cpoptions=|                           "  | at end of changed (<c>) object
set linebreak                             "  Soft-wrap between words
set autoindent
set listchars=tab:▸\ ,eol:¬,nbsp:_        "  Representation of invisible characters with set list
set splitright                            "  Open vsplit window to the right
set splitbelow                            "  Open split window opens below
set shortmess+=A                          "  No swapfile exists warning
set expandtab                             "  tab key inserts spaces. Needed for indentation with <
set shiftwidth=2                          "  Length of tab-character for indention 4 spaces for markdown syntax
set formatoptions=r                      "  r=automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=j                                         "  j=Where it makes sense, remove a comment leader when joining lines.
set ttimeoutlen=1                         "  fixes delay on cursor shape in terminal

" }}}1
"{{{1 General mappings

" Resize split
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>

" Never go into xmode
nnoremap Q <NOP>

" Enlarge split vertically
nnoremap + <C-w>+=

" Go directly to bash
nnoremap ! :!

" gt go to next tab
nnoremap tn :tabnew<CR>

"{{{1 General stuff (passive)

" end hlsearch on onsert
" hlsearch cannot be wrapped in autocmd

nnoremap i  :noh<cr>i
nnoremap I  :noh<cr>I
nnoremap a  :noh<cr>a
nnoremap A  :noh<cr>A
nnoremap o  :noh<cr>o
nnoremap O  :noh<cr>O
nnoremap c  :noh<cr>c
nnoremap cc :noh<cr>cc
nnoremap s  :noh<cr>s
nnoremap S  :noh<cr>S


" Open no text file externally
augroup openExternally
  autocmd!
  autocmd BufRead,BufNewFile *.pdf silent execute "!xpdf " . shellescape(expand("%:p")) . " &>/dev/null &" | buffer# | bdelete# | redraw! | syntax on
  autocmd BufRead,BufNewFile *.mp4,*.mp3,*.flac silent execute "!open " . shellescape(expand("%:p")) . " &>/dev/null &" | buffer# | bdelete# | redraw! | syntax on
augroup END


" Make all splits equal size when going changing Vim total window size, eg when going to fullscreen
autocmd VimResized * :wincmd =

" Move between windows horizontaly
" nnoremap HH <C-W>h
" nnoremap LL <C-W>l



" Foldmethod for .vimrc
autocmd BufRead ~/.vimrc setlocal fdm=marker 

" Always use minimalist foldtext
autocmd BufEnter * set foldtext=getline(v:foldstart)
set fillchars=fold:\ 

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
"{{{2 Syntastic
" Recommended settings in help
    set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 0
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
"{{{2 fzf


" keymaps in prompt
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-p': 'put',
      \ 'ctrl-x': '!launch',
      \ 'ctrl-v': 'vsplit' ,
      \ 'ctrl-s': 'split'
      \  }

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
" au FilterWritePre * if &diff | set wrap | endif

" let g:DiffUpdate = 1
" let g:DiffUnit = 'Word3'
" let g:DiffModeSync = 1

" Reduce error reports
" autocmd InsertEnter * :RDCha
" autocmd InsertLeave * :TDCha
"{{{2 netrw
let g:netrw_banner=0 " supress banner
let g:netrw_sort_options = "i" " sort caseinsensitive

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

" Highlight column under cursor. Is not effected in insert mode
let g:csv_highlight_column = 'n'

" Don't conceal delimiter
let g:csv_no_conceal = 1

"{{{2 vim-pandox-syntax
" don't use conceal
let g:pandoc#syntax#conceal#use = 0

" apply pandoc-syntax on .md files
au! BufNewFile,BufFilePre,BufRead *.md,*.mkd,*.mkd set filetype=markdown.pandoc

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
"{{{2 yankring
  let g:yankring_history_dir = '$HOME/temp/'
"}}}1
"{{{1 Display & Color

syntax on
colorscheme gruvbox " super sexy
set bg=dark " Dark background

" Less glaring search highlight
hi Search cterm=NONE ctermfg=White ctermbg=DarkGreen
hi Search guifg=White guibg=DarkGreen
" hi Search ctermfg=Black

" Italic comments.
highlight Comment cterm=italic

" No wiggly line in terminal. Use underline instead. 
if has('terminal')
  hi SpellBad cterm=underline
endif

" Override conceal applied by varies packages. No pseudo WYSYWYG here!
autocmd BufEnter * silent! set cole=0
"}}}1
"{{{1 Leader commands
"{{{2 general
" insert date in format yymmdd
nnoremap <Leader>d :pu =strftime('%y%m%d')<CR>kJ
" open ctrlp fuzzy file finder
nnoremap <Leader>f :FZF<Space>~/<CR>
" open netrw. `-` also goes to parent directory inside netrw
nnoremap <Leader>x :Explore<CR>
" Window command prefix
nnoremap <Leader>w <C-w>
" Gundo toggle window
nnoremap <Leader>u :GundoToggle<CR>
" Next item in location list window
nnoremap <Leader>nn :lne<CR>
" open vimrc
nnoremap <Leader>m :e $MYVIMRC<CR>
" toggle wrap
nnoremap <Leader>r :set wrap!<CR>
" Open pdf compiled from this file
nnoremap <Leader>po :silent !xpdf '%'*.pdf &<CR>


"{{{2 Markdown compilation  (with asyncrun plugin)

"  to tex
autocmd Filetype markdown 
            \ nnoremap <buffer> <Leader>pt :w<CR>
            \ :AsyncRun pandoc
            \ -f markdown+implicit_figures+table_captions+smart %
            \ --pdf-engine=xelatex
            \ --biblatex
            \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
            \ --wrap=none
            \ -o '%'.tex<CR>

"  to tex self contained
autocmd Filetype markdown 
            \ nnoremap <buffer> <Leader>pts :w<CR>
            \ :AsyncRun pandoc
            \ -f markdown+implicit_figures+table_captions+smart %
            \ --pdf-engine=xelatex
            \ --biblatex
            \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
            \ --wrap=none
            \ -so '%'.tex<CR>

" to txt
autocmd Filetype markdown 
            \ nnoremap <buffer> <Leader>px
            \ :w<CR>
            \ :AsyncRun pandoc
            \ -f markdown+implicit_figures+table_captions %
            \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
            \ -smart
            \ -o '%'.txt<CR>

"  to pdf 
autocmd Filetype markdown 
            \ nnoremap <Leader>pp 
            \ :w<CR>
            \ :AsyncRun pandoc '%'
            \ -f markdown+implicit_figures+table_captions+multiline_tables+smart
            \ --pdf-engine=xelatex
            \ --columns=200
            \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
            \ -o '%'.pdf<CR>

" to pdf with numbers 
autocmd Filetype markdown 
            \ nnoremap <Leader>ppn 
            \ :w<CR>
            \ :AsyncRun pandoc '%'
            \ -f markdown+implicit_figures+table_captions+multiline_tables
            \ --pdf-engine=xelatex
            \ --columns=200
            \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
            \ --number-sections
            \ -o '%'.pdf<CR>


" run biber
autocmd Filetype markdown
  \ nnoremap <buffer> <Leader>b :w<CR>:cd %:p:h<CR>:! biber '%'<CR>

"  to docx. -smart needed for parsing of daises in non TeX.
autocmd Filetype markdown
    \ nnoremap <Leader>pd
    \ :w<CR>
    \ :AsyncRun pandoc -f markdown+implicit_figures+table_captions % --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib -o '%'.docx<CR>

"  to beamer 
autocmd Filetype markdown
    \ nnoremap <buffer><Leader>pb 
    \ :w<CR>
    \ :AsyncRun pandoc
    \ -t beamer
    \ -f markdown+implicit_figures+table_captions+smart %
    \ --pdf-engine=xelatex
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ --slide-level 1
    \ -o '%'.pdf<CR>

"  to html. -S needed for parsing of daises in non TeX.
autocmd Filetype markdown
    \ nnoremap <buffer> <Leader>ph
    \ :w<CR>
    \ :AsyncRun
    \ pandoc -f markdown+implicit_figures+table_captions+smart+all_symbols_escapable %
    \ --toc
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ -o '%'.html<CR>



"{{{2 TeX compilation
" run xelatex and rename output to .tex.pdf 
autocmd Filetype tex
  \ nnoremap <buffer> <Leader>pp :w<CR>
  \ :AsyncRun 
  \ xelatex --aux-directory=~/temp --synctex=1 --src-specials %
  \ && mv '%<'.pdf '%'.pdf<CR>

" Bibtex run
" %< "gives current filename without extension
autocmd Filetype tex
  \ nnoremap <Leader>b :w<CR>
  \ :AsyncRun biber %<<CR>

" OBS!!! Run
"      rm -rf `biber --cache`
" to fix bug crash bug.

" tex do docx
autocmd Filetype tex
    \ nnoremap <Leader>pd
    \ :w<CR>
    \ :AsyncRun pandoc % -smart --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib -o '%'.docx<CR>


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
  set spell
endfunction

" Switch to English
function! EngType()
" To switch back from Arabic
  set keymap=us-altlatin "Modified keymap. File in .vim/keymap
  set norightleft
  set spelllang=en_us
  set spell
endfunction

" Switch to Arabic
function! AraType()
    set keymap=arabic-pc "Modified keymap. File in .vim/keymap
    set rightleft
    set nospell
endfunction


"{{{1 csv mappings and functions
"
autocmd Filetype csv setlocal cursorline

"{{{1 tex mappings and functions

augroup LaTeXMaps
  autocmd!
  " Input yanked rcode in comment.
  " Requires vim-latex-textobj plugin.
  autocmd Filetype tex nnoremap <buffer><Leader>rc i\begin{rcode}<CR>\end{rcode}<ESC>"0Pvae3>
  " Key mapping to Tabularize LaTeX tabular
  " Tabularize by & unless escaped
  autocmd Filetype tex nnoremap <buffer><Leader>t vip:Tabularize /&<CR>
  " Tabularize gloss (by spaces)
  autocmd Filetype tex nnoremap <Leader>tc vip:s/\v +/ /<CR>vip:Tabularize / <CR>
  " to autocomplete reference labels 
  autocmd Filetype tex setlocal iskeyword+=:
augroup end

" }}1
"{{{1 Markdown mappings and function
" Mappings only used in markdown files 


" Clearly highlight LaTeX if-stantements for use in documents with multiple
" output versions. 

augroup MarkdownSyntaxH
  autocmd!
  autocmd Filetype markdown syn match Statement "\\[a-zA-Z]\+"
  autocmd Filetype markdown syn match Constant "`[^`]\{-}`"
   " put this last to overried above 
  autocmd Filetype markdown syn match Underlined "\v^\\(if\S+|else|fi)>"
augroup END
  

" Mappings
" autocmd Filetype markdown call MarkdownMaps()

augroup MarkdownMaps 
  autocmd!
  autocmd Filetype markdown setlocal commentstring=<!--%s-->
  " Let Tabularize do pipe tables 
  autocmd Filetype markdown nnoremap <buffer><Leader>t vip:Tabularize /\|<CR>
  " Move section wise
  autocmd Filetype markdown nnoremap <buffer>]] /^#<CR>
  autocmd Filetype markdown nnoremap <buffer>[[ ?^#<CR>
  " surrounds (with surround plugin)
  autocmd Filetype markdown nnoremap <buffer><Leader>8 ysiW*
  autocmd Filetype markdown nnoremap <buffer><Leader>` ysiW`
  autocmd Filetype markdown nnoremap <buffer><Leader>' ysiW'
augroup end


" Folding
autocmd Filetype markdown,r call MarkdownLevel()
autocmd Filetype markdown,r setlocal foldexpr=MarkdownLevel()  
autocmd Filetype markdown,r setlocal foldmethod=expr    

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
"{{{1 Command line maopings
cnoremap jj <c-w>
"{{{1 Movement & Editing
" {{{2 Completion
  " Use TAB for completions
  inoremap <Tab> <c-n>
  " Shift TAB to inser tab character
  inoremap <S-Tab> <Cv>u0009
  " CTRL-f to complete file path
  inoremap <C-f> <c-x><c-f>


" move around windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Make Y behave like D and C
nnoremap Y yg_

" Choose first word in spellinglist
nnoremap zz <esc>mz[s1z=e`z


" Command to find and replace repeated word, word duplet or triplet.
command! DoubleWordsCorr %s/\v\c<(\w+(\s|\w)+(\s|\w)+)\s+\1>/\1/gc

" Back space to alternate buffer
nnoremap <BS> :b#<CR>

" Move visually on soft-wrapped lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" Set undo points at end of sentence.
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u

" Redraw syntax highlight
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

"{{{2 CHARACTER INPUT

" increment numbers
noremap - :Ex<cr>

" Angular brackets
"〈 U+2329
" 〉U+232A
inoremap <A-<> 〈
inoremap <A->> 〉

" Indent without leaving insert mode
inoremap >> <ESC>me>>`ella
inoremap << <ESC>me<<`ehha

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
iab ARab Arab
iab ARabic Arabic
iab Andras Andreas
iab arabic Arabic
iab fo of
iab lenght length
iab levles levels
iab ot to
iab ruel rule
iab teh the
iab tow two
iab whcih which
iab widht width

" Remove word in input mode. Best mapping ever.
inoremap jj <Esc>ciw
" imap <BS><BS> <NOP> " To learn the above

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


"}}}1
"{{{1 Readingnotes
" https://github.com/andreasmhallberg/readingnotes


" Don't fold 
augroup readningnotes
  autocmd!
  autocmd BufRead ~/Box\ Sync/readingnotes/* setlocal nofoldenable
  autocmd BufRead ~/Box\ Sync/readingnotes/* call EngType()
  " Highligt page refs at end of line
  autocmd BufRead ~/Box\ Sync/readingnotes/* syn match Constant "\v \d+(-{1,2}|,)?(\d+)?\s*$" containedin=ALL
augroup END

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

" syntax for mutt files
autocmd BufRead ~/.mutt/* setlocal filetype=muttrc

" muttaliasescomplete
autocmd FileType mail setlocal omnifunc=muttaliasescomplete#Complete 
autocmd Filetype mail inoremap <buffer><leader>m <c-x><c-o>

"}}}1
"{{{ Test
