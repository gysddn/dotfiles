#!/bin/bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

# Init submodules
git submodule update --init --recursive

# Bash config
ln -sfv $script_dir/bash/bashrc $HOME/.bashrc

# Tmux config
ln -sfv $script_dir/tmux/tmux.conf $HOME/.tmux.conf

# Vim config
ln -sfv $script_dir/vim/vimrc $HOME/.vimrc
ln -sfv $script_dir/vim $HOME/.vim

# Install vim plugins
vim +BundleInstall +qall
