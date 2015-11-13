" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" NeoBundle Initialization {{{

if !1 | finish | endif

set runtimepath+=~/.config/nvim/bundles/neobundle.vim/

call neobundle#begin(expand("~/.config/nvim/bundles/"))

NeoBundleFetch "Shougo/neobundle.vim"
source ~/.config/nvim/neobundles.vim

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" }}}

" Load Configurations {{{

source ~/.config/nvim/settings/base.vim
source ~/.config/nvim/settings/settings.vim

" }}}
