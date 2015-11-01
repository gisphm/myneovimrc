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

" Vimfiler {{{

map <C-e> :VimFilerExplorer<CR>
let g:vimfiler_as_default_explorer     = 1
let g:loaded_netrwPlugin               = 1
let g:vimfiler_define_wrapper_commands = 1
let g:vimfiler_tree_leaf_icon          = "→"
let g:vimfiler_readonly_file_icon      = ''
let g:vimfiler_marked_file_icon        = "✓"
let g:vimfiler_tree_opened_icon        = "▾"
let g:vimfiler_tree_closed_icon        = "▸"
let g:vimfiler_file_icon               = "✎"
let g:vimfiler_max_directories_history = 100
let g:vimfiler_ignore_pattern          = '\%(\.hg\|\.svn\|\.git\)$'

let g:vimfiler_enable_clipboard = 0
call vimfiler#custom#profile('default', 'context', {
            \ 'safe' : 0,
            \ 'auto_expand' : 1,
            \ 'parent' : 0,
            \ 'explorer' : 1
            \ })

function! s:vimfiler_my_settings() abort
    nnoremap <silent><buffer> J
                \ <C-u>:Unite -buffer-name=files -default-action=lcd directory mru<CR>
    nmap <buffer> p <Plug>(vimfiler_quick_look)
    nmap <buffer> <Tab> <Plug>(vimfiler_switch_to_other_window)
    nnoremap <silent><buffer><expr> v
                \ vimfiler#do_switch_action('vsplite')
    nnoremap <silent><buffer><expr> s
                \ vimfiler#do_switch_action('split')
    if !empty(unite#get_filters('matcher_migemo'))
        nnoremap <silent><buffer><expr> / line('$') > 10000 ? 'g/' :
                    \ ":\<C-u>Unite -buffer-name=search -start-insert line_migemo\<CR>"
    endif
endfunction
augroup VimFilerSetting
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END

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

" custom call {{{2

call unite#custom#source(
            \ 'buffer,file_rec,file_rec/async,file_rec/git',
            \ 'matchers',
            \ ['converter_relative_word',
            \  'matcher_fuzzy',
            \  'matcher_project_ignore_files']
            \ )
call unite#custom#source(
            \ 'file_mru',
            \ 'mathers',
            \ ['matcher_project_files',
            \  'matcher_fuzzy',
            \  'matcher_hide_hidden_files',
            \  'matcher_hide_current_file']
            \ )
call unite#custom#source(
            \ 'file_rec,file_rec/async,file_rec/git,file_mru',
            \ 'converters',
            \ ['converter_file_directory']
            \ )

call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom#profile('default', 'context', {
            \ 'start_insert' : 0,
            \ 'winheight' : 10,
            \ 'direction' : 'botright',
            \ 'short_source_names' : 1,
            \})

" }}}2

" unite common {{{2

let g:unite_enable_auto_select            = 0
let g:unite_prompt                        = '» '
let g:unite_source_rec_max_cache_files    = -1
if executable('ag')
    let g:unite_source_grep_command       = 'ag'
    let g:unite_source_grep_default_opts  =
                \ '-i --line-numbers --nocolor --nogroup --hidden ' .
                \ '--ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command  =
                \ ['ag', '--follow', '--nocolor', '--nogroup',
                \  '--hidden', '-g', '']
elseif executable('hw')
    let g:unite_source_grep_command       = 'hw'
    let g:unite_source_grep_default_opts  = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
endif

" }}}2

" normal mappings {{{2

nnoremap [unite] <Nop>
nmap <Space>u [unite]

nnoremap [unite]f :<C-u>Unite source<CR>
nnoremap <silent> [unite]r
            \ :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c
            \ :<C-u>UniteWithCurrentDir -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]b
            \ :<C-u>UniteWithBufferDir -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]y
            \ :<C-u>Unite -auto-resize -buffer-name=yank history/yank<CR>
nnoremap <silent> [unite]m
            \ :<C-u>Unite -auto-resize -buffer-name=recent file_mru<CR>
nnoremap <silent> [unite]q
            \ :<C-u>Unite -auto-resize -buffer-name=buffers -quick-match buffer<CR>
nnoremap <silent> [unite]o
            \ :<C-u>Unite -auto-resize -buffer-name=outline outline<CR>
nnoremap <silent> [unite]p
            \ :<C-u>Unite -auto-resize -buffer-name=tabpages tab<CR>
