" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" NeoBundle or Vim-Plug {{{

" Two value, 0 or 1
" 0 : NeoBundle
" 1 : Vim-Plug
if !exists('g:custom_plugin_manager')
    let g:custom_plugin_manager = 1
endif

if filereadable(expand("~/.vim/local.vim"))
    source ~/.vim/local.vim
endif

" }}}

" Plugin Manager Initialization {{{

if g:custom_plugin_manager == 0
    if !1 | finish | endif
    set runtimepath+=~/.config/nvim/bundles/neobundle.vim/
    call neobundle#begin(expand("~/.config/nvim/bundles/"))
    NeoBundleFetch "Shougo/neobundle.vim"
    source ~/.config/nvim/neobundles.vim
    call neobundle#end()
    filetype plugin indent on
    NeoBundleCheck
else
    call plug#begin(expand("~/.config/nvim/plugged/"))
    source ~/.config/nvim/plugs.vim
    call plug#end()
endif

" }}}

" Load Configurations {{{

source ~/.config/nvim/settings/base.vim
source ~/.config/nvim/settings/settings.vim

" }}}
