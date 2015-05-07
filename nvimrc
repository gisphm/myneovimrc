" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Vundle初始化 {{{

" 关闭文件类型探测，Vundle必须
filetype off

" }}}

" Vundle 的一点设置 {{{

" Vundle的运行时目录
set rtp+=~/.nvim/bundles/Vundle.vim
" 调用Vundle的开始函数
call vundle#begin('~/.nvim/bundles/')

" 调用插件列表
source ~/.nvim/rcfiles/bundles.vim

" 调用Vundle的结束函数
call vundle#end()

" 文件类型的缩进探测开启
filetype plugin indent on

" }}}

" 其他 {{{

source ~/.nvim/rcfiles/base.vim
source ~/.nvim/rcfiles/settings.vim

" }}}
