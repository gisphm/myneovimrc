#!/bin/sh

mkdir -p ~/.config/nvim/bundles
mkdir -p ~/.config/nvim/tmp/sessions
mkdir -p ~/.config/nvim/tmp/lock
mkdir -p ~/.config/nvim/tmp/backup
mkdir -p ~/.config/nvim/tmp/swap
mkdir -p ~/.config/nvim/tmp/undo
mkdir -p ~/.config/nvim/tmp/view
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
