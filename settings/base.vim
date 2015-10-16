" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" 常规设置 {{{

let mapleader=";"
filetype plugin on
set undofile
set incsearch
set ignorecase
set wildmenu
set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch
set wrap
syntax enable
syntax on
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set foldmethod=syntax
set foldenable
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set cc=80
set autochdir
set ai
set smarttab
set splitright
set splitbelow
set acd
set dir=~/.nvim/tmp/swap/
set backup
set backupdir=~/.nvim/tmp/backup/
set undodir=~/.nvim/tmp/undo/
set viewdir=~/.nvim/tmp/view/
set viminfo='10,\"100,:20,n~/.nviminfo
set tags+=./tags,tags
set completeopt=menuone,preview
set concealcursor=nc

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,utf-16e,cp2512,iso-8859-15,latin1
set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set hidden
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

" }}}

" 函数列表 {{{

" 保留光标
" 即执行command命令后光标不会移走
function! Preserve(command)
    let _s=@/
    let l=line(".")
    let c=col(".")
    execute a:command
    let @/=_s
    call cursor(l,c)
endfunction

" 还原光标位置
" 在再次打开文件时，光标仍在上次关闭文件时的位置
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" }}}

" 键盘映射 {{{

inoremap jk <Esc>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-l>
nnoremap <Leader>hw <C-h>
nnoremap <Leader>kw <C-k>
nnoremap <Leader>jw <C-j>

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>


" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" }}}

" 其他 {{{

" 还原上次关闭文件时光标的位置
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" git提交时光标在第一行
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" }}}
