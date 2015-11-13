" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:

NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neco-vim'
NeoBundle 'Shougo/neco-syntax'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'gisphm/vim-snippets-neosnippet'
NeoBundle 'gisphm/vim-polyglot'
NeoBundle 'chrisbra/unicode.vim', {
            \ 'build' : {
            \     'linux' : 'mkdir -p autoload/unicode/ && wget -q http://www.unicode.org/Public/UNIDATA/UnicodeData.txt -O autoload/unicode/UnicodeData.txt',
            \   },
            \ }
NeoBundle 'scrooloose/syntastic'

NeoBundle 'fatih/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mhinz/vim-signify'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gisphm/vim-gitignore'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'ryanoasis/vim-devicons'

NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/vim-syntax-enhanced'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'othree/jspc.vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Mizuchi/STL-Syntax'
NeoBundle 'gisphm/dbext.vim'

NeoBundle 'mhinz/vim-startify'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'simnalamburt/vim-mundo'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'kana/vim-operator-user'
NeoBundle 's3rvac/AutoFenc'
NeoBundle 'junegunn/vim-easy-align'

NeoBundle 'reedes/vim-wordy'
NeoBundleLazy 'vimwiki/vimwiki', {
            \ 'rev' : 'dev',
            \ 'autoload' : { 'filetypes' : ['vimwiki'] },
            \ }
NeoBundleLazy 'hotoo/pangu.vim', {
            \ 'autoload' : {
            \   'filetypes' : [
            \     'markdown', 'text', 'vimwiki', 'cnx'
            \     ]
            \   }
            \ }
