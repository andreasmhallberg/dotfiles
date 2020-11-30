#!/bin/bash

# run this with sudo

# Make linux compatible
    # https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script

if [[ "$OSTYPE" == "darwin"* ]]; then # Mac OSX
        pkgman=brew
# elif [[ "$OSTYPE" == "linux-gnu" ]]; then # linux
        # pkgman=apt-get
      else
        pkgman=apt-get

fi

# Install manually first
# - Zotero
# - MacVim
# - Quicksilver - fuzzy application launcher
# - Spectacle - shortcuts for window management on multi-screens
# - Qutebrowser
# - Homebrew
# - MacTex  - http://tug.org/mactex/mactex-download.html
#           - update texlive when installed to get most resent packages

# Install fonts
  # LateefGR
  # Linux Libertine O
  # Amiri
  # Source Code Pro
  # Source Sans Pro

  # Installations for all *nix systems


# git

$pkman install git-all
git config --global user.name "Andreas Hallberg"
git config --global user.email andreasmartenhallberg@gmail.com
if [[ "$OSTYPE" == "darwin"* ]]; then # Mac OSX
  git config --global credential.helper osxkeychain
fi


#get my dotfiles
git clone https://github.com/andreasmhallberg/dotfiles.git ~/

#get blog
git clone https://github.com/andreasmhallberg/andreasmhallberg.github.io.git ~/blog/


# config symlinks

# vim
mkdir -p ~/.vim/temp # make directory for swap files
# brew install macvim  # install manually instead
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # install vundle
$pkman install w3m # used in mutt
$pkman install r 
$pkman install coreutils # tac etc.
$pkman install fd 
$pkman install tldr # readable man pages
$pkman install bat # cat with syntax highlighting
$pkman install ag
$pkman install ack # grep alternative
$pkman install unzip
$pkman install unrar
$pkman install libxml2 # xml-grep
$pkman install tmux # needed for R integration in vim with nvim-r
if [[ "$OSTYPE" == "darwin"* ]]; then # Mac OSX
  $pkman install mactex
fi
$pkman install xpdf
$pkman install pandoc
$pkman install pandoc-citeproc
$pkman install jekyll
$pkman install ruby # in jekyll
$pkman install ruby-gems # in jekyll
$pkman install fzf
/usr/local/opt/fzf/install # script to setup fzf keybindings etc.
$pkman install python3

# Python
python3 -m pip install text2qti --user


# installations for OSX
if [[ "$OSTYPE" == "darwin"* ]]; then # Mac OSX

  mkdir -p ~/.config/karabiner/
  ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/

  $pkman install launch

  xcode-select --install # xcode. Requiered by nvim-r

  # make ITerm2 do italics
  # https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2#267261
  tic -o ~/.terminfo xterm-256color.terminfo.txt

  # fonts
  brew tap homebrew/cask-fonts && brew cask install font-source-code-pro

fi

#misc

ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash
mkdir -p ~/Library/Preferences/qutebrowser/
ln -sf ~/dotfiles/qutebrowser/autoconfig.yml ~/Library/Preferences/qutebrowser/autoconfig.yml
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.qutebrowser ~/.qutebrowser
ln -sf ~/dotfiles/.Rprofile ~/.Rprofile
ln -sf ~/dotfiles/.xpdfrc ~/.xpdfrc
ln -sf ~/dotfiles/.inputrc ~/.inputrc

# mutt
mkdir -p ~/.mutt
git clone https://github.com/altercation/mutt-colors-solarized.git ~/.mutt/
$pkman install mutt
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


