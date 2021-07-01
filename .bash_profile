# Must come before fzf-stuff are sourced
set -o vi

# type only directory name to cd to it
shopt -s autocd

# Set pbcopy to use Unicode
export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100

export LC_CTYPE="en_US.UTF-8"

[[ -s ~/.bashrc ]] && source ~/.bashrc

# add bin folder in ~/dotfiles/ to available commands
export PATH=$PATH:~/dotfiles/bin
export PATH=$PATH:~/dotfiles/bin/textanalysis
export PATH=$PATH:/Users/xhalaa/Library/Python/3.7/bin
export PATH=$PATH:/bin

source ~/.fzf.bash

export VISUAL="vim"
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config/"

# fzf default options
export FZF_DEFAULT_COMMAND='fd -H --no-ignore . $HOME' 
  # -H include hidden files
# ctrl-t to insert path from home
export FZF_CTRL_T_COMMAND='fd -H --no-ignore . $HOME'


# abbreviate wd in promt with `..`
export PROMPT_DIRTRIM=2 # does not work with bash 3 that ships with OSX

GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

# Prompt  
  # \e[32m = green
  # \e[31m = red
  # \e[39m = default
  # Non-printable characters must be wrapped in `\[ \]`

PS1='\[\e[32m\]\w [\[\e[31m\]$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[32m\]] \[\e[39m\]'


# MacPorts Installer addition on 2016-08-03_at_10:37:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1

# Aliases

alias todo="$EDITOR ~/jobb/notes/todo.md"
alias todol='todolist'

function todolist () {
  rg --no-line-number '^#|\- \[ \]' ~/jobb/notes/todo.md | \
  sed -E 's/ - //'
}

## Passive
alias ls='ls -F' # ls with directory/symlink indocators (-F) and hidden files (-a)
# Do ls after cd
function cs () {
    cd "$@" && ls
        }
alias cd='cs'

alias mutt='LC_MESSAGES="en_US.UTF-8" mutt'          # mutt with english menues.
alias m="mutt"
alias date='date +%y%m%d'                               # date with file-type format yymmdd
alias qmv='qmv -f do' # only show output column when using qmv
alias vim="mvim -v"
alias n="nvim"
alias e="nvim"
alias :e='nvim'
alias v="nvim -R"

# git
alias gc='git checkout'
alias gb='git branch'
alias gs='git status'
alias gl='git log --graph --oneline --all'

alias z="zathurafullscreen"
alias zathurafullscreen="zathura --mode=fullscreen"
alias acrobat="launch -a Adobe\ Acrobat\ Reader\ DC"

alias gcal="gcalcli"
alias agenda="gcalcli agenda --details end"
alias calw="gcalcli calw --details end --monday"

# There is no Alt-key in ITerm which makes it difficult to write Arabic transcription.

# OSX only
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
  alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
fi




# Correct minor spelling mistakes in cd command
shopt -s cdspell


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

bind "set completion-ignore-case on"

export PATH="/usr/local/opt/qt/bin:$PATH"

# Fix ruby link in Catalina
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# Bindings

bind '"\C-f":"open_with_fzf\n"'
bind '"\C-v":"nvim "$(fzf)"\n"'
bind '"\C-d":"cd $(fd -t d -H . $HOME | fzf)\n"'

open_with_fzf() {
  file="$(fd -t f -H . $HOME | fzf)"
  if [[ $file == *.pdf ]]
  then
    z $file
  else
    open $file
  fi
}

cd ~/jobb
clear
todol
eval "$(/opt/homebrew/bin/brew shellenv)"
