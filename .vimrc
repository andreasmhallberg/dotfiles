filetype plugin on
filetype indent on

" Settings for this file
autocmd BufRead ~/.vimrc setlocal foldmethod=marker
autocmd BufRead ~/.vimrc setlocal nospell

"{{{1 Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" let Vundle manage Vundle, required
" Plugin 'jlanzarotta/bufexplorer'     
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'                  " general purpose fuzzy finder
Plugin 'sk1418/HowMuch'                " calculate visually marked math
Plugin 'junegunn/fzf.vim'              " heaven
Plugin 'milkypostman/vim-togglelist'   " toggle quickfix and location list on and off with <leader>q and <leader>l
Plugin 'muttaliasescomplete.vim'       " autocompletion of mutts addressbook. ~/.mutt/aliases as default
Plugin 'junegunn/goyo.vim'
Plugin 'will133/vim-dirdiff'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'klapheke/vim-chat'             " syntax highlighting for CHAT-transcriptions
Plugin 'jalvesaq/Nvim-R'               " R functionality and integration. Requires tmux.
Plugin 'tpope/vim-surround'            " Useful mappings for netrw
Plugin 'tpope/vim-commentary'          " gc<range> to comment
Plugin 'tpope/vim-repeat'              " make mappings repeatable
Plugin 'tpope/vim-vinegar'             " useful mappings for netrw
Plugin 'tpope/vim-characterize'        " display more character info with ga
Plugin 'vim-pandoc/vim-pandoc-syntax'  " good syntax, nested HTML, yaml, etc.
Plugin 'chrisbra/csv.vim'
Plugin 'mbbill/undotree'
Plugin 'lervag/vimtex'
Plugin 'godlygeek/tabular'             " :Tabular command to align stuff
Plugin 'gibiansky/vim-latex-objects'  " LaTeX text objectes. e=environments. % to jump begin/end
Plugin 'qpkorr/vim-renamer'            " Batch rename files vim-style.
Plugin 'vim-scripts/YankRing.vim'      " After ctrlp to remap <c-p>
Plugin 'rhysd/vim-grammarous'          " LanguageTool integration for grammar checking
" Plugin 'blueyed/vim-diminactive'     " Dims window that is not in focus. Clashes with FZF in netrw
Plugin 'rickhowe/diffchar.vim'         " Character wise diff

" Colorschemes
" Plugin 'Jorengarenar/vim-darkness'
Plugin 'morhetz/gruvbox'
Plugin 'kristiandupont/shades-of-teal'
Plugin 'hauleth/blame.vim'
" Plugin 'davidosomething/vim-colors-meh'

" All Plugins must be added before the following line
call vundle#end()            " required
"{{{1 Settings
set clipboard^=unnamed                        " unnamed register and *-register are the same. Copy to system clipboard by default. 
" set gdefault                               " Flag g[lobal] as default on searches. Good in theory but mostly confusing.
set nostartofline                            " remember cursor position when switching buffers
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
set smartcase                                " Case-sensitive when upper case is used in search string
set complete+=s~/dotfiles/mylatexstuff/bibliotek.bib " Load bibtex dumpfile to completion files
set complete+=s~/dotfiles/aratrans.utf-8.add " list of transliterated word to completion files
set wildmenu                                 " Show command completion alternatives
set autoread                                 " autoread when a file is changed from the outside
" set backspace=indent,eol,start             " backspace over everything in insert mode
set hidden                                   " Allow unsaved buffers to be hidden.
set virtualedit=block                        " Allow block selection over empty lines.
set scrolloff=10                              " When scrolling, keep the cursor 4 lines from the top/bottom
set sidescrolloff=4                          " When scrolling, keep the cursor 4 side
set display+=lastline                        " Display as much as possible of last line rather than @s
set textwidth=0                              " Don't hard-wrap lines for me.
set foldlevel=100                            " leave folds open on startup

" save undo file
if has("persistent_undo")
  set undodir=~/.undodir
  set undofile
