set nocompatible
filetype off

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle/')

source ~/.nvim/nvimrc.bundles

call vundle#end()

filetype plugin indent on

source ~/.nvim/nvimrc.local
source ~/.nvim/nvimrc.bundles.local
