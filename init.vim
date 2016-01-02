" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Plugin Manager Initialization {{{

call plug#begin(expand("~/.config/nvim/plugged/"))
source ~/.config/nvim/plugs.vim
call plug#end()

" }}}

" Load Configurations {{{

source ~/.config/nvim/settings/base.vim
source ~/.config/nvim/settings/plugs.vim

" }}}
