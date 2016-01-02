" 文档说明 {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" 主题 {{{

colo molokai
let g:molokai_original = 1
let g:rehash256 = 1

" }}}

" Plugin Manager Mappings {{{

nnoremap <leader>nu :PlugUpdate<cr>
nnoremap <leader>ni :PlugInstall<cr>
nnoremap <leader>nc :PlugClean<cr>
nnoremap <leader>np :PlugUpgrade<cr>

" }}}

" indent guides {{{

let g:indent_guides_enable_on_vim_startup               = 1
let g:indent_guides_start_level                         = 2
let g:indent_guides_guide_size                          = 1
let g:indent_guides_exclude_filetypes                   =
            \ ['help', 'vimfiler', 'startify', 'unite']
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
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*}
                \ setlocal filetype=markdown formatoptions=tcroqn2 comments=n:>
    autocmd FileType markdown execute 'setlocal dict+=~/.config/nvim/words/emoji_dict'
augroup END
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:markdown_fenced_languages = []
let g:markdown_fenced_languages = [
            \ 'coffee',
            \ 'css',
            \ 'erb=eruby',
            \ 'javascript',
            \ 'js=javascript',
            \ 'json=javascript',
            \ 'ruby',
            \ 'sass',
            \ 'xml',
            \ 'vim',
            \ ]

" }}}

" Pangu {{{

if exists(":Pangu")
    augroup PanguFormat
        autocmd!
        autocmd BufWritePre *.{md,mdwn,mkd,mkdn,mark*},*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
    augroup END
endif

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
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore'
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
nnoremap [unite]u :<C-u>Unite -auto-resize
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

" Ploygot {{{

let g:polyglot_disabled = [ 'javascript', 'markdown' ]

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
let g:startify_session_dir            = '~/.config/nvim/tmp/session'
let g:startify_list_order             = [
            \ ['MRU'], 'files',
            \ ['Sessions'], 'sessions',
            \ ]
let g:startify_skiplist               = [
            \ 'COMMIT_EDITMSG',
            \ '/bundles/',
            \ '^/tmp',
            \ '/home/vagrant/tools',
            \ ]
autocmd FileType startify
            \ setlocal colorcolumn= nospell

" }}}2

" Custom Header and Footer {{{2

let s:mud_horse = [
            \ ' ┏┓   ┏┓',
            \ '┏┛┻━━━┛┻┓',
            \ '┃       ┃',
            \ '┃   ━   ┃',
            \ '┃＞   ＜┃',
            \ '┃       ┃',
            \ '┃.. ⌒ ..┃',
            \ '┃       ┃',
            \ '┗━┓   ┏━┛',
            \ '  ┃   ┃ Codes are far away from bugs with the animal protecting',
            \ '  ┃   ┃    神兽保佑，代码无 bug',
            \ '  ┃   ┃',
            \ '  ┃   ┗━━━┓',
            \ '  ┃       ┣┓',
            \ '  ┃       ┏┛',
            \ '  ┗┓┓┏━┳┓┏┛',
            \ '   ┃┫┫ ┃┫┫',
            \ '   ┗┻┛ ┗┻┛',
            \ ]

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

" vim-ruby {{{

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading       = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global    = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails                = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile         = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object       = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object_space = 1

" }}}

" OmniComplete {{{

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \ if &omnifunc == "" |
                \     setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Enable omni-completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP

" }}}

" deoplete {{{

set completeopt+=noinsert,noselect
let g:deoplete#enable_at_startup                  = 1
let g:deoplete#enable_ignore_case                 = 1
let g:deoplete#auto_completion_start_length       = 3
let g:deoplete#omni_patterns                      = {}
let g:deoplete#omni_patterns.ruby                 =
            \ ['[^. *\t]\.\w*', '\h\w*::']
let g:deoplete#omni#input_patterns                = {}
let g:deoplete#omni#input_patterns.ruby           =
            \ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
let g:deoplete#omni#input_patterns.python =
            \ '[^. *\t]\.\w*\|\h\w*'
imap <silent><expr> <TAB> <SID>CleverTab()
function! s:CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        if neosnippet#jumpable()
            return "\<Plug>(neosnippet_jump)"
        else
            return deoplete#mappings#manual_complete()
        endif
    endif
endfunction

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'

call deoplete#custom#set('_', 'converters',
            \ ['converter_auto_delimiter', 'remove_overlap'])

inoremap <expr><BS>
            \ deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><Space> pumvisible()? deoplete#mappings#close_popup() : "\<Space>"

" }}}

" neosnippet {{{

let g:snips_author                     = "gisphm"
let g:snips_email                      = "phmfk@hotmail.com"
let g:snips_github                     = "https://github.com/gisphm"
let g:neosnippet#expand_word_boundary  = 1
let g:neosnippet#scope_aliases         = {}
let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails,gemfile'
let g:neosnippet#scope_aliases['html'] = 'htmldjango,html'

imap <silent><C-k> <Plug>(neosnippet_expand)

" }}}

" EasyAlign {{{

vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" }}}

" EasyMotion {{{

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" }}}

" Jedi {{{

augroup Jedi
    autocmd!
    autocmd BufEnter *.py setlocal updatetime=4000
    autocmd FileType python setlocal omnifunc=jedi#completions completeopt-=preview
augroup END
let g:jedi#completions_enabled        = 0
let g:jedi#auto_vim_configuration     = 0
let g:jedi#popup_select_first         = 0
let g:jedi#smart_auto_mappings        = 0
let g:jedi#show_call_signatures_delay = 4000
let g:jedi#use_tag_stack              = 1
let g:jedi#force_py_version           = 3
let g:jedi#show_call_signatures       = 0

" }}}

" Pymode {{{

let g:pymode_options              = 0
let g:pymode_warnings             = 1
let g:pymode_indent               = 1
let g:pymode_folding              = 0
let g:pymode_doc                  = 1
let g:pymode_rope                 = 1
let g:pymode_rope_completion      = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport      = 0
let g:pymode_syntax               = 1
let g:pymode_syntax_all           = 1
let g:pymode_trim_whitespaces     = 1
let g:pymode_options_colorcolumn  = 1
let g:pymode_lint                 = 1
let g:pymode_lint_on_write        = 0
let g:pymode_lint_unmodified      = 0
let g:pymode_lint_on_fly          = 0
let g:pymode_python               = 'python3'
let g:pymode_lint_todo_symbol     = 'T'
let g:pymode_lint_comment_symbol  = 'C'
let g:pymode_lint_visual_symbol   = 'V'
let g:pymode_lint_error_symbol    = 'E'
let g:pymode_lint_info_symbol     = 'I'
let g:pymode_lint_pyflakes_symbol = 'P'
let g:pymode_lint_checkers        = ['mccabe', 'pep8', 'pyflakes']

" }}}

" statusline {{{

set statusline=%<%f\
set statusline+=%w%h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=\ [%{&ff}/%Y]
set statusline+=\ [%{getcwd()}]
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

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
let g:airline#extensions#whitespace#trailing_format     = 'tw[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'm[%s]'
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
let g:airline_theme             = 'badwolf'
let g:airline_theme_patch_func  = 'AirlineThemePatch'
let g:airline_powerline_fonts   = 1
let g:airline_detect_modified   = 1
let g:airline_detect_iminsert   = 0
let g:airline_detect_paste      = 1
let g:airline_detect_crypt      = 1
let g:airline_inactive_collapse = 1
let g:airline_mode_map          = {
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
