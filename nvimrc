" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Vundle初始化 {{{

" 关闭文件类型探测，Vundle必须
filetype off

" }}}

" Vundle 的一点设置 {{{

if filereadable(expand('~/.nvim/bundles/Vundle.vim/README.md'))
    set rtp+=~/.nvim/bundles/Vundle.vim
    call vundle#begin('~/.nvim/bundles/')

    if filereadable(expand('~/.nvim/rcfiles/bundles.vim'))
        source ~/.nvim/rcfiles/bundles.vim
    endif

    call vundle#end()
endif

filetype plugin indent on

" }}}

" 其他 {{{

if filereadable(expand('~/.nvim/rcfiles/base.vim'))
    source ~/.nvim/rcfiles/base.vim
endif
if filereadable(expand('~/.nvim/rcfiles/settings.vim'))
    source ~/.nvim/rcfiles/settings.vim
endif

" }}}
