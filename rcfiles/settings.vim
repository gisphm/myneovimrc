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

function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
        for colors in values(a:palette.inactive)
            let colors[3] = 245
        endfor
    endif
endfunction
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=0
let g:airline_mode_map = {
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
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
nnoremap <Leader>ar :AirlineRefresh<CR>

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

" YouCompleteMe {{{

let g:ycm_complete_in_comments=1
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf='~/.nvim/ycm_extra_conf.py'
inoremap <leader>; <C-x><C-o>
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_cache_omnifunc = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \ }
let g:ycm_filetype_specific_completion_to_disable = {
            \ }
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>

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

" CtrlP and CtrlPFunky {{{

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_show_hidden=1
let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
let g:ctrlp_mruf_save_on_update = 1
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
            \ }
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>pu :CtrlPFunky <CR>
nnoremap <Leader>fu :execute 'CtrlPFunky' . expand('<cword>') <CR>

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
