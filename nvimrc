" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Vundle初始化 {{{

" 关闭文件类型探测，Vundle必须
filetype off

let vundleInitial=1
let vundleReadme=expand('~/.nvim/bundle/Vundle.vim/README.md')
if !filereadable(vundleReadme)
    echo "Installing Vundle ..."
    echo ""
    silent !mkdir -p ~/.nvim/bundle
    silent !mkdir -p ~/.nvim/backup
    silent !mkdir -p ~/.nvim/swap
    silent !mkdir -p ~/.nvim/undo
    silent !mkdir -p ~/.nvim/view
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.nvim/bundle/Vundle.vim/
    let vundleInitial=0
endif

" }}}

" Vundle 的一点设置 {{{

" Vundle的运行时目录
set rtp+=~/.nvim/bundle/Vundle.vim
" 调用Vundle的开始函数
call vundle#begin('~/.nvim/bundle/')

" 调用插件列表
source ~/.nvim/bundles.rc.vim

if vundleInitial == 0
    echo "Installing Bundles, please ignore keymap error messages"
    echo ""
    :PluginInstall
endif

" 调用Vundle的结束函数
call vundle#end()

" 文件类型的缩进探测开启
filetype plugin indent on

" }}}

" 其他 {{{

" 调用neovim自身设置
source ~/.nvim/local.rc.vim
" 调用插件设置
source ~/.nvim/bundles.conf.vim

" }}}
