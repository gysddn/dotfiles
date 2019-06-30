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

# Xorg config(s)
ln -sfv $script_dir/xorg/xinitrc $HOME/.xinitrc
ln -sfv $script_dir/xorg/Xmodmap $HOME/.Xmodmap
ln -sfv $script_dir/xorg/Xresources $HOME/.Xresources

# i3 config
if [ ! -d $HOME/.config/i3 ]; then
	mkdir -p $HOME/.config/i3
fi
ln -sfv $script_dir/i3/config $HOME/.config/i3/config

# Install vim plugins
vim +BundleInstall +qall
