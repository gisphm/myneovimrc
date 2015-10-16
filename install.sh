#!/bin/sh

mkdir -p ~/.nvim/bundles
mkdir -p ~/.nvim/tmp/sessions
mkdir -p ~/.nvim/tmp/lock
mkdir -p ~/.nvim/tmp/backup
mkdir -p ~/.nvim/tmp/swap
mkdir -p ~/.nvim/tmp/undo
mkdir -p ~/.nvim/tmp/view
[[ -d ~/.nvim/bundles/Vundle.vim/ ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.nvim/bundles/Vundle.vim
nvim +PluginInstall +q +q