nnoremap <silent> [unite]n
            \ :<C-u>Unite -auto-resize -buffer-name=search grep:.<CR>
nnoremap <silent> [unite]t
            \ :<C-u>UniteWithCursorWord -immediately tag/include<CR>
nnoremap <silent> [unite]j
            \ :<C-u>Unite -auto-resize -buffer-name=jump jump<CR>
nnoremap <silent> [unite]s
            \ :<C-u>Unite -buffer-name=files -no-split
            \ jump_point file_point buffer_tab
            \ file_rec:! file file/new <CR>
nnoremap <silent> <C-p>
            \ :<C-u>Unite -auto-resize -buffer-name=search file_rec/neovim<CR>
nnoremap <silent> <Leader>b
            \ :<C-u>Unite -auto-resize -buffer-name=buffers buffer<CR>

nnoremap <silent> <Space>n :UniteNext<CR>
nnoremap <silent> <Space>p :UnitePrevious<CR>
nnoremap <silent> <Leader>d :UniteClose<CR>

" }}}2

" unite function {{{2

autocmd FileType unite call <SID>unite_my_settings()
function! s:unite_my_settings()"
    " Overwrite settings.

    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_jump)")
    nmap <buffer> x     <Plug>(unite_quick_match_jump)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction

" }}}2

" }}}

" YouCompleteMe {{{

let g:ycm_complete_in_comments=1
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf='~/.config/nvim/ycm_extra_conf.py'
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

" Ploygot {{{

let g:polyglot_disabled = [ 'javascript' ]

" }}}

" Startify {{{

" Common {{{2

let g:startify_relative_path          = 0
let g:startify_files_number           = 5
let g:startify_session_persistence    = 0
let g:startify_session_autoload       = 0
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir          = 1
let g:startify_change_to_vcs_root     = 1
let g:startify_enable_special         = 1
let g:startify_enable_unsafe          = 0
let g:startify_session_dir            = '~/.config/nvim/session'
let g:startify_list_order             = [
            \ ['MRU'], 'files',
            \ ['Sessions'], 'sessions',
            \ ]
let g:startify_skiplist               = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '^/tmp',
            \ '/home/vagrant/tools',
            \ ]
autocmd FileType startify
            \ setlocal colorcolumn= nospell

" }}}2

" Custom Header and Footer {{{2

let s:mud_horse_1 = [
            \ ' ┏┓   ┏┓',
            \ '┏┛┻━━━┛┻┓',
            \ '┃       ┃',
            \ '┃   ━   ┃',
            \ '┃＞   ＜┃',
            \ '┃       ┃',
            \ '┃ . ⌒ ..┃',
            \ '┃       ┃',
            \ '┗━┓   ┏━┛',
            \ '  ┃   ┃ Codes are far away from bugs with the animal protecting',
            \ '  ┃   ┃    神兽保佑, 代码无 bug',
            \ '  ┃   ┃',
            \ '  ┃   ┗━━━┓',
            \ '  ┃       ┣┓',
            \ '  ┃       ┏┛',
            \ '  ┗┓┓┏━┳┓┏┛',
            \ '   ┃┫┫ ┃┫┫',
            \ '   ┗┻┛ ┗┻┛',
            \ ]

" }}}3

function! s:center_header(lines) abort
    let l:longest_line = max(map(copy(a:lines), 'len(v:val)'))
    let l:centered_line = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (l:longest_line / 2)) . v:val')
    return l:centered_line
endfunction

function! s:RandomVim() abort
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

" function! RandomSystem() abort
"     return system('echo $RANDOM')
" endfunction

function! s:RandomHeader() abort
    if executable('fortune') && executable('cowthink')
        let l:headerIndex=s:RandomVim() % 2

        if l:headerIndex == 0
            let l:custom_header = split(system('fortune -s | cowthink'), '\n')
        else
            let l:custom_header = split(system('fortune -s | cowsay'), '\n')
        endif
    elseif l:headerIndex == 1
        let l:custom_header = s:mud_horse
    endif
    return s:center_header(l:custom_header)
endfunction

let g:startify_custom_header = s:RandomHeader()

let g:startify_custom_footer =[
            \ "", "", strftime('        %A %Y-%m-%d'),
            \ "        Welcome to Vim World!"
            \ ]

" }}}2

" Highlights {{{2

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" }}}2

" }}}
