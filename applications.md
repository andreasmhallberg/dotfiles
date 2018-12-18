#!/bin/bash

# Install manually first
# - Zotero
# - Quicksilver
# - Spectacle
# - Firefox
#   - Adblock Plus
#   - Adobe Acrobat
#   - Google Analytics Blocker
#   - Tridactyl
#   - Zotero Connector
# - homebrew

# Install via script

# git
brew install git
git config --global user.name "Andreas Hallberg"
git config --global user.email andreasmartenhallberg@gmail.com
git config --global credential.helper osxkeychain

# vim
brew install macvim
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # install vundle
brew install ripgrep # Used to speed up ctrlp plugin in vim.
brew install neomutt
brew install w3m # used in mutt
brew install GnuPG # used in mutt
brew install launch
brew install r 
brew install vlc 
brew install karabiner-elements 
brew install unzip
brew install unrar
brew install mactex
brew install pandoc
brew install pandoc-citeproc
brew install jekyll
brew install ruby # in jekyll
brew install ruby-gems # in jekyll


#creates dotfile symlinks in home

mkdir -p ~/.config/karabiner/karabiner.json
ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
mkdir -p ~/Library/Preferences/qutebrowser/
ln -sf ~/dotfiles/qutebrowser/autoconfig.yml ~/Library/Preferences/qutebrowser/autoconfig.yml
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# mutt
ln -sf ~/dotfiles/.muttrc ~/.muttrc
ln -sf ~/dotfiles/.mailcap ~/.mailcap

# vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/keymap/
ln -sf ~/dotfiles/swe-us_utf-8.vim ~/.vim/keymap/swe-us_utf-8.vim
ln -sf ~/dotfiles/arabic-pc_utf-8.vim ~/.vim/keymap/arabic-pc_utf-8.vim
ln -sf ~/dotfiles/us-altlatin_utf-8.vim ~/.vim/keymap/us-altlatin_utf-8.vim
mkdir -p ~/.vim/spell/
ln -sf ~/dotfiles/sv.utf-8.add ~/.vim/spell/sv.utf-8.add
ln -sf ~/dotfiles/en.utf-8.add ~/.vim/spell/en.utf-8.add
