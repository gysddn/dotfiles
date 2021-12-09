#!/bin/bash
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$script_dir" || return
folder_name=$(date +"%Y-%m-%d-%T")

create_link() {
  # $1 is the path under this directory
  # $2 is the path to link
if [ -d "$2" ] || [ -f "$2" ]; then
  mkdir -p "$HOME/.backup/$folder_name"
  mv -v "$2" "$HOME/.backup/$folder_name/$(basename $2)"
  rm -rfv "$2"
fi
  ln -sfv "$1" "$2"
}

# Bash config
create_link "$script_dir"/bash/bashrc "$HOME"/.bashrc
# Tmux
create_link "$script_dir"/tmux/tmux.conf "$HOME"/.tmux.conf
# Vim config
create_link "$script_dir"/nvim "$HOME"/.config/nvim
