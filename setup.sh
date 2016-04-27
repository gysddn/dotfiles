#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# Init submodules
git submodule update --init --recursive

# Bash config
ln -nfsv bash/bashrc $HOME/.bashrc

# Tmux config
ln -nfsv tmux/tmux.conf $HOME/.tmux.conf

# Vim config
ln -nfsv vim/vimrc $HOME/.vimrc
ln -nfsv vim $HOME/.vim

# Install vim plugins
vim +BundleInstall +qall

