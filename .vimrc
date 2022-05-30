filetype plugin on
filetype indent on

language en_US " set language of messages to English. Some plugins give error messages for other languages.

"{{{1 Plugin
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'jlanzarotta/bufexplorer'
Plugin 'justinmk/vim-dirvish'                        "  Less klunky netrw alternative
Plugin 'chrisbra/unicode.vim'                        "  Search for unicode chars
Plugin 'junegunn/fzf'                                "  general purpose fuzzy finder
Plugin 'sk1418/HowMuch'                              "  calculate visually marked math
Plugin 'junegunn/fzf.vim'                            "  heaven
Plugin 'milkypostman/vim-togglelist'                 "  toggle quickfix and location list on and off with <leader>q and <leader>l
Plugin 'junegunn/goyo.vim'
Plugin 'will133/vim-dirdiff'
Plugin 'Konfekt/vim-mutt-aliases' " Compete emails is mutt with <c-x><c-u>
  let g:muttaliases_file = '/Users/xhalaa/.mutt/aliases'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'jalvesaq/nvim-r'                             "  r functionality and integration
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'                        "  gc<range> to comment
Plugin 'tpope/vim-repeat'                            "  make mappings repeatable
" Plugin 'tpope/vim-vinegar'                           "  useful mappings for netrw. Use dirvish instead
Plugin 'tpope/vim-characterize'                      "  simpler netrw alternative
Plugin 'vim-pandoc/vim-pandoc-syntax'                "  good syntax, nested HTML, yaml, etc.
Plugin 'chrisbra/csv.vim'
Plugin 'mbbill/undotree'
" Plugin 'lervag/vimtex'
Plugin 'godlygeek/tabular'                           "  :Tabular command to align stuff
Plugin 'gibiansky/vim-latex-objects'                 "  LaTeX text objectes. e=environments. % to jump begin/end
Plugin 'qpkorr/vim-renamer'                          "  Batch rename files vim-style.
Plugin 'vim-scripts/YankRing.vim'                  
" Plugin 'maxbrunsfeld/vim-yankstack'                  "  Lighter yankring
Plugin 'rhysd/vim-grammarous'                        "  LanguageTool integration for grammar checking
" Plugin 'blueyed/vim-diminactive'                   "  Dims window that is not in focus. Clashes with FZF in netrw
" Plugin 'rickhowe/diffchar.vim'                       "  Character wise diff
" Plugin 'francoiscabrol/ranger.vim'

" Colorschemes
" Plugin 'Jorengarenar/vim-darkness'
Plugin 'morhetz/gruvbox'
" Plugin 'cocopon/iceberg.vim'  
" Plugin 'altercation/vim-colors-solarized'

" Plugin 'kristiandupont/shades-of-teal'   "  Wrong spell has other background
" Plugin 'hauleth/blame.vim'               "  Wrong spell is to stark.
" Plugin 'davidosomething/vim-colors-meh'  "  Clashes with pandoc-syntax

" All Plugins must be added before the following line
call vundle#end()            " required

"{{{1 Settings
" set clipboard+=unnamedplus                   " unnamed register and *-register are the same. Copy to system clipboard by default. Bug in neovim messes up pasting of visual block.
" set gdefault                               " Flag g[lobal] as default on searches. Good in theory but mostly confusing.
set nostartofline                            " remember cursor position when switching buffers
set delcombine                               " Delete part of combining character with x command. Useful for editing Arabic diacritics.
set nojoinspaces                             " Don't add extra space when joining lines with shift-J.
set laststatus=2                             " Always show statusline.
set directory=~/.vim/temp                    " Dir for backup files
set whichwrap+=<,>,h,l,[,]                   " Makes h and l and arrow keys wrap to pre/next line.
set path+=**                                 " make file-based commands search in subfolders
" set complete +=kspell                      " Complete from dictionary when spell is on. Mostly annoying. Technical words will be written more than once and that way added to completion list.
set belloff=all                              " turn off all warnings bells
set keymap=us-altlatin                       " Load US-alt-latin keymap. See ~/dotfiles
set spell                                    "  check spelling by default
set spelllang=en_us
set nowrapscan                               " No wraparound end of file in normal searches
set fillchars=fold:-                         " Fold linefill
set nohlsearch                               " No high-light search hits
set incsearch                                " Search while typing
set ignorecase                               " Ignore case when searching
" set autochdir                                " set workng directory to dir of current buffer. Not supported by dervish
set smartcase                                " Case-sensitive when upper case is used in search string
set wildignorecase                           " Non-case-sensitive file name completion
set complete+=s~/dotfiles/mylatexstuff/bibliotek.bib " Load bibtex dumpfile to completion files
set complete+=s~/dotfiles/aratrans.utf-8.add " list of transliterated word to completion files
set wildmenu                                 " Show command completion alternatives
set autoread                                 " autoread when a file is changed from the outside
" set backspace=indent,eol,start             " backspace over everything in insert mode
set hidden                                   " Allow unsaved buffers to be hidden.
set virtualedit=block                        " Allow block selection over empty lines.
set scrolloff=10                             " When scrolling, keep the cursor 4 lines from the top/bottom
set sidescrolloff=4                          " When scrolling, keep the cursor 4 side
set display+=lastline                        " Display as much as possible of last line rather than @s
set textwidth=0                              " Don't hard-wrap lines for me.
set foldlevel=100                            " leave folds open on startup

set undodir=~/.vim/undodir
set undofile


" DISPLAY

if has("gui_running" )
  set termguicolors                          " 24-bit colors in terminal