endif


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
set statusline+=%l         "  Line number
" set statusline+=/
" set statusline+=%L         "  Lines in buffer
" set statusline+=\ 
" set statusline+=%n  " buffer number
set statusline+=\|
set statusline+=%B  " character code
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
set expandtab                             "  tab key inserts spaces. Needed for indentation with <
set shiftwidth=2                          "  Length of tab-character for indention 4 spaces for markdown syntax
set formatoptions=r                       "  r=automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=j                      "  j=Where it makes sense, remove a comment leader when joining lines.
set ttimeoutlen=1                         "  fixes delay on cursor shape in terminal

" }}}1
"{{{1 Commands

" Easier Arabic transcription

function MapEALL()
  let g:eallmappings = 1
  inoremap aa ā
  inoremap ii ī
  inoremap uu ū
  inoremap AA Ā
  inoremap II Ī
  inoremap UU Ū
  inoremap .d ḍ
  inoremap .D Ḍ
  inoremap .t ṭ
  inoremap .T Ṭ
  inoremap .s ṣ
  inoremap .S Ṣ
  inoremap .z ẓ
  inoremap .Z Ẓ
  inoremap .h ḥ
  inoremap .H Ḥ
  inoremap .g ġ
  inoremap .G Ġ
  inoremap vs š
  inoremap vS Š
  inoremap xd ḏ
  inoremap xD Ḏ
  inoremap xt ṯ
  inoremap xT Ṯ

endfunction

function UnmapEALL()
  let g:eallmappings = 0
  iunmap aa
  iunmap ii
  iunmap uu
  iunmap AA
  iunmap II
  iunmap UU
  iunmap .d
  iunmap .D
  iunmap .t
  iunmap .T
  iunmap .s
  iunmap .S
  iunmap .z
  iunmap .Z
  iunmap .h
  iunmap .H
  iunmap .g
  iunmap .G
  iunmap vs
  iunmap vS
  iunmap xd
  iunmap xD
  iunmap xt
  iunmap xT
endfunction

command! Eall call MapEALL()
command! NoEall call UnmapEALL()

command Bib edit ~/dotfiles/mylatexstuff/bibliotek.bib

