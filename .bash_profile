# add bin folder in ~/dotfiles/ to available commands
export PATH=$PATH:~/dotfiles/bin

export VISUAL="/Applications/MacVim.app/Contents/MacOS/Vim"
export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"

##
# Your previous /Users/andy/.bash_profile file was backed up as /Users/andy/.bash_profile.macports-saved_2016-08-03_at_10:37:22
##

# MacPorts Installer addition on 2016-08-03_at_10:37:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1

alias ls='ls -Fa'
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias mutt='LC_MESSAGES="en_US.UTF-8" neomutt'          # mutt with english menues.
alias date='date +%y%m%d'                               # date with file-type format yymmdd
alias qmv='qmv -f do' # only show output column when using qmv
alias :e 'vim' # because vim


# MacVim has better display of Arabic characters, also when run in ITerm.
# Fuzzy file finding with ctrl-p is much slower from inside ITerm than in MacVim.
# There is no Alt-key in ITerm which makes it difficult to write Arabic transcription.
# alias vim='mvim -v'                                   # Because MacVim has better display of Arabic chars.
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# cd to cd and ls
function cs () {
    cd "$@" && ls
        }
alias cd='cs'

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
