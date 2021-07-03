#!/bin/bash

# Make linux compatible
  # https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script

# Install manually first
# - Zotero
# - Spectacle - shortcuts for window management on multi-screens
# - Qutebrowser
# - Karabiner Elements
# - Homebrew
# - MacTex  - http://tug.org/mactex/mactex-download.html
#           - update texlive when installed to get most resent packages
# brow

# Install fonts
  # LateefGR
  # Linux Libertine O
  # Amiri
  # Source Code Pro
  # Source Sans Pro

  # Installations for all *nix systems


mkdir -p ~/tmp # make directory for swap files

xcode-select --install # xcode

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# git
brew install git-all
git config --global user.name "Andreas Hallberg"
git config --global user.email andreasmartenhallberg@gmail.com
git config --global credential.helper osxkeychain


#get my dotfiles
git clone https://github.com/andreasmhallberg/dotfiles.git ~/

#get blog
git clone https://github.com/andreasmhallberg/andreasmhallberg.github.io.git ~/blog/

#get citation styles
git clone https://github.com/citation-style-language/styles.git ~/citation-styles/



# vim
mkdir -p ~/.vim/temp # make directory for swap files
# brew install macvim  # install manually instead
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # install vundle
brew install w3m # used in mutt
brew install r 
brew install coreutils # tac etc.
brew install fd 
brew install rg 
brew install tldr # readable man pages
brew install bat # cat with syntax highlighting
brew install ag
brew install exiftool # extract metadata from ebooks 
brew install ack # grep alternative
brew install unzip
brew install wget
brew install tree
brew install unrar
brew install libxml2 # xml-grep
brew install tmux # needed for R integration in vim with nvim-r
brew install mactex
brew install pandoc
brew install offlineimap
# create a certificate to be linked in offlineimaprc
# openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout private.key -out certificate.crt
brew install pandoc-corssref
brew install ruby # in jekyll
brew install ruby-gems # in jekyll
brew install fzf
brew install launch
brew install youtube-dl
/usr/local/opt/fzf/install # script to setup fzf keybindings etc.
brew install python3
brew install gcalcli # For issues with login, see https://github.com/insanum/gcalcli/issues/580 

brew tap zegervdv/zathura
brew install zathura
brew install zathura-pdf-mupdf
mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-mupdf)/libpdf-mupdf.dylib $(brew --prefix zathura)/lib/zathura/libpdf-mupdf.dylib

# After ruby
gem install --user-install bundler jekyll
gem install --user-install jekyll-feed
gem install --user-install jekyll-seo-tag

# Python
pip3 install text2qti --user
pip3 install PyQtWebEngine # requred for qutebrowser
pip3 install qutebrowser

# installations for OSX
mkdir -p ~/.config/karabiner/
ln -sf ~/dotfiles/karabiner ~/.config/karabiner


# make ITerm2 do italics
# https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2#267261
tic -o ~/dotfiles/.terminfo xterm-256color.terminfo.txt

# fonts
brew tap homebrew/cask-fonts
brew install svn
brew install font-source-code-pro
brew install font-source-sans-pro
brew install font-brill
brew install font-amiri
brew install font-linux-libertine 
brew install font-lateef


#misc

ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.offlineimaprc ~/.offlineimaprc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash
mkdir -p ~/Library/Preferences/qutebrowser/
ln -sf ~/dotfiles/qutebrowser/autoconfig.yml ~/Library/Preferences/qutebrowser/autoconfig.yml
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.qutebrowser ~/.qutebrowser
ln -sf ~/dotfiles/.Rprofile ~/.Rprofile
ln -sf ~/dotfiles/.Renviron ~/.Renviron
ln -sf ~/dotfiles/.xpdfrc ~/.xpdfrc
ln -sf ~/dotfiles/.inputrc ~/.inputrc
mkdir -p ~/.config/nvim/
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim

# mail
mkdir -p ~/.mutt
git clone https://github.com/altercation/mutt-colors-solarized.git ~/.mutt/
brew install mutt
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
# run :VundleInstall


# install R-packages
# may need to run with `sudo -i r` to fix non-zero exit status
# https://stackoverflow.com/questions/35666638/cant-access-user-library-in-r-non-zero-exit-status-warning
Rscript r-packages.r

# Jekyll stuff
gem install --user-install bundler jekyll # Install jekyll
gem install bundler jekyll
gem install jekyll-sitemap
gem install jekyll-seo-tag

# Set bash 5 as default
brew install bash # to get bash 5. Places it in /usr/local/bin/bash
sudo echo "/usr/local/bin/bash" >> /etc/shells # add to list of shells
chsh -s /usr/local/bin/bash # make default
