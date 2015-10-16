" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" NeoBundle Initialization {{{

if !1 | finish | endif

set runtimepath+=~/.nvim/bundles/neobundle.vim/

call neobundle#begin(expand("~/.nvim/bundles/"))

NeoBundleFetch "Shougo/neobundle.vim"

let vimbundles = '~/.nvim/neobundles/'
for eachbundle in split(globpath(vimbundles, '*.vim'), '\n')
    exe 'source' eachbundle
endfor

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" }}}

" Load Configurations {{{

let bundlesettings = '~/.nvim/settings/'
for eachsetting in split(globpath(bundlesettings, '*.vim'), '\n')
    exe 'source' eachsetting
endfor

" }}}
