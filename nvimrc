" vim样
set nocompatible
" 关闭文件类型探测，Vundle必须
filetype off

" Vundle的运行时目录
set rtp+=~/.nvim/bundle/Vundle.vim
" 调用Vundle的开始函数
call vundle#begin('~/.nvim/bundle/')

" 调用插件列表
source ~/.nvim/nvimrc.bundles

" 调用Vundle的结束函数
call vundle#end()

" 文件类型的缩进探测开启
filetype plugin indent on

" 调用neovim自身设置
source ~/.nvim/nvimrc.local
" 调用插件设置
source ~/.nvim/nvimrc.bundles.local
