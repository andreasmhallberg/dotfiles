export PATH=$PATH:~/dotfiles/bin

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
alias mutt='LC_MESSAGES="en_US.UTF-8" mutt' # mutt with english menues.
alias date='date +%y%m%d' # date with file-type format yymmdd 

# cs to cd and ls
function cs () {
    cd "$@" && ls
        }
alias cd='cs'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
