# Must come before fzf-stuff are sourced
set -o vi

# Set pbcopy to use Unicode
export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100

[[ -s ~/.bashrc ]] && source ~/.bashrc

# add bin folder in ~/dotfiles/ to available commands
export PATH=$PATH:~/dotfiles/bin
export PATH=$PATH:~/dotfiles/bin/textanalysis

source ~/.fzf.bash

export VISUAL="vim"
export EDITOR="vim"

# fzf default options
export FZF_DEFAULT_COMMAND='fd -H --no-ignore . $HOME'
# ctrl-t to insert path from home
export FZF_CTRL_T_COMMAND='fd -H --no-ignore . $HOME'

# Prompt shape
# See man bash > PROMTING

# abbreviate wd in promt with `..`
export PROMPT_DIRTRIM=2 # does not work with bash 3 that ships with OSX

GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

  
if [[ "$OSTYPE" == "darwin"* ]]; then
PS1='\[${GREEN}\][\w] \[${RESET}\]'
else # not macOS
PS1='\[${GREEN}\][\w] \[${RESET}\]'
fi

# MacPorts Installer addition on 2016-08-03_at_10:37:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1

# Aliases

alias ls='ls -F' # ls with directory/symlink indocators (-F) and hidden files (-a)
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

alias Acrobat="launch -a Adobe\ Acrobat"

# MacVim has better display of Arabic characters, also when run in ITerm.
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


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

bind "set completion-ignore-case on"

export PATH="/usr/local/opt/qt/bin:$PATH"

# Fix ruby link in Catalina
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin/:$PATH"
