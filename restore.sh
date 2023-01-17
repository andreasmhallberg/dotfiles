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

# Set package manager


if [[ "$OSTYPE" =~ ^darwin ]]; then
  pkgman=brew
  # install xcode
  xcode-select --install # xcode
  # install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
elif [[ "$OSTYPE" =~ linux-android ]]; then
  pkgman=pgk
fi

# brew

  # Installations for all *nix systems

mkdir -p ~/tmp # make directory for swap files


# git
$pkgman install git-all
git config --global user.name "Andreas Hallberg"
git config --global user.email andreasmartenhallberg@gmail.com
if [[ "$OSTYPE" =~ ^darwin ]]; then
  git config --global credential.helper osxkeychain
fi

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
$pkgman install w3m # used in mutt
# brew install r # Problems with new Mac processors. Download binary from https://cran.r-project.org/bin/macosx/ instead
$pkgman install coreutils # tac etc.
$pkgman install fd 
$pkgman install rar
$pkgman install rg 
$pkgman install tldr # readable man pages
$pkgman install bat # cat with syntax highlighting
$pkgman install ag
$pkgman install exiftool # extract metadata from ebooks 
$pkgman install ack # grep alternative
$pkgman install unzip
$pkgman install wget
$pkgman install tree
$pkgman install unrar
$pkgman install libxml2 # xml-grep
$pkgman install tmux # needed for R integration in vim with nvim-r
$pkgman install mactex
$pkgman install pandoc
$pkgman install offlineimap
# create a certificate to be linked in offlineimaprc
# openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout private.key -out certificate.crt
$pkgman install pandoc-corssref
$pkgman install ruby # in jekyll
$pkgman install ruby-gems # in jekyll
$pkgman install fzf
$pkgman install kitty
$pkgman install launch
$pkgman install youtube-dl
/usr/local/opt/fzf/install # script to setup fzf keybindings etc.
$pkgman install python3
$pkgman install gcalcli # For issues with login, see https://github.com/insanum/gcalcli/issues/580 

$pkgman tap zegervdv/zathura
$pkgman install zathura
$pkgman install zathura-pdf-mupdf

if [[ "$OSTYPE" =~ ^darwin ]]; then
  mkdir -p $(brew --prefix zathura)/lib/zathura
  ln -s $(brew --prefix zathura-pdf-mupdf)/libpdf-mupdf.dylib $(brew --prefix zathura)/lib/zathura/libpdf-mupdf.dylib
fi

# After ruby
gem install --user-install bundler jekyll
gem install --user-install jekyll-feed
gem install --user-install jekyll-seo-tag

# Python

if [[ "$OSTYPE" =~ ^darwin ]]; then
# installations for OSX
  # qutebrowser
  pip3 install text2qti --user
  pip3 install PyQtWebEngine # requred for qutebrowser
  pip3 install qutebrowser

  mkdir -p ~/Library/Preferences/qutebrowser/
  ln -sf ~/dotfiles/qutebrowser/autoconfig.yml ~/Library/Preferences/qutebrowser/autoconfig.yml
  ln -sf ~/dotfiles/.qutebrowser ~/.qutebrowser

mkdir -p ~/.config/karabiner/
ln -sf ~/dotfiles/karabiner ~/.config/karabiner

  # make ITerm2 do italics
  # https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2#267261
  tic -o ~/dotfiles/.terminfo xterm-256color.terminfo.txt

  # fonts
  ## Latin
  $pkgman tap homebrew/cask-fonts
  $pkgman install svn
  $pkgman install font-source-code-pro
  $pkgman install font-source-sans-pro
  $pkgman install font-source-serif-pro
  $pkgman install font-brill
  $pkgman install font-amiri
  $pkgman install font-libertinus
  $pkgman install font-linux-libertine 
  $pkgman install font-duolos-sil
  $pkgman install font-gentium-plus
  ## Arabic
  $pkgman install font-lateef
  $pkgman install font-scheherazade

fi




#misc

ln -sf kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.offlineimaprc ~/.offlineimaprc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.Rprofile ~/.Rprofile
ln -sf ~/dotfiles/.Renviron ~/.Renviron
ln -sf ~/dotfiles/.xpdfrc ~/.xpdfrc
ln -sf ~/dotfiles/.inputrc ~/.inputrc
mkdir -p ~/.config/nvim/
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim

# mail
mkdir -p ~/.mutt
git clone https://github.com/altercation/mutt-colors-solarized.git ~/.mutt/
$pkgman install mutt
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
$pkgman install bash # to get bash 5. Places it in /usr/local/bin/bash
sudo echo "/usr/local/bin/bash" >> /etc/shells # add to list of shells
chsh -s /usr/local/bin/bash # make default
