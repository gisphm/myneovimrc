" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'gisphm/vim-gitignore'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'fatih/molokai'
NeoBundle 'Mizuchi/STL-Syntax'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'ap/vim-css-color'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'build' : {
            \     'linux' : 'python2 install.py --clang-completer --system-libclang --system-boost',
            \   },
            \ 'insert' : 1
            \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'honza/vim-snippets'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'simnalamburt/vim-mundo'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'restore_view.vim'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 's3rvac/AutoFenc'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/vim-syntax-enhanced'
NeoBundle 'othree/jspc.vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'gisphm/vim-polyglot'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'tpope/vim-rails'
NeoBundle 'gisphm/dbext.vim'
NeoBundle 'reedes/vim-wordy'
NeoBundle 'junegunn/vim-easy-align'
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