" https://dhruvasagar.com/2013/12/17/vim-filter-quickfix-list
function! s:FilterLocationList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setloclist(filter(getloclist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file LFilter call s:FilterLocationList(<bang>0, <q-args>)


"{{{1 General mappings

" toggle hlsearch
nnoremap <f12> :set hlsearch!<CR>

" <Leader>o to toggle overview with small font
let g:overview = 0

function! OverveiwToggle()
  " if has('gui')
  if g:overview == 0
    let g:overview = 1
    " Save valuesq
    let g:oldfont = &guifont | let &guifont = substitute(  &guifont,  ':h\zs\d\+',  '5' ,'')
    let g:oldtw = &tw | set tw=80 
    let g:oldscolloff = &scrolloff | set scrolloff=999
  else
    let &guifont = g:oldfont
    let &tw = g:oldtw
    let &scrolloff = g:oldscolloff
    let g:overview = 0
  endif
endfunction

nnoremap <Leader>o :call OverveiwToggle()<CR>
 
" complete all matches in command line
" useful to delete multiple buffers
" <c-a> is taken by Quicksilver
cnoremap <c-c> <c-a>

noremap - :Explore<cr>

nnoremap <F5> <Plug>(grammarous-open-info-window)

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
    else
      let s:voice = 'Allison'
    endif
    call system('echo '. shellescape(@x) .'
         \ | sed -E "s/[<>**]//g"
         \ | sed -E "s/@[a-z-]+_[a-z-]+_([0-9]{4,4})/citation: \\1/g"
         \ | sed -E "s/\\[\\^([a-z]+)\\]/ footnote: \\1./g"
         \ | sed -E "s/\\]{(\\.[^}]+)}//g"
         \ | sed -E "s/http:\\/\\/\\S* /URL /g"
         \ | sed -E "s/[ʿʾ]//g"
         \ | sed -E "s/SA/S A/g"
         \ | sed -E "s/&nbsp;/ /g"
         \ | sed -E "s/\\[([^\\]]+)\\]\\([^)]+\\)/\\1/g"
         \ | say --voice='. s:voice .' &')
    nnoremap <buffer><silent> <esc> :call system('killall say')<CR>
endfunction

vnoremap z "xy:call TTS()<cr>

" stop TTS
<<<<<<< HEAD
" <Enter> to kill say unless in qf/ql/netrw
  " fun! EnterKillSay()
  "     " Don't strip on these filetypes
  "     if &modifiable
  "     nnoremap <buffer><silent> <cr> :call system('killall say')<CR> endif
  " endfun

  " autocmd BufEnter * call EnterKillSay()
" }}}2
=======
" nnoremap <ESC> :silent call system('killall say')<CR>
>>>>>>> a53d91a2f7eb90f234df764224962b05092fb5ce

augroup MoveSectionWhise
autocmd!
  " Move forwards
  autocmd Filetype markdown,markdown.pandoc nnoremap <buffer>]] /^#<CR>
  autocmd Filetype tex nnoremap <buffer>]] /^\\\(chapter\|section\|paragraph\)<CR>
  " Move backwards
  autocmd Filetype markdown,markdown.pandoc nnoremap <buffer>[[ ?^#<CR>
  autocmd Filetype tex nnoremap <buffer>[[ ?^\\\(chapter\|section\|paragraph\)<CR>
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

"{{{1 General stuff (passive)

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
    autocmd BufEnter qf,netrw set nobuflisted
    autocmd TerminalOpen * set nobuflisted
augroup END 

augroup PassiveAutos
  autocmd!
  " Remove one dot if one extra is added at end of sentence.
  " Happens when performing 'ct.' inside a sentence.
  " Marker used to go back.
  " Do not execute if sentence ends in ...
  autocmd InsertLeave * execute
        \ "normal md"
        \| silent s/\.\@<!\.\.$/./e
        \| execute "normal `d"
  " Make all splits equal size when going changing Vim total window size, eg when going to fullscreen
  " Always use minimalist foldtext
  autocmd BufEnter * set foldtext=getline(v:foldstart)
  " Set working directory for current file
  autocmd BufEnter * silent! lcd %:p:h
  " No wrapping in quickfix or location list buffer
  autocmd BufEnter,BufRead quickfix setlocal nowrap
augroup end

augroup ProseHighLighting
  autocmd!
  " Enumeration in prose
  autocmd BufRead,BufEnter *md.,*tex,*.txt,*.mail syn match Constant "\v(First|Second|Third|Fourth|Fifth)\>,"
  autocmd BufRead,BufEnter *md.,*tex,*.txt,*.mail syn match Constant "\<(\?[a-z0-9])\\?"
augroup end

" Open non-text file externally
augroup openExternally
  autocmd!
  autocmd BufRead * let g:saved_altfile_external = @#
  autocmd BufRead *.pdf silent execute "!xpdf " . shellescape(expand("%:p")) . " &>/dev/null &"
        \| buffer#
        \| bdelete#
        \| redraw!
        \| syntax on
        \| let @# = g:saved_altfile_external
  autocmd BufRead *.mp4,*.mp3,*.flac,*.png,*.jpg,*.jpeg,*.doc,*.docx,*.rtf,*.odt silent execute "!open " . shellescape(expand("%:p")) . " &>/dev/null &"
        \| buffer#
        \| bdelete#
        \| redraw!
        \| syntax on
        \| let @# = g:saved_altfile_external
augroup END

" Enable ALT-key in vim. (Only on Mac)
if has('macunix')
    set macmeta
endif



" Different cursor shapes in Iterm
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"{{{1 Plugin configs
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
        \ 'ctrl-x': '!launch',
        \ 'ctrl-v': 'vsplit' ,
        \ 'ctrl-s': 'split' ,
        \  }

      let g:fzf_layout = { 'down': '~50%' }

  "{{{2 undotree
  
  let g:undotree_SetFocusWhenToggle = 1
 
  "{{{2 Goyo

  " Quite goyo when leaving window
  autocmd BufLeave * Goyo!

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
    autocmd! User GoyoLeave nested call <SID>goyo_leave()


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

   " supress banner
   let g:netrw_banner=0
   " sort case insensitive
   let g:netrw_sort_options = "i"
   " keep the current directory the same as the browsing directory.
   let g:netrw_keepdir = 0
   autocmd FileType netrw setlocal cursorline

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
  " Don't indent by yoursel
   let R_indent_commented = 0

  "{{{2 yankring
    let g:yankring_history_dir = '$HOME/temp/'

  "{{{2 HowMuch
  " number of decimals
  let g:HowMuch_scale = 4
  "}}}2
  "{{{2 Solarized
  let g:solarized_termcolors=256
"}}}1
"{{{1 Display & Color

syntax on
colorscheme gruvbox " super sexy
set bg=dark " Dark background

" Italic comments.
highlight Comment cterm=italic

" No wiggly line in terminal. Use underline instead. 
if has('terminal')
  hi SpellBad cterm=underline
endif

" Override conceal applied by varies packages. No pseudo WYSYWYG!
autocmd BufEnter * silent! set cole=0

"}}}1
"{{{1 Leader mappings
"{{{2 general

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
nnoremap <Leader>m :e $MYVIMRC<CR>
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
  autocmd Filetype markdown,markdown.pandoc nnoremap <buffer><Leader>t vip:Tabularize /\|<CR>
  autocmd Filetype markdown,markdown.pandoc vnoremap <buffer><Leader>t :Tabularize /\|<CR>
  autocmd FileType tex nnoremap <buffer><Leader>t vip:Tabularize /&<CR>
  autocmd FileType tex vnoremap <buffer><Leader>t Tabularize /&<CR>
augroup end

"{{{2 Markdown compilation
" <leader>p<p[df] | d[ocx] | b[beamer] | t[tex] >{ s[elf contained] | n[umbered sections] }
" with asyncrun plugin

" test
" source ~/dotfiles/vim-pandoc-function.vim

" Open pdf compiled from this file
nnoremap <Leader>po :silent !xpdf '%'*.pdf &<CR>
nnoremap <Leader>pw :silent !open '%'*.docx &<CR>


" Variable used in compilation mappings
let g:pandoc_citation_style = 'apa-6th-edition.csl'
let g:pandoc_reference_docx = './reference.docx'
let g:pandoc_output_dir = './'
let g:pandoc_bibliography = '~/dotfiles/mylatexstuff/bibliotek.bib'


"{{{3 File specific compilation settings



" citation styles for specific files
  autocmd BufEnter **/arabica/*.md let g:pandoc_citation_style = 'arabica.csl'
        \ | let g:pandoc_reference_docx = 'arabica.docx'
  autocmd BufEnter ~/Box\ Sync/case/manuscript/submission-second/*.md let g:pandoc_citation_style = 'apa-6th-edition.csl'
        \ | let g:pandoc_bibliography = 'manuscript.bib'
        \ | let g:pandoc_reference_docx = 'reading-and-writing.docx'
"}}}


augroup PandocCompilation
autocmd!

  "  to pdf 
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer> <Leader>pp 
    \ :w <bar>
    \ execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+multiline_tables+smart
    \ --pdf-engine=xelatex
    \ --filter pandoc-crossref
    \ --columns=200
    \ --bibliography ' . g:pandoc_bibliography .
    \ ' --csl ~/jobb/citation-styles/' . g:pandoc_citation_style .
    \ ' -o ' . g:pandoc_output_dir . '%' . '.pdf'<cr>


  " to pdf with numbers 
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer> <Leader>ppn 
    \ :w<CR>
    \ :execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+multiline_tables+smart
    \ --pdf-engine=xelatex
    \ --filter pandoc-crossref
    \ --columns=200
    \ --number-sections
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ --csl ~/jobb/citation-styles/' . g:pandoc_citation_style .
    \ ' -o ' . '%' . '.pdf'<cr>

  "  to beamer 
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer><Leader>pb 
    \ :w<CR>
    \ :execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+smart
    \ -t beamer
    \ --pdf-engine=xelatex
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ --slide-level 1
    \ --csl ~/jobb/citation-styles/' . g:pandoc_citation_style .
    \ ' -o ' . '%' . '.beamer.pdf'<cr>

  "  to beamer (LaTeX)
  autocmd Filetype markdown,pandoc.markdown
    \ nnoremap <buffer><Leader>pbt
    \ :w<CR>
    \ :execute 'AsyncRun pandoc ' . '%' .
    \ ' -f markdown+implicit_figures+table_captions+smart
    \ -t beamer
    \ --pdf-engine=xelatex
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
      \ --bibliography ' . g:pandoc_bibliography . 
      \ ' --reference-doc=reference.docx' .
      \ ' --csl ~/jobb/citation-styles/' . g:pandoc_citation_style .
      \ ' -o ' . '%' . '.docx'<cr>

  " to tex
  autocmd Filetype markdown 
    \ nnoremap <buffer> <Leader>pt :w<CR>
    \ :AsyncRun pandoc
    \ -f markdown+implicit_figures+table_captions+smart %
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
    \ :AsyncRun pandoc
    \ -f markdown+implicit_figures+table_captions %
    \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
    \ -smart
    \ -o '%'.txt<CR>



  "  to html.
  "  adds table padding
  autocmd Filetype markdown,pandoc.markdown
      \ nnoremap <buffer><Leader>ph
      \ :w<CR>
      \ :AsyncRun
      \ pandoc -f markdown+implicit_figures+table_captions+smart+all_symbols_escapable+raw_html %
      \ --columns=80
      \ --bibliography ~/dotfiles/mylatexstuff/bibliotek.bib
      \ --filter pandoc-crossref
      \ -t html
      \ <bar> sed 's/\<table\>/\<table cellspacing="10pt"\>/'
      \ > '%'.html<cr>

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
  \ xelatex --aux-directory=~/temp --synctex=1 --src-specials %
  \ && mv '%<'.pdf '%'.pdf<CR>

" tex do docx
autocmd Filetype tex
    \ nnoremap <buffer> <Leader>pd
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
    set keymap=arabic-pc "Modified keymap. File in .vim/keymap
    set rightleft
    set nospell
    iunmap jj
endfunction

"{{{1 csv mappings and functions
"
autocmd Filetype csv setlocal cursorline
autocmd Filetype csv setlocal list



"{{{1 tex mappings and functions

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
autocmd BufEnter *.md,*.mkd setlocal filetype=markdown.pandoc

" Mappings
" autocmd Filetype markdown call MarkdownMaps()

augroup MarkdownMaps 
  autocmd!
  autocmd Filetype markdown,markdown.pandoc setlocal commentstring=<!--\ %s\ -->
augroup end

augroup MardownSettings
  autocmd!
  autocmd Filetype markdown,markdown.pandoc,r call MarkdownLevel()
  autocmd Filetype markdown,markdown.pandoc,r setlocal foldexpr=MarkdownLevel()  
  autocmd Filetype markdown,markdown.pandoc,r setlocal foldmethod=expr    
  autocmd Filetype markdown,markdown.pandoc setlocal iskeyword+=:
augroup end


augroup MardownHL
  autocmd!
  autocmd Filetype markdown,markdown.pandoc syn match Constant "\v(First|Second|Third|Fourth|Fifth)," containedin=ALL 
  autocmd Filetype markdown,markdown.pandoc syn match Constant "^\s*- "
  autocmd Filetype markdown,markdown.pandoc syn match Constant "\s(\?[a-z0-9])"
 syn match Constant "\<(\?[a-z-9])"
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
    if getline(v:lnum)=~'-->$'
        return "<7"
    endif
    return "=" 
endfunction

" }}}1
"{{{1 Command line maopings
cnoremap jj <c-w>
"{{{1 Movement & Editing
" {{{2 Completion
  " Use TAB for completions

" General completion, single or multiple words
inoremap <Tab> <c-n>
" Shift TAB to inser tab character
inoremap <S-Tab> <Tab>
" complete file path with fzf
imap <C-f> <plug>(fzf-complete-path)

" imap <c-f> <plug>(fzf-complete-path)
" completion of following word
inoremap xx <c-x><c-n>
"}}}2

" move around windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

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

" Smallcaps s
  " normal mode
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gs lmfbi[<esc>ea]{.smallcaps}<esc>`f
  autocmd FileType tex nnoremap <buffer>gs lmfbi\textsc{<esc>ea}<esc>`f
  " visual mode

" Arabic a
  " nomral mode
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>ga lmfbi[<esc>ea]{lang=ar}<esc>`f
  autocmd FileType tex nnoremap <buffer>ga lmfbi<Bslash>textarabic{<esc>ea}<esc>`f
  " visual mode 
  autocmd FileType markdown,markdown.pandoc vnoremap <buffer>ga mf<esc>`<i[<esc>`>a]{lang=ar}<esc>`f
  autocmd FileType tex vnoremap <buffer>ga mf<esc>`<i<Bslash>textarabic{<esc>`>a}<esc>`f
  " delete
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>dga mf/]{lang=ar}<cr>df}?[<cr>x`f
  autocmd FileType markdown,markdown.pandoc nnoremap <buffer>gda mf/]{lang=ar}<cr>df}?[<cr>x`f
  autocmd FileType tex nnoremap <buffer>dga mf/}<cr><Bslash>textarabic<cr>df{`f

augroup end

" }}}2
"{{{2 CHARACTER INPUT


" increment numbers
inoremap <m-e> ə
inoremap <m-E> Ə
" non-breaking hyphen
inoremap <m--> ‑

" Angular brackets
"〈 U+2329
" 〉U+232
inoremap <A-<> 〈
inoremap <A->> 〉

" Like numpad
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

" Abbreviations for common typoes
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
autocmd Filetype markdown,markdown.pandoc inoremap <buffer> * **<Left>
autocmd Filetype markdown,markdown.pandoc inoremap <buffer> ** *
" When only one for English possessive 's etc.
" Don't use this mapping for normal English prose where it is used in possessives.
autocmd FileType r inoremap ' ''<Left>
inoremap " ""<Left>
inoremap "" "
inoremap < \<><Left>
inoremap << \<
autocmd Filetype r inoremap <buffer> < <


" Move to eol in Normal, Visual, Select, Operator-pending
noremap L $
noremap H 0


"}}}1
"{{{1 Readingnotes
" https://github.com/andreasmhallberg/readingnotes

augroup readingnotes
  autocmd!
  " Prettier list indentation after line break
  " Shift 2 characters after break
  autocmd BufRead,BufEnter ~/*/readingnotes/* setlocal breakindentopt=shift:2
  " Don't fold
  autocmd BufRead,BufEnter ~/*/readingnotes/* setlocal nofoldenable
  " Write in English
  autocmd BufRead,BufEnter ~/*/readingnotes/* call EngType()
  " Highlight page refs at end of line
  autocmd BufRead,BufEnter ~/*/readingnotes/* syn match Constant "\v [xvi0-9]+(-{1,2}|,)?(\d+)?(n\d+)?\s*$" containedin=ALL
  " Highlight indefinitely indented comments
  autocmd BufRead,BufEnter ~/*/readingnotes/* syn match Comment "\v^\s*\>.*$"
  " For completion of keywords 
  autocmd BufRead,BufEnter ~/*/readingnotes/* setlocal iskeyword+=@-@
  autocmd BufRead,BufEnter ~/*/readingnotes/* setlocal iskeyword+=-
  autocmd BufRead,BufEnter ~/*/readingnotes/* setlocal complete +=sKeywords.md
  autocmd BufRead,BufEnter ~/*/readingnotes/* setlocal breakindent
  " Highlight when listing radingnotes
  autocmd FileType netrw syn match String '\v^.{2,}, \d\d\d\d[ab]?. \zs.{4,}\ze\.(md|pdf)$' containedin=ALL
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
"{{{1 Mutt/mail related

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
augroup end


"}}}1
"{{{1 CHAT
augroup Chat
  autocmd!
  autocmd BufEnter *.cha,*.cex syn match Statement '\v\$(HED|ATT)\S+'
  autocmd BufEnter *.cha,*.cex syn match Constant '\v\$[123]\S+'
  autocmd BufEnter *.cha,*.cex syn match String '\d\+_\d\+'
  autocmd BufEnter *.cha,*.cex syn match String '\d\+_\d\+'
  autocmd BufEnter *.cha,*.cex set list
augroup end

"{{{ Test



