[[ -s ~/.bashrc ]] && source ~/.bashrc

# add bin folder in ~/dotfiles/ to available commands
export PATH=$PATH:~/dotfiles/bin

source ~/.fzf.bash

export VISUAL="vim"
export EDITOR="vim"

# fzf default options
export FZF_DEFAULT_COMMAND='find .'

# Prompt shape
# See man bash > PROMTING

# abbreviate wd in promt with `..`
export PROMPT_DIRTRIM=2 # does not work with bash 3 that ships with OSX

GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

  
if [[ "$OSTYPE" == "linux-gnu" ]]; then
PS1='\[${GREEN}\][\A \w] \[${RESET}\]'
else 
PS1='\[${GREEN}\][\h \w] \[${RESET}\]'
fi

##
# Your previous /Users/andy/.bash_profile file was backed up as /Users/andy/.bash_profile.macports-saved_2016-08-03_at_10:37:22
##

# MacPorts Installer addition on 2016-08-03_at_10:37:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1

# Aliases

alias ls='ls -Fa' # ls with directory/symlink indocators (-F) and hidden files (-a)
# alias "-"='cd ..' # doesnt work
# alias mutt='LC_MESSAGES="en_US.UTF-8" neomutt'          # mutt with english menues.
alias mutt='LC_MESSAGES="en_US.UTF-8" mutt'          # mutt with english menues.
alias date='date +%y%m%d'                               # date with file-type format yymmdd
alias qmv='qmv -f do' # only show output column when using qmv
alias :e='vim' # because vim
# git
alias gc='git checkout'
alias gcb='git checkout -b' #checkout and create new branch
alias gb='git branch'
alias gs='git status'

alias renamer="vim -c 'Renamer"

# MacVim has better display of Arabic characters, also when run in ITerm.
# Fuzzy file finding with ctrl-p is much slower from inside ITerm than in MacVim.
# There is no Alt-key in ITerm which makes it difficult to write Arabic transcription.

# OSX only
if [[ "$OSTYPE" == "darwin"* ]]; then
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
fi

# cd to cd and ls
function cs () {
    cd "$@" && ls
        }
alias cd='cs'

# function xpdfdisown () {
#     xpdf "$@" & disown
# }
# alias xpdf='xpdfdisown'

# vim editing in command line
set -o vi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

bind "set completion-ignore-case on"


export PATH="/usr/local/opt/qt/bin:$PATH"