endif
set guicursor=a:blinkoff0  "  Make the cursor not blink
" Statusline
set statusline=%F          "  Full path and file name.
set statusline+=%m         "  Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
set statusline+=%=         "  Separator between left and right alignmet
set statusline+=\ \ \ \ 
" set statusline+=%l         "  Line number
" set statusline+=/
set statusline+=%L         "  Lines in buffer
set statusline+=l         "  Lines in buffer
" set statusline+=\ 
" set statusline+=%n  " buffer number
set statusline+=\ 
set statusline+=%{wordcount().words}w 
set statusline+=\ 
" set statusline+=%B  " character code
set statusline+=\ 
set statusline+=%y         "  Filetype
" set statusline+=\ 
set statusline+=%k         "  Current keymap

set guioptions-=r                        " Remove left and right scrollbar
set guioptions-=R
set guioptions-=l
set guioptions-=L
set number                                "  Display line numbers
set foldcolumn=0                          "  No columns to show folds
set guifont=Source\ Code\ Pro\ Light:h15
" set nt=ALM\ Fixed:h16
set linespace=5                           "  More space between lines. Default=0
set cpoptions=|                           "  | at end of changed (<c>) object
set linebreak                             "  Soft-wrap between words
set autoindent
set listchars=tab:▸\ ,eol:¬,nbsp:_        "  Representation of invisible characters with set list
set splitright                            "  Open vsplit window to the right
set splitbelow                            "  Open split window opens below
set shortmess+=A                          "  No swapfile exists warning
" set expandtab                             "  tab key inserts spaces. Needed for indentation with <
set shiftwidth=2                          "  Length of tab-character for indention 4 spaces for markdown syntax
set formatoptions=r                       "  r=automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=j                      "  j=Where it makes sense, remove a comment leader when joining lines.
set ttimeoutlen=1                         "  fixes delay on cursor shape in terminal
if has('nvim')
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
endif

" }}}1
"{{{1 Commands

" FixHtmlPaddim
function! FixHTMLTablePadding()
  %s/<table>/<table cellspacing="10pt">/g
endfunction

function! DoubleWordCorr()
  %s/\(\<\S\+\>\) \<\1\>/\1/gc
endfunction  
command! DoubleWordCorr call DoubleWordCorr()

" Delete hidden buffers
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

" Easier Arabic transcription

"{{{2 EALL transcription 
" TODO: add exceptions for text, extreme
function! EALLToggle()
  if !exists("b:eallmappings")
    let b:eallmappings = 0
  endif 
  if b:eallmappings == 0
    let b:eallmappings = 1
    echo "EALL mappings on for this buffer"
    inoremap <buffer> aa ā
    inoremap <buffer> ii ī
    inoremap <buffer> uu ū
    inoremap <buffer> AA Ā
    inoremap <buffer> II Ī
    inoremap <buffer> UU Ū
    inoremap <buffer> .d ḍ
    inoremap <buffer> .D Ḍ
    inoremap <buffer> .t ṭ
    inoremap <buffer> .T Ṭ
    inoremap <buffer> .s ṣ
    inoremap <buffer> .S Ṣ
    inoremap <buffer> .r ṛ
    inoremap <buffer> .R Ṛ
    inoremap <buffer> .z ẓ
    inoremap <buffer> .Z Ẓ
    inoremap <buffer> .h ḥ
    inoremap <buffer> .H Ḥ
    inoremap <buffer> .g ġ
    inoremap <buffer> .G Ġ
    inoremap <buffer> vs š
    inoremap <buffer> vS Š
    inoremap <buffer> _d ḏ
    inoremap <buffer> _D Ḏ
    inoremap <buffer> _t ṯ
    inoremap <buffer> _T Ṯ
  elseif b:eallmappings == 1
    let b:eallmappings = 0
    echo "EALL mappings off"
    iunmap <buffer>aa
    iunmap <buffer>ii
    iunmap <buffer>uu
    iunmap <buffer>AA
    iunmap <buffer>II
    iunmap <buffer>UU
    iunmap <buffer>.d
    iunmap <buffer>.D
    iunmap <buffer>.t
    iunmap <buffer>.T
    iunmap <buffer>.s
    iunmap <buffer>.S
    iunmap <buffer>.z
    iunmap <buffer>.Z
    iunmap <buffer>.h
    iunmap <buffer>.H
    iunmap <buffer>.g
    iunmap <buffer>.G
    iunmap <buffer>vs
    iunmap <buffer>vS
    iunmap <buffer>_d
    iunmap <buffer>_D
    iunmap <buffer>_t
    iunmap <buffer>_T
  endif
endfunction

command! EALLToggle call EALLToggle()

"}}}2
"{{{2 Flip between markdown and R

function! FlipRMarkdown()
  if &ft=='r'
    set ft=pandoc.markdown
  elseif &ft=~'markdown'
    set ft=r
  endif
endfunction

command! FlipR call FlipRMarkdown()

"}}}2

" Open files

command! Re edit ~/**/readingnotes
command! Uni edit ~/**/notes/unicode.md
command! Bib edit ~/dotfiles/mylatexstuff/bibliotek.bib
command! Todo edit ~/jobb/notes/todo.md

