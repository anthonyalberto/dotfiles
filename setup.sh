#!/usr/bin/env bash
brew install zsh zsh-syntax-highlighting
chsh -s /usr/local/bin/zsh
cd ~/.dotfiles
cp Monaco+for+Powerline.otf ~/Library/Fonts/
cd ~
ln -s .dotfiles/* .
ln -s .dotfiles/.* .
ln -s ~/.dotfiles/scripts/* /usr/local/bin/
