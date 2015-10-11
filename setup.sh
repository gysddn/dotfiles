#!/bin/bash

CWD=$(pwd)

# Bash Config
ln -nfsv $CWD/bash/bashrc $HOME/.bashrc

# Vim Config
ln -nfsv $CWD/vim/vimrc $HOME/.vimrc

# Vim Setup (Vundle)
ln -nfsv $CWD/vim $HOME/.vim
vim +BundleInstall +qall
