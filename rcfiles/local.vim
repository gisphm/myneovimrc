" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" 常规设置 {{{

" 快捷键的前缀
let mapleader=";"
" 根据vim自身侦测到的文件类型加载相应插件
filetype plugin on

" 开启撤销
set undofile
" 实时搜索
set incsearch
" 搜索时对大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu
" 显示状态栏
set laststatus=2
" 显示标尺
set ruler
" 行号
set number
" 高亮当前行
set cursorline
" 高亮当前列
set cursorcolumn
" 高亮搜索
set hlsearch
" 自动折行
set wrap
" 开启语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 按文件类型缩进
filetype indent on
" 将制表符扩展成空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4
" 基于缩进进行代码折叠
set foldmethod=syntax
" 启动vim开启折叠代码
set foldenable
" 开启vim时的控制台颜色可显示数量
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
" 高亮第80列
set cc=80
" 自动切换目录
set autochdir
" 自动缩进
set ai
" 自动制表符
set smarttab
" 新分割的窗体在右侧
set splitright
" 新分割的窗体在下面
set splitbelow
" 自动切换路径
set acd
" 交换文件夹位置
set dir=~/.nvim/tmp/swap/
" 开启备份
set backup
" 备份文件夹位置
set backupdir=~/.nvim/tmp/backup/
" 撤销文件夹位置
set undodir=~/.nvim/tmp/undo/
" 设置视图保存位置
set viewdir=~/.nvim/tmp/view/
" 记录nvim编辑文件的信息
set viminfo='10,\"100,:20,n~/.nviminfo
" 设置tags文件位置
" cd /usr/include/c++/4.9.2
" run ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
" cd /usr/include
" run ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags
set tags+=./tags,tags,~/.nvim/sys.tags,~/.nvim/stdcpp.tags
" 设置补全的选项
set completeopt=menuone,preview

" nvim可打开的文件编码列表
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,utf-16e,cp2512,iso-8859-15,latin1

" 避免出问题时要点击回车
set shortmess+=filmnrxoOtT
" 兼容性更强（在编辑vim脚本时）
set viewoptions=folds,options,cursor,unix,slash
" 允许光标越过最后一个字符
set virtualedit=onemore
" 历史文件数量
set history=1000
" 允许缓冲跳转不需要保存
set hidden
" 关键字
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
" 行首
nmap lb 0
" 行末
nmap le $
" 关闭当前分割窗口
nmap <Leader>q :q<CR>
" 保存当前分割窗口
nmap <Leader>w :w<CR>
" 保存所有窗口内容并退出
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转到右、左、上、下方的窗口
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j

" 消除行末空白
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" 格式化文本
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