" Only one instance of each file in location list
" https://dhruvasagar.com/2013/12/17/vim-filter-quickfix-list
function! s:FilterLocationList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setloclist(filter(getloclist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file LFilter call s:FilterLocationList(<bang>0, <q-args>)


"{{{1 General mappings

onoremap w iw
onoremap W iW

" toggle hlsearch
nnoremap <f12> :set hlsearch!<CR>

" <Leader>o to toggle overview with small font
let g:overview = 0

function! OverveiwToggle()
  if has('gui')
    if g:overview == 0
      let g:overview = 1
      let g:oldtw = &tw | set formatoptions-=l
      let g:oldscolloff = &scrolloff | set scrolloff=999
      " Save valuesq
      let g:oldfont = &guifont | let &guifont = substitute(  &guifont,  ':h\zs\d\+',  '5' ,'')
    else
      let &guifont = g:oldfont
      let &tw = g:oldtw
      let &scrolloff = g:oldscolloff
      let g:overview = 0
      normal <c-w>=
    endif
  else
    echo "Overview mode needs gui."
  endif
endfunction

" make Q usefule. Avoid hitting Ex-mode by mistake
nnoremap Q :q

nnoremap <Leader>o :call OverveiwToggle()<CR>

" {{{2  Text to speech
  " Says whatever is in the x-register
  " Tested in OSX
  " https://www.reddit.com/r/vim/comments/2odq4l/osx_texttospeech_in_vim/
  " Filter markdown citations. Replace author names (that will be lettered, with 'author')
  " Filter markdown markup
  " Read footnotes as ['footnote <label>']
function! TTS()
    " kill any speech still playing
    " !killall say &>/dev/null
    if &spelllang == 'sv'
      let s:voice = 'Alva'
    elseif &keymap == 'arabic-pc'
      let s:voice = 'Laila'
    else
      let s:voice = 'Allison' "must be downloaded in System preferences
    endif
    call system('echo '. shellescape(@x) .'
         \ | sed -E "s/[<>$]//g"
         \ | sed -E "s/@[a-z-]+_[a-z-]+_([0-9]{4,4})/, citation: \\1/g"
         \ | sed -E "s/\\[\\^([a-z]+)\\]/ footnote: \\1./g"
         \ | sed -E "s/\\]{[^}]+}/]/g"
         \ | sed -E "s/\\^\\[([^]]+)\\]/ ... footnote text: \1. /g"
         \ | sed -E "s/\\[([^]]+)\\]\\([^)]+\\)/\\1/g"
         \ | sed -E "s/https?[^ ]+/URL /g"
         \ | sed -E "s/&nbsp;/ /g"
         \ | sed -E "s/[ʿʾ]//g"
         \ | sed -E "s/SA/S A/g"
         \ | say --voice='. s:voice . ' -r 200 &')
    nnoremap <buffer><silent> <esc> :call system('killall say')<CR>
endfunction

vnoremap z "xy:call TTS()<CR>
" TTS for rest of paragraph
" nnoremap z "xy}:call TTS()<CR>

augroup MoveSectionWhise
autocmd!
  " Move forwards
  autocmd Filetype markdown,markdown.pandoc nnoremap <buffer>]] j/^#<CR>
  autocmd Filetype tex nnoremap <buffer>]] j/^\\\(chapter\|section\|paragraph\)<CR>
  " Move backwards
  autocmd Filetype markdown,markdown.pandoc nnoremap <buffer>[[ k?^#<CR>
  autocmd Filetype tex nnoremap <buffer>[[ k?^\\\(chapter\|section\|paragraph\)<CR>
augroup end

" cycle buffers
nnoremap <TAB> :bn<CR>
nnoremap <s-TAB> :bp<CR>

" Resize split
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>

" Go directly to bash
nnoremap ! :!

" gt go to next tab
nnoremap gt :tabnew<CR>
nnoremap gn :tabnext<CR>

"{{{1 General stuff (passive)

" Use ripgrep, if available for searches
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" Make insert completion case sensitive
au InsertEnter * set noignorecase          
au InsertLeave * set ignorecase

" Skeletons
augroup Skeletons
  autocmd!
  autocmd BufNewFile *.md 0r ~/dotfiles/skeletons/skeleton.md
  autocmd BufNewFile *.tex 0r ~/dotfiles/skeletons/skeleton.tex
  autocmd BufNewFile **/blog/*/*.md 0r ~/dotfiles/skeletons/skeleton.blog.md
augroup END 

" Longer scrolloff on vertical window
function! ConditionalScrolloff()
  if winheight(0) > 70
    if g:overview == 0
      set scrolloff=20
    else
      set scrolloff=10
    endif
  endif
endfunction
autocmd WinEnter,BufEnter,VimResized * call ConditionalScrolloff()

" Dont list function buffers in :ls and ignore in :bn and friends
augroup termIgnore
    autocmd!
    autocmd BufEnter qf set nobuflisted
    if !has('nvim')
      autocmd TerminalOpen * set nobuflisted
    endif
augroup END 

augroup PassiveAutos
  autocmd!
  " Remove one dot if one extra is added at end of sentence.
  " Happens when performing 'ct.' inside a sentence and end with ' .'.
  " Marker used to go back.
  " Do not execute if sentence ends in ...
  autocmd InsertLeave * execute
        \ "normal md"
        \| silent s/\.\@<!\.\.$/./e
        \| execute "normal `d"
  " Always use minimalist foldtext
  autocmd BufEnter * set foldtext=getline(v:foldstart)
  " autocmd BufEnter * silent! lcd %:p:h
  autocmd BufEnter * silent! lcd %:p:h
  " No wrapping in quickfix or location list buffer
  autocmd BufEnter,BufRead quickfix setlocal nowrap
augroup end

augroup ProseHighLighting
  autocmd!
  " Enumeration
  autocmd BufEnter *.md syn match Constant '\v([Ff]irst|[Ss]econd|[Tt]hird|[Ff]ourth|[Ff]ifth),'
  autocmd BufEnter *.md syn match Constant '\<(\?[a-z0-9])\\?' containedin=ALL
 " spell-check double words
autocmd BufEnter *.md syn match SpellBad '/\c\<\(\w\+\)\s\+\1\>/'
 " dates format yyyy-mm-dd
 autocmd BufEnter *.md syn match Constant '\d\{2,4}-\d\d-\d\d' containedin=ALL
augroup end

" Open non-text file externally
augroup OpenExternally
autocmd!

  autocmd BufRead *.mp4,*.mp3,*.flac,*.png,*.jpg,*.jpeg,*.docx,*.rtf,*.odt,*.epub sil ex "!open " . shellescape(expand("%:p")) | b# | bd#

  autocmd! BufRead *.pdf silent execute "!zathura --mode=fullscreen " . shellescape(expand("%:p")) . " &>/dev/null &" | b# | bd#

  autocmd! BufReadPost *.docx !pandoc % -t markdown  

augroup end

" Enable ALT-key in vim. (Only on Mac)
if !has('nvim')
  if has('osxdarwin')
    set macmeta
  endif
endif

" Different cursor shapes in Iterm
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"{{{1 Plugin configs
  "{{{2 asyncrun
    " Notify when background process is done
    let g:asyncrun_exit = "echo 'Done'"

  "{{{2 yankstack

    nmap <C-p> <Plug>yankstack_substitute_older_paste
    nmap <C-P> <Plug>yankstack_substitute_newer_paste
  "{{{2 Grammarous
  let g:grammarous#disabled_rules = {
            \ '*' : [
            \ 'DASH_RULE'
            \,'MULTIPLICATION_SIGN'
            \,'ARROWS'
            \,'EN_QUOTES'
            \,'WHITESPACE_RULE'
            \,'EN_UNPAIRED_BRACKETS'
            \,'COMMA_PARENTHESIS_WHITESPACE'
            \]
            \ }

" See above
" nnoremap <F5> <Plug>(grammarous-open-info-window)

  "{{{2 fzf


  " keymaps in prompt
      let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': '!launch',
        \ 'ctrl-p': '!zathura --mode=fullsrcreen ',
        \ 'ctrl-v': 'vsplit' ,
        \ 'ctrl-s': 'split' ,
        \  }

      let g:fzf_layout = { 'down': '~50%' }

  " Find in files with rg

    " --column: Show column number
    " --line-number: Show line number
    " --no-heading: Do not show file headings in results
    " --fixed-strings: Search term as a literal string
    " --ignore-case: Case insensitive search
    " --no-ignore: Do not respect .gitignore, etc...
    " --hidden: Search hidden files and folders
    " --follow: Follow symlinks
    " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
    " --color: Search color options

    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


  "{{{2 undotree
  
  let g:undotree_SetFocusWhenToggle = 1
 
  "{{{2 Goyo

  " Quite goyo when leaving window
  " autocmd BufLeave * Goyo!
  " autocmd BufEnter article.md Goyo

  " Stuff that happen when entering goyo
      function! s:goyo_enter()
        set noshowmode
        set wrap
      endfunction

  " Stuff that happen when exiting goyo
      function! s:goyo_leave()
        set number
      endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave() | syntax on 


  "{{{2 DiffChar
    " Set wrap in diff
    au FilterWritePre * if &diff | set wrap | endif

    " let g:DiffUpdate = 1
    " let g:DiffUnit = 'Word3'
    " let g:DiffModeSync = 1

    " Reduce error reports
    " autocmd InsertEnter * :RDCha
    " autocmd InsertLeave * :TDCha

  "{{{2 netrw

 " Disable netrw. Useful for testing dervish
	" let g:loaded_netrw       = 1
	" let g:loaded_netrwPlugin = 1

   " supress banner
   let g:netrw_banner=0
   " sort case insensitive
   let g:netrw_sort_options = "i"
   " keep the current directory the same as the browsing directory.
   let g:netrw_keepdir = 0
   let g:netrw_keepalt = 1



  augroup NetrwAutos
    autocmd!
    autocmd FileType netrw setlocal cursorline
    " override netrw mapping
    autocmd FileType netrw nmap <buffer> <c-l> <c-w>l
    " r to refresh
    autocmd FileType netrw nmap <buffer> r :e .<cr>
  augroup end

  " function! NetrwPreViewMode()
  "   if g:netrw_preview_mode == 1 
  "     let g:netrw_preview_mode = 0
  "   else
  "     let g:netrw_preview_mode = 1
  "   endif


  "{{{2 dirvish
  augroup DirvishAutos
    autocmd!
    autocmd FileType dirvish setlocal cursorline
    autocmd FileType dirvish setlocal nospell
    autocmd FileType dirvish setlocal conceallevel=1
  augroup end

  augroup DirivshMappings
    autocmd!
    autocmd FileType dirvish nnoremap <buffer> v :call dirvish#open("vsplit", 1)<cr>
    autocmd FileType dirvish nnoremap <buffer> R 0y$$F/"1yg_:!mv "<c-r>0" .<c-r>1<c-f>A
    autocmd FileType dirvish nnoremap <buffer> D 0y$:!rm -i "<c-r>0"<CR>
    autocmd FileType dirvish nnoremap <buffer> ! 0y$:!"<c-r>0"<Home><Right><Space><Left>
    autocmd FileType dirvish nnoremap <buffer> x 0y$:!open "<c-r>0"<cr>
    " Remove modified search mappings
    autocmd FileType dirvish silent! unmap <buffer> /
    autocmd FileType dirvish silent! unmap <buffer> ?
  augroup end
  
  "{{{2 csv

    autocmd BufRead,BufEnter *.csv set filetype=csv
    autocmd BufRead,BufEnter *.dat set filetype=csv
    autocmd FileType csv setlocal cursorline

    " Highlight column under cursor. Is not effected in insert mode
    let g:csv_highlight_column = 'n'

    " Don't conceal delimiter
    let g:csv_no_conceal = 1

  "{{{2 vim-pandoc-syntax
    " don't use conceal
    let g:pandoc#syntax#conceal#use = 0

  "{{{2 gundo
    " Soft wrap gundo preview
    augroup MyGundo
        au!
        au BufWinEnter __Gundo_Preview__ setl linebreak wrap
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

  " Unly use user defined binding
  " See R mappings and functions below for mappings
    let R_user_maps_only = 0

" augroup RMaps
"  autocmd!
"   " Envoke nvim-r plugin mappings
"  autocmd FileType r nnoremap <buffer> <leader>rf <Plug>RStart
"  autocmd FileType r nnoremap <buffer> <leader>rh <Plug>RHelp
"  autocmd FileType r nnoremap <buffer> <leader>rq <Plug>RClose
"  autocmd FileType r nnoremap <buffer> <leader>rv <Plug>RViewDF
"  autocmd FileType r nnoremap <buffer> <leader>rs <Plug>RSummary
"  autocmd FileType r nnoremap <buffer> <leader>rn <Plug>RObjectNames
"  autocmd FileType r nnoremap <buffer> <leader>ss <Plug>RSendSelection
"  autocmd FileType r nnoremap <buffer> <leader>so <Plug>RSendSelAndInsertOutput
"  autocmd FileType r nnoremap <buffer> <leader>pp <Plug>RSendParagraph
"  autocmd FileType r nnoremap <buffer> <leader>ll <Plug>RSendLine
"  autocmd FileType r nnoremap <buffer> <leader>lo <Plug>RSendLine
"  autocmd FileType r nnoremap <buffer> <leader>lo <Plug>RDSendLineAndInsertOutput
" augroup end


 
  "{{{2 yankring
    let g:yankring_history_dir = '~/tmp'

  "{{{2 HowMuch
  " number of decimals
  let g:HowMuch_scale = 4
  "}}}2
  "{{{2 VimTex
  let g:tex_flavor = 'latex' " set flvor for .tex files
"}}}1
"{{{1 Display & Color
"

syntax on
colorscheme gruvbox " super sexy
set bg=dark " Dark background
let g:gruvbox_contrast_dark="medium" " soft|medium|hard

set redrawtime=5000 " dont give up on large files

" Italic comments.
highlight Comment cterm=italic

" No wiggly line in terminal. Use underline instead. 
if has('terminal')
  hi SpellBad cterm=underline
endif

" Override conceal applied by varies packages.
  autocmd BufEnter * silent! set conceallevel=0

"}}}1
"{{{1 Leader mappings
"{{{2 general

" Copy buffer to system clopboard
nnoremap <Leader>c mcggVggG"*y`c:echo "Buffer copied to clipboard"<CR>

" insert date in format yymmdd
nnoremap <Leader>d :pu =strftime('%Y-%m-%d')<CR>kJ
" Fuzzy find files with FZF
nnoremap <Leader>f :FZF<Space>~/<CR>
" Fuzzy find buffers with FZF
nnoremap <Leader>b :Buffers<CR>
" Fuzzy help find with FZF
nnoremap <Leader>h :Help<CR>
" Window command prefix
nnoremap <Leader>w <C-w>
" View undoo tree. Currently with undotree
nnoremap <Leader>u :UndotreeToggle<CR>
" Open vimrc
nnoremap <Leader>m :e ~/.vimrc<CR>

" list and chose open buffer 
" nnoremap <leader>l :ls<CR>:b<space>
" toggle wrap
nnoremap <Leader>r :set wrap!<CR>
" Toggle GoYo
nnoremap <Leader>g :Goyo<cr>
" next in location list
nnoremap <Leader>n :lnext<cr>

" Diffchar get text form other buffer
nmap <leader>dg <Plug>GetDiffCharPair

" Tabularize mappings (normal and visual)
augroup Tabularize
  autocmd!
  autocmd Filetype markdown,markdown.pandoc nnoremap <buffer><Leader>t mtvip:Tabularize /\|<CR>`t
  autocmd Filetype markdown,markdown.pandoc vnoremap <buffer><Leader>t :Tabularize /\|<CR>
  autocmd FileType tex nnoremap <buffer><Leader>t mtvip:Tabularize /&<CR>`t
  autocmd FileType tex vnoremap <buffer><Leader>t Tabularize /&<CR>
augroup end

"{{{2 Markdown compilation
" <leader>p<p[df] | d[ocx] | b[beamer] | t[tex] >{ s[elf contained] | n[umbered sections] }
" with asyncrun plugin

" test
" source ~/dotfiles/vim-pandoc-function.vim

" Open pdf compiled from this file
" nnoremap <silent> <Leader>po :silent !zathura '%'*.pdf&<CR>
nnoremap <silent> <Leader>po :silent execute "!zathura --mode fullscreen " . shellescape(expand("%")) . "*.pdf &>/dev/null &"<CR>
nnoremap <Leader>pw :silent !open '%'.docx &<CR>


" Variable used in compilation mappings
let g:pandoc_citation_style = '~/citation-styles/apa.csl'
let g:pandoc_reference_docx = '/Users/xhalaa/dotfiles/pandoc-data-dir/reference.docx'
let g:pandoc_output_dir = './'
let g:pandoc_bibliography = '~/dotfiles/mylatexstuff/bibliotek.bib'
let g:pandoc_compilation_extension = 'pdf'


"{{{3 File specific compilation settings



" citation styles for specific files
augroup CitationVariables
  autocmd!

  autocmd BufRead article.arabica.md,*-arabica.md let g:pandoc_citation_style = '/Users/xhalaa/dotfiles/my-styles/arabica.csl'
        \ | let g:pandoc_reference_docx = '/Users/xhalaa/dotfiles/pandoc-data-dir/arabica.docx'
  
  autocmd BufRead *-suecana.md let g:pandoc_citation_style = '/Users/xhalaa/dotfiles/my-styles/orientalia-suecana.csl'
  
  autocmd BufRead *-jss.md
        \  let g:pandoc_citation_style = '/Users/xhalaa/dotfiles/my-styles/journal-of-semitic-studies.csl'

  autocmd BufRead *-zal.md
        \  let g:pandoc_citation_style = '/Users/xhalaa/dotfiles/my-styles/ZAL.csl'
        \ | let g:pandoc_reference_docx = '/Users/xhalaa/dotfiles/pandoc-data-dir/ZAL_stylesheet_with-instructions.dotx'

  autocmd BufRead *-apa.md
        \ let g:pandoc_reference_docx = '/Users/xhalaa/dotfiles/pandoc-data-dir/apa.docx'

  autocmd BufRead *-arabiyya.md
        \ let g:pandoc_citation_style = '/Users/xhalaa/dotfiles/my-styles/al-arabiyya.csl'
        \ | let g:pandoc_reference_docx = '/Users/xhalaa/dotfiles/pandoc-data-dir/arabica.docx'

  autocmd BufRead *-ijcl.md
        \ let g:pandoc_citation_style = '/Users/xhalaa/dotfiles/my-styles/ijcl.csl'
        \ | let g:pandoc_reference_docx = '/Users/xhalaa/dotfiles/pandoc-data-dir/ijcl.docx'


augroup end
"}}}

" TODO: make functions
augroup PandocCompilation
autocmd!

  "  to pdf 
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer> <Leader>pp 
    \ :w <bar>
    \ execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+multiline_tables+smart+task_lists-auto_identifiers
    \ --pdf-engine xelatex
    \ --filter pandoc-crossref
    \ --citeproc
    \ --columns=100
    \ --bibliography ' . g:pandoc_bibliography .
    \ ' --csl ' . g:pandoc_citation_style .
    \ ' -o ' . g:pandoc_output_dir . '%' . '.pdf'<cr>


  " to pdf with numbers 
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer> <Leader>ppn 
    \ :w<CR>
    \ :execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+multiline_tables+smart
    \ --pdf-engine=xelatex
    \ --filter pandoc-crossref
    \ --citeproc
    \ --columns=100
    \ --number-sections
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ --csl ' . g:pandoc_citation_style .
    \ ' -o ' . '%' . '.pdf'<CR>

  "  to beamer 
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer><Leader>pb 
    \ :w<CR>
    \ :execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+smart
    \ -t beamer
    \ --citeproc
    \ --pdf-engine=xelatex
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ --csl ' . g:pandoc_citation_style .
    \ ' -o ' . '%' . '.beamer.pdf'<cr>

  "  to beamer (LaTeX)
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer><Leader>pbt
    \ :w<CR>
    \ :execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+smart
    \ -t beamer
    \ --pdf-engine=xelatex
    \ --citeproc
    \ --slide-level 1
    \ --biblatex
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ ' -so ' . '%' . '.beamer.tex'<cr>


  "  to docx.
      autocmd Filetype markdown,pandoc.markdown
      \ nnoremap <buffer><Leader>pd
      \ :w<CR>
      \ :execute 'AsyncRun pandoc ' . '%' .
      \ ' -f markdown+implicit_figures+table_captions+example_lists+smart
      \ --filter pandoc-crossref
      \ --verbose
      \ --citeproc
      \ --bibliography ' . g:pandoc_bibliography . 
      \ ' --csl ' . g:pandoc_citation_style .
      \ ' --reference-doc=' . g:pandoc_reference_docx .
      \ ' -o ' . '%' . '.docx'<cr>
      

  " to tex
  autocmd Filetype markdown 
    \ nnoremap <buffer> <Leader>pt :w<CR>
    \ :AsyncRun pandoc
    \ -f markdown+implicit_figures+table_captions+smart+raw_tex %
    \ --pdf-engine=xelatex
    \ --filter pandoc-crossref
    \ --biblatex
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ --wrap=none
    \ -o '%'.tex<cr>

  " to tex visual selection
  autocmd Filetype markdown 
    \ vnoremap <buffer> <Leader>pt :!pandoc -f markdown -t latex<cr>
  
  "  to tex self contained
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer> <Leader>pts :w<CR>
    \ :AsyncRun pandoc
    \ -f markdown+implicit_figures+table_captions+smart %
    \ --pdf-engine=xelatex
    \ --biblatex
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ --wrap=none
    \ -so '%'.tex<CR>

  " to txt
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer> <Leader>px
    \ :w<CR>
    \ :AsyncRun pandoc+smart
    \ -f markdown+implicit_figures+table_captions %
    \ --filter pandoc-crossref
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ -o '%'.txt<CR>



"  to html.
autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer><Leader>ph
    \ :w <bar>
    \ execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+smart+all_symbols_escapable+raw_html+grid_tables
    \ --filter pandoc-crossref
    \ --citeproc
    \ --columns=100
    \ --bibliography ' . g:pandoc_bibliography .
    \ ' --csl ' . g:pandoc_citation_style .
    \ ' -o ' . g:pandoc_output_dir . '%' . '.html'<CR>


  " to html from visual selection
  autocmd Filetype markdown,pandoc.markdown
      \ vnoremap <buffer><Leader>ph
      \ :AsyncRun
      \ pandoc -f markdown+implicit_figures+table_captions+smart+all_symbols_escapable+raw_html
      \ --columns=80
      \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
      \ --filter pandoc-crossref
      \ -t html
      \ <bar> sed 's/\<table\>/\<table cellspacing="10pt"\>/'
      \ > 

  "  to html, self contained
  autocmd Filetype markdown,pandoc.markdown
      \ nnoremap <buffer> <Leader>phs
      \ :w<CR>
      \ :AsyncRun
      \ pandoc -f markdown+implicit_figures+table_captions+smart+all_symbols_escapable %
      \ --toc
      \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
      \ -so '%'.html<CR>

augroup end


"{{{2 TeX compilation 
" run xelatex and rename output to .tex.pdf 
autocmd Filetype tex
  \ nnoremap <buffer> <Leader>pp :w<CR>
  \ :AsyncRun 
  \ xelatex %
  \ && mv '%<'.pdf '%'.pdf<CR>

" tex do docx
autocmd Filetype tex
    \ nnoremap <buffer> <Leader>pd
    \ :w<CR>
    \ :AsyncRun pandoc % -smart --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib -o '%'.docx<CR>

"{{{1 csv mappings and functions
"
autocmd Filetype csv setlocal cursorline
autocmd Filetype csv setlocal list



"{{{1 R mappings and functions

"{{{1 Tex mappings and functions

augroup LaTeXMaps
  autocmd!
  " Input yanked rcode in comment.
  " Key mapping to Tabularize LaTeX tabular
  " Tabularize gloss (by spaces)
  autocmd FileType tex nnoremap <Leader>tc vip:s/\v +/ /<CR>vip:Tabularize / <CR>
  " to autocomplete reference labels 
  autocmd FileType tex setlocal iskeyword+=:
augroup end

augroup LaTeXHighlight
  autocmd!
  autocmd FileType tex syn match Statement "_" containedin=ALL " Stop _ being an error
augroup end

" " run biber
 " autocmd Filetype tex nnoremap <buffer> <Leader>bi :w<CR>:cd %:p:h<CR>:! biber '%'<CR>
"   " OBS!!! Run ``rm -rf `biber --cache` to fix bug crash bug.

" }}1

"{{{1 Markdown mappings and function
" Mappings only used in markdown files 

" trigger markdown.pandoc syntax on all markdown files
autocmd BufRead *.md,*.mkd setlocal filetype=markdown.pandoc

" Mappings
" autocmd Filetype markdown call MarkdownMaps()


augroup MardownSettings
  autocmd!
  autocmd Filetype markdown,markdown.pandoc setlocal commentstring=<!--\ %s\ -->
  autocmd Filetype markdown,markdown.pandoc,r call MarkdownLevel()
  autocmd Filetype markdown,markdown.pandoc,r setlocal foldexpr=MarkdownLevel()  
  autocmd Filetype markdown,markdown.pandoc,r setlocal foldmethod=expr    
  autocmd Filetype markdown,markdown.pandoc setlocal iskeyword+=:
  autocmd Filetype markdown,markdown.pandoc syn match MDnospell "{.\{-}}" contains=@NoSpell
augroup end


" Folding

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
    " comments
    if getline(v:lnum)=~'^<!--'
        return ">7"
    endif
    if getline(v:lnum)=~'^-->$'
        return "<7"
    endif
    " codebloc
    if getline(v:lnum)=~'\v^\s*```( \w+)?$'
        return ">7"
    endif
    if getline(v:lnum)=~'^\s*```$'
        return "<7"
    endif
    return "=" 
endfunction

" }}}1
"{{{1 Movement & Editing
cnoremap jj <c-w>
inoremap jj <c-w>
" {{{2 Completion
  " Use TAB for completions

" General completion, single or multiple words
inoremap <Tab> <c-n>
" Shift TAB to inser tab character
inoremap <S-Tab> <Tab>
" complete file path with fzf. Same binding as in terminal
imap <C-t> <plug>(fzf-complete-path)

" completion of following word
inoremap xx <c-x><c-n>
"}}}2

" {{{2 Navigating windows
" Move around windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


"}}}2

" Make Y behave like D and C
nnoremap Y y$

" U to redo
nnoremap U <C-r>

" Choose first word in spelling list preceding misspelled word
nnoremap zz <esc>mz[s1z=e`z

" Back space to alternate buffer
nnoremap <BS> :b#<CR>

" Move visually on soft-wrapped lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj


" {{{2 font markup
" mapping combinations with g

" <l> first in normal mode mapping to compensate in shift with inserted character

augroup FontMappings
  autocmd!

" Boldface b
  " normal mode
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gb lmflbi**<esc>ea**<esc>`f
  autocmd FileType tex nnoremap <buffer>gb lmflbi<Bslash>textbf{<esc>ea}<esc>`f
  " visual mode
  autocmd FileType markdown,markdown.pandoc vnoremap <buffer>gb mf`<i**<esc>`>a**<esc>`f

" Italic i (word) and I (WORD)
  " normal mode
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gi lmfbi*<esc>ea*<esc>`f
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gI lmfBi*<esc>ea*<esc>`f


  autocmd FileType tex nnoremap <buffer>gi lmfbi<Bslash>textit{<esc>ea}<esc>`f
  " visual mode
  autocmd FileType markdown,markdown.pandoc vnoremap <buffer>gi mf<esc>`<i*<esc>`>a*<esc>`f
  autocmd FileType tex vnoremap <buffer>gi mf`<esc>i<Bslash>textit{<esc>`>a}<esc>`f
  " remove
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gdi mf<esc>?\*<cr>x/\*/\*<cr>x`f

" Smallcaps s
  " normal mode
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gs lmfbi[<esc>ea]{.smallcaps}<esc>`f
  autocmd FileType tex nnoremap <buffer>gs lmfbi\textsc{<esc>ea}<esc>`f
  " visual mode
  autocmd FileType markdown,markdown.pandoc vnoremap <buffer>gs mf<esc>`<i[<esc>`>ea]{.smallcaps}<esc>`f

" Arabic r
  " nomral mode
  autocmd FileType markdown,markdown.pandoc,mail nnoremap <buffer>gr lmfbi[<esc>ea]{lang=ar}<esc>`f
  autocmd FileType tex nnoremap <buffer>gr lmfbi<Bslash>textarabic{<esc>ea}<esc>`f
  autocmd FileType html nnoremap <buffer>gr lmfbi<span lang="ar" dir="rtl"><esc>ea</span><esc>`f
  " visual mode 
  autocmd FileType markdown,markdown.pandoc vnoremap <buffer>gr mf<esc>`<i[<esc>`>a]{lang=ar}<esc>`f
  autocmd FileType tex  vnoremap <buffer>gr mf<esc>`<i<Bslash>textarabic{<esc>`>a}<esc>`f
  autocmd FileType html vnoremap <buffer>gr mf`>a</span><esc>`<i<span lang="ar" dir="rtl"><esc>`f
  " delete
  " requires vim-surround plugin
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>dgr mf/]{lang="ar"<cr>df}?[<cr>x`f
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gdr mf/]{lang="ar"<cr>df}?[<cr>x`f
  autocmd FileType tex nnoremap <buffer>dgr mf/}<cr><Bslash>textarabic<cr>df{`f

augroup end

" }}}2
" {{{2 CHARACTER INPUT

inoremap <M-e> ə
inoremap <M-E> Ə
" non-breaking hyphen
inoremap <M--> ‑
" non-breaking space
inoremap <M-Space>  

" Space to insert space character before
nnoremap <Space> i<Space><ESC>

inoremap <M-"> “”<left>

" Abbreviations for common typos
iab ARab Arab
iab ARabic Arabic
iab Andras Andreas
iab fo of
iab lenght length
iab levles levels
iab ot to
iab ruel rule
iab teh the
iab tow two
iab whcih which
iab widht width
iab introductoin introduction
iab Syrain Syrian
iab langauge language
iab apporach approach

" Swedish
iab istället i stället

iab aa ʿāmmiyya
iab Aa ʿĀmmiyya
iab ff fuṣḥā
iab Ff Fuṣḥā

" Capitalized nationalities in English
iab arabic Arabic
iab egyptian Egyptian
iab english English
iab german German
iab french French


" Remove word in input mode.
inoremap jj <c-w>
" imap <BS><BS> <NOP> " To learn the above
" delimiters
inoremap ( ()<Left>
inoremap (( (
inoremap [ []<Left>
inoremap [[ [
inoremap { {}<Left>
inoremap {{ {
inoremap ` ``<Left>
inoremap `` `
inoremap ' ''<Left>
inoremap '' '
inoremap <M->> 〉
inoremap <M-<> 〈〉<Left>
inoremap <M-<><M-<> 〈 
autocmd Filetype markdown,markdown.pandoc inoremap <buffer> * **<Left>
autocmd Filetype markdown,markdown.pandoc inoremap <buffer> ** *
autocmd Filetype markdown,markdown.pandoc inoremap <buffer> ^ ^^<Left>
autocmd Filetype markdown,markdown.pandoc inoremap <buffer> ^^ ^
" When only one for English possessive 's etc.
inoremap " ""<Left>
inoremap "" "
inoremap < \<><Left>
inoremap << \<
autocmd Filetype r inoremap <buffer> < <

" Move to eol in Normal, Visual, Select, Operator-pending
noremap L $
noremap H 0

"}}}1
"{{{1 Language switching

"  Switch to Swedish
function! SweType()
  inoremap jj <c-w>
  set spelllang=sv
  set spellfile=~/.vim/spell/sv.utf-8.add,~/.vim/spell/aratrans.utf-8.add
" To switch back from Arabic
  set keymap=swe-us "Modified keymap. File in .vim/keymap
  set norightleft
  set spell
endfunction

" Switch to English
function! EngType()
  inoremap jj <c-w>
" To switch back from Arabic
  set keymap=us-altlatin "Modified keymap. File in .vim/keymap
  set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/aratrans.utf-8.add
  set norightleft
  set spelllang=en_us
  set spell
endfunction

" Switch to Arabic
function! AraType()
    iunmap jj
    set keymap=arabic-pc "Modified keymap. File in .vim/keymap
    set rightleft
    set nospell
endfunction

" Switch to English typing
nnoremap <Leader>e :<C-U>call EngType()<CR>
call EngType() " Do this on startup
" Switch to Swedish typing
nnoremap <Leader>s :<C-U>call SweType()<CR>
" Switch to Arabic typing
nnoremap <Leader>a :<C-U>call AraType()<CR>
"{{{1 Readingnotes
" https://github.com/andreasmhallberg/readingnotes

augroup readingnotes
  autocmd!
  " Prettier list indentation after line break
  " Shift 2 characters after break
  autocmd BufRead,BufEnter **/readingnotes/*.md setlocal breakindentopt=shift:2
  " Don't fold
  autocmd BufRead,BufEnter **/readingnotes/*.md setlocal nofoldenable
  " Write in English
  autocmd BufRead,BufEnter **/readingnotes/*.md call EngType()
  " Highlight page refs at end of line
  autocmd BufRead,BufEnter **/readingnotes/*.md syn match Constant "\v [xvi0-9]+(-{1,2}|,)?(\d+)?(n\d+)?\s*$" containedin=ALL
  " Highlight indefinitely indented comments
  autocmd BufRead,BufEnter **/readingnotes/*.md syn match Comment "\v^\s*\>.*$"
  " For completion of keywords 
  autocmd BufRead,BufEnter **/readingnotes/*.md setlocal iskeyword+=@-@
  autocmd BufRead,BufEnter **/readingnotes/*.md setlocal iskeyword+=-
  autocmd BufRead,BufEnter **/readingnotes/*.md setlocal complete +=sKeywords.md
  autocmd BufRead,BufEnter **/readingnotes/*.md setlocal breakindent
  " Highlight when listing radingnotes
  " year
  autocmd FileType dirvish syn match Constant '\v\d\d\d\d[abc]?\.' containedin=ALL
  " suffix
  autocmd FileType dirvish syn match Comment '\.[a-z.]\+$' containedin=ALL
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
"{{{1 Mail related

" syntax for mutt files
autocmd BufRead ~/.mutt/* setlocal filetype=muttrc

" muttaliasescomplete
augroup MailStuff
  autocmd!
  " for completion of email addresses 
  autocmd FileType mail setlocal complete +=s~/jobb/aliases 
  autocmd FileType mail setlocal iskeyword+=@-@
  autocmd FileType mail setlocal iskeyword+=.
  autocmd FileType mail setlocal iskeyword+=_
  " format text
  autocmd FileType mail nnoremap <buffer> <CR> gqip
augroup end


"}}}1
"{{{1 CHAT
augroup Chat
  autocmd!
  " Syntax highlighting
  autocmd BufEnter *.cha,*.cex syn match Statement '\v\$(HED|ATT)\S+'
  autocmd BufEnter *.cha,*.cex syn match Constant '\v\$[123]\S+'
  autocmd BufEnter *.cha,*.cex syn match String '\d\+_\d\+'
  autocmd BufEnter *.cha,*.cex syn match String '\d\+_\d\+'
  autocmd BufEnter *.cha,*.cex set list
augroup end

"  vim:foldmethod=marker:nospell
