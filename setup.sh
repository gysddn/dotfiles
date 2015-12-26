#!/bin/bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Bash config
ln -nfsv $script_dir/bash/bashrc $HOME/.bashrc

# Tmux config
ln -nfsv $script_dir/tmux/tmux.conf $HOME/.tmux.conf

# Vim config
ln -nfsv $script_dir/vim/vimrc $HOME/.vimrc
ln -nfsv $script_dir/vim $HOME/.vim

# Init submodules and install vim plugins
git submodule update --init --recursive
vim +BundleInstall +qall
python2 .dotfiles/vim/bundle/YouCompleteMe/install.py --clang-completer

