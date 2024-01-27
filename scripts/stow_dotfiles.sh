#!/usr/bin/env zsh


if [ -e "$HOME/.profile" ] && [ ! -L "$HOME/.profile" ]; then
    rm "$HOME/.profile"
fi

if [ -e "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
fi


if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="profile,zsh,i3,polybar,alacritty,polybar,nvim,tmux,Code,zathura"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/dotfiles
fi


pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done
popd
