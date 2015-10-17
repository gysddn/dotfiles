#!/bin/bash

CWD=$(pwd)

# Bash Config
ln -nfsv $CWD/bash/bashrc $HOME/.bashrc

# Tmux Config
ln -nfsv $CWD/tmux/tmux.conf $HOME/.tmux.conf

# Vim Config
ln -nfsv $CWD/vim/vimrc $HOME/.vimrc

# Vim Setup (Vundle)
ln -nfsv $CWD/vim $HOME/.vim
vim +BundleInstall +qall

# Powerline Font
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf -O ~/font.ttf 2> /dev/null
echo "install ~/font.ttf and set it as terminal font to enable powerline symbols in vim"
