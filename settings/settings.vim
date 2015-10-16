" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" 主题 {{{

colo molokai
let g:molokai_original = 1
let g:rehash256 = 1

" }}}

" indent guides {{{

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" }}}

" Airline {{{

" branch and other extensions
let g:airline#extensions#branch#enabled                 = 1
let g:airline#extensions#branch#format                  = 1
let g:airline#extensions#syntastic#enabled              = 1
let g:airline#extensions#tagbar#enabled                 = 1
let g:airline#extensions#csv#enabled                    = 1
let g:airline#extensions#hunks#enabled                  = 1
let g:airline#extensions#hunks#non_zero_only            = 1
let g:airline#extensions#whitespace#enabled             = 1
let g:airline#extensions#whitespace#checks              = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#trailing_format     = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed[%s]'
let g:airline#extensions#whitespace#symbol              = 'Ξ'
let g:airline#extensions#quickfix#quickfix_text         = 'Qf'
let g:airline#extensions#eclim#enabled                  = 0

" Statusline theme
function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
        for colors in values(a:palette.inactive)
            let colors[3] = 245
        endfor
    endif
endfunction
let g:airline_theme           = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline_mode_map        = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

" Symbols
if !exists('g:airline_symbols')
    let g:airline_symbols        = {}
endif
let g:airline_left_sep           = ''
let g:airline_left_alt_sep       = ''
let g:airline_right_sep          = ''
let g:airline_right_alt_sep      = ''
let g:airline_symbols.linenr     = ''
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch     = ''
let g:airline_symbols.readonly   = ''

" Manually refresh airline when airline doesn't refresh automatically
nnoremap <Leader>ar :AirlineRefresh<CR>
nnoremap <Leader>at :AirlineToggle<CR>

" }}}

" NERDTree {{{

autocmd StdinReadPre * let s:std_in=1
map <C-e> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" }}}

" statusline with git {{{

set statusline=%<%f\
set statusline+=%w%h%m%r
if filereadable(expand('~/.nvim/bundles/vim-fugitive/README.md'))
    set statusline+=%{fugitive#statusline()}
endif
set statusline+=\ [%{&ff}/%Y]
set statusline+=\ [%{getcwd()}]
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

" }}}

" signature {{{

let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "mda",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]'",
            \ 'GotoPrevLineByPos'  :  "['",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "[+",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListLocalMarks'     :  "ms",
            \ 'ListLocalMarkers'   :  "m?"
            \ }

" }}}

" TagBar {{{

let tagbar_left=1
nnoremap <Leader>tl :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_css = {
            \ 'ctagstype' : 'Css',
            \ 'kinds'     : [
            \ 'c:classes',
            \ 's:selectors',
            \ 'i:identities'
            \ ]
            \ }

" }}}

" Syntastic {{{

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:ycm_show_diagnostics_ui = 0

" }}}

" wildfire {{{

map <SPACE>w <Plug>(wildfire-fuel)
vmap <SPACE>w <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" }}}

" UltiSnips {{{

let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<Leader>f"
let g:UltiSnipsJumpBackwardTrigger="<Leader>b"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEditSplit="vertical"

" }}}

" Auto-Pairs {{{

let g:AutoPairsMapSpace       = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0

" }}}

" JSHint2 {{{

let jshint2_command = '/home/vagrant/tools/iojs/bin/jshint'
nnoremap <silent><Space>h :JSHint<CR>
nnoremap <silent><Space>n :lnext<CR>
nnoremap <silent><Space>p :lprevious<CR>
vnoremap <silent><Space>h :JSHint<CR>
vnoremap <silent><Space>n :lnext<CR>
vnoremap <silent><Space>p :lprevious<CR>

"}}}

" emmet-vim {{{

let g:user_emmet_settings = {
            \ 'variables' : {
            \   'lang' : 'en',
            \ },
            \ 'html' : {
            \   'filters' : 'html',
            \   'indentation' : ' ',
            \   'expandos' : {
            \     'ol': 'ol>li',
            \       'list': 'ul>li*3',
            \   },
            \   'default_attributes': {
            \     'a': {'href': ''},
            \     'link': [{'rel': 'stylesheet'}, {'href': ''}],
            \   },
            \   'aliases': {
            \     'bq': 'blockquote',
            \     'obj': 'object',
            \     'src': 'source',
            \   },
            \   'empty_elements': 'area,base,basefont,...,isindex,link,meta,...',
            \   'block_elements': 'address,applet,blockquote,...,li,link,map,...',
            \   'inline_elements': 'a,abbr,acronym,...',
            \   'empty_element_suffix': ' />',
            \ },
            \ 'css' : {
            \   'filters' : 'fc',
            \ },
            \ 'javascript' : {
            \   'snippets' : {
            \     'jq' : "\\$(function() {\n\t${cursor}${child}\n});",
            \     'jq:each' : "\\$.each(arr, function(index, item)\n\t${child}\n});",
            \     'fn' : "(function() {\n\t${cursor}\n})();",
            \     'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
            \   },
            \ },
            \ 'xml' : {
            \   'extends' : 'html',
            \ },
            \ }
let g:user_emmet_install_global = 0
autocmd FileType html,javascript,css EmmetInstall

" }}}

" Signify {{{

let g:signify_vcs_list               = ['git']
let g:signify_cursorhold_insert      = 1
let g:signify_cursorhold_normal      = 1
let g:signify_update_on_bufenter     = 1
let g:signify_update_on_focusgained  = 1
let g:signify_sign_add               = '✚'
let g:signify_sign_delete            = '✖'
let g:signify_sign_delete_first_line = '✭'
let g:signify_sign_change            = '✹'
let g:signify_sign_changedelete      = '➜'
" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
" highlight signs in Sy
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
nnoremap <silent> <leader>gg :SignifyToggle<CR>
nmap <Leader>gj <Plug>(signify-next-hunk)
nmap <Leader>gk <Plug>(signify-prev-hunk)

" }}}

" Autoformat {{{

noremap <silent> <Space>f :Autoformat<CR>

" }}}

" Tabularize {{{

nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" }}}

" Markdown {{{

augroup MarkdownFiles
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" }}}

" Unite.vim {{{

let g:unite_prompt                        = '» '
let g:unite_split_rule                    = 'botright'
if executable('ag')
    let g:unite_source_grep_command       = 'ag'
    let g:unite_source_grep_default_opts  = '--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    let g:unite_source_grep_command       = 'pt'
    let g:unite_source_grep_default_opts  = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding      = 'utf-8'
endif
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
nnoremap <Leader>p :<C-u>Unite -winheight=10 -buffer-name=file file_rec/async<cr>
nnoremap <Space>/ :<C-u>Unite -winheight=10 -buffer-name=search grep:.<CR>
nnoremap <Space>s :<C-u>Unite -winheight=10 -buffer-name=buffers -quick-match buffer<cr>
nnoremap <leader>y :<C-u>Unite -winheight=10 -buffer-name=yank history/yank<cr>
nnoremap <Space>u :<C-u>Unite -winheight=10 -buffer-name=outline outline<CR>
nnoremap <Space>g :Unite -winheight=10 -buffer-name=goimport go/import<CR>

" }}}

" vim-clang {{{

let g:clang_c_completeopt = 'longest,menuone'
let g:clang_cpp_options = '-std=c++11'
let g:clang_cpp_completeopt = 'longest,menuone'
let g:clang_format_auto = 1
let g:clang_format_style = 'LLVM'
let g:clang_vim_exec = 'nvim'

" }}}

" completion {{{

set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

imap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

inoremap <expr> 'pumvisible() ? deoplete#mappings#close_popup() : "'"

" }}}
