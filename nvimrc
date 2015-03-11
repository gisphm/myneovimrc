" vim样
set nocompatible
" 关闭文件类型探测，Vundle必须
filetype off

let vundleInitial=1
let vundleReadme=expand('~/.nvim/bundle/Vundle.vim/README.md')
if !filereadable(vundleReadme)
    echo "Installing Vundle ..."
    echo ""
    silent !mkdir -p ~/.nvim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.nvim/bundle/
    let vundleInitial=0
endif

" Vundle的运行时目录
set rtp+=~/.nvim/bundle/Vundle.vim
" 调用Vundle的开始函数
call vundle#begin('~/.nvim/bundle/')

" 调用插件列表
source ~/.nvim/nvimrc.bundles

if vundleInitial == 0
    echo "Installing Bundles, please ignore keymap error messages"
    echo ""
    :PluginInstall
endif

" 调用Vundle的结束函数
call vundle#end()

" 文件类型的缩进探测开启
filetype plugin indent on

" 调用neovim自身设置
source ~/.nvim/nvimrc.local
" 调用插件设置
source ~/.nvim/nvimrc.bundles.local
