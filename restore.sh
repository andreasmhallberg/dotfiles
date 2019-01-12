#!/bin/bash

# Make linux compatible
    # https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script

# if [[ "$OSTYPE" == "linux-gnu" ]]; then # linux
#         pkgmanager=apt-get
# elif [[ "$OSTYPE" == "darwin"* ]]; then # Mac OSX
#         pkgmanager=brew
# fi

# Install manually first
# - Zotero
# - MacVim
# - Quicksilver - fuzzy application launcher
# - Spectacle - shortcuts for window management on multi-screens
# - Firefox
#   - Adblock Plus
#   - Adobe Acrobat
#   - Google Analytics Blocker
#   - Tridactyl
#   - Zotero Connector
# - Qutebrowser
# - Homebrew
# - MacTex  - http://tug.org/mactex/mactex-download.html
#           - update texlive when installed to get most resent packages

# Install via script

# git
brew install git
git config --global user.name "Andreas Hallberg"
git config --global user.email andreasmartenhallberg@gmail.com
git config --global credential.helper osxkeychain


#get my dotfiles
git clone https://github.com/andreasmhallberg/dotfiles.git ~/

#get blog
git clone https://github.com/andreasmhallberg/andreasmhallberg.github.io.git ~/blog/

# fonts
brew tap homebrew/cask-fonts && brew cask install font-source-code-pro


# config symlinks

# vim
mkdir -p ~/.vim/temp # make directory for swap files
# brew install macvim  # install manually instead
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # install vundle
brew install mutt
brew install w3m # used in mutt
brew install GnuPG # used in mutt
brew install launch
brew install r 
brew install ack # grep alternative
brew install unzip
brew install unrar
brew install tmux # needed for R integration in vim with nvim-r
brew install mactex
brew install pandoc
brew install pandoc-citeproc
brew install jekyll
brew install ruby # in jekyll
brew install ruby-gems # in jekyll
brew install fzf
/usr/local/opt/fzf/install # script to setup keybindings etc.

#misc

xcode-select --install # xcode. Requiered by nvim-r

mkdir -p ~/.config/karabiner/
ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash
mkdir -p ~/Library/Preferences/qutebrowser/
ln -sf ~/dotfiles/qutebrowser/autoconfig.yml ~/Library/Preferences/qutebrowser/autoconfig.yml
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.qutebrowser ~/.qutebrowser
ln -sf ~/dotfiles/.Rprofile ~/.Rprofile

# mutt
mkdir -p ~/.mutt
ln -sf ~/dotfiles/.muttrc ~/.muttrc
ln -sf ~/dotfiles/.mailcap ~/.mailcap
ln -sf ~/jobb/aliases ~/.mutt/aliases

# vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/keymap/
ln -sf ~/dotfiles/swe-us_utf-8.vim ~/.vim/keymap/swe-us_utf-8.vim
ln -sf ~/dotfiles/arabic-pc_utf-8.vim ~/.vim/keymap/arabic-pc_utf-8.vim
ln -sf ~/dotfiles/us-altlatin_utf-8.vim ~/.vim/keymap/us-altlatin_utf-8.vim
mkdir -p ~/.vim/spell/
ln -sf ~/dotfiles/sv.utf-8.add ~/.vim/spell/sv.utf-8.add
ln -sf ~/dotfiles/en.utf-8.add ~/.vim/spell/en.utf-8.add
