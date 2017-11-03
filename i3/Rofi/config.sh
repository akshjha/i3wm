#!/bin/bash

res=$(echo "vim|vimrc|polybar|.zshrc|.Xresources|i3config|theme|rofi" | rofi -sep "|" -dmenu -i -p 'Window Options: ' "")

if [ $res = "vimrc" ]; then
	exec gnome-terminal -- vim ~/.vimrc

elif [ $res = "polybar" ]; then
	exec gnome-terminal -- vim ~/.config/polybar/config

elif [ $res = ".zshrc" ]; then
	exec gnome-terminal -- vim ~/.zshrc

elif [ $res = ".Xresources" ]; then
	exec gnome-terminal -- vim ~/.Xresources

elif [ $res = "i3config" ]; then
	exec gnome-terminal -- vim ~/.config/i3/config

elif [ $res = "theme" ]; then
	exec gnome-terminal -- vim /home/jason/.oh-my-zsh/themes/jasonzsh.zsh-theme

elif [ $res = "vim" ]; then
	exec gnome-terminal -- vim

elif [ $res = "rofi" ]; then
	exec gnome-terminal -- vim +NERDTree .config/i3/Rofi +q

fi