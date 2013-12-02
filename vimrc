set nocompatible               " be iMproved
set background=dark     " Assume a dark background
filetype off                   " required!

" set up vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" leader definition:
let mapleader = ","

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

Bundle 'The-NERD-tree'
"Bundle 'The-NERD-Commenter'
"Bundle 'bash-support.vim'
Bundle '00ps/bash-support.vim'
"Bundle 'Puppet-Syntax-Highlighting'
Bundle 'rodjek/vim-puppet'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'tpope/vim-surround'
Bundle 'spf13/vim-autoclose'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'matchit.zip'
Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
Bundle 'godlygeek/csapprox'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'flazz/vim-colorschemes'
Bundle 'mbbill/undotree'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-abolish.git'

Bundle 'luainspect.vim'
Bundle '00ps/lua-support'
Bundle 'xolox/vim-misc'

Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
if executable('ctags')
	Bundle 'majutsushi/tagbar'
endif

" Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'honza/vim-snippets'
Bundle 'SuperTab'

" Phyton support
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'

" HTML
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-haml'

Bundle 'tpope/vim-markdown'
Bundle 'spf13/vim-preview'
Bundle 'tpope/vim-cucumber'
Bundle 'quentindecock/vim-cucumber-align-pipes'

Bundle 'sudo.vim'
Bundle 'nginx.vim'
Bundle 'apachestyle'

Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'vim-kickstart'

filetype plugin indent on     " required!

set nowritebackup
set nobackup

syntax    on

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8

if has ('x') && has ('gui') " On Linux use + register for copy-paste
	set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
	set clipboard=unnamed
endif

set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
	let g:solarized_termcolors=256
	color solarized                 " Load a colorscheme
endif
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background for
                                " things like vim-gitgutter

if has('cmdline_info')
	set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set fo+=o
set fo-=r
set fo-=t

set nowrap
set textwidth=0

set backspace=indent,eol,start

set showmatch
set novisualbell
set noerrorbells
set vb t_vb=

set foldenable
set foldmethod=marker
set foldlevel=100

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
 
nmap <silent> ,/ :nohlsearch<CR>


nmap <C-N><C-N> :set invnumber<CR>

set numberwidth=2

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" OmniComplete {
""if has("autocmd") && exists("+omnifunc")
""	autocmd Filetype *
""        \if &omnifunc == "" |
""        \setlocal omnifunc=syntaxcomplete#Complete |
""        \endif
""endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest
" }

" Ctags {
set tags=./tags;/,~/.vimtags
" }

" AutoCloseTag {
" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }

" SnipMate {
" Setting the author var
let g:snips_author = 'Fred Badel <fred@lotaris.com>'

" NerdTree {
map <C-t> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" }

" Tabularize {
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" Session List {
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
" }

" PyMode {
let g:pymode_lint_checker = "pyflakes"
let g:pymode_utils_whitespaces = 0
let g:pymode_options = 0
" }

" ctrlp {
let g:ctrlp_working_path_mode = 2
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }
"}

" TagBar {
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" If using go please install the gotags program using the following
" go install github.com/jstemmer/gotags
" And make sure gotags is in your path
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
"}

" PythonMode {
" Disable if python support not present
if !has('python')
    let g:pymode = 1
endif
" }

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
"}

" neocomplcache {
let g:acp_enableAtStartup = 0
""let g:neocomplcache_enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1
""let g:neocomplcache_enable_camel_case_completion = 1
""let g:neocomplcache_enable_smart_case = 1
let g:neocomplete#enable_smart_case = 1
""let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplete#enable_auto_delimiter = 1
""let g:neocomplcache_max_list = 15
let g:neocomplete#max_list = 15
""let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplete#force_overwrite_completefunc = 1

" SuperTab like snippets behavior.
""imap <silent><expr><TAB> neosnippet#expandable() ?
""            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
""            \ "\<C-e>" : "\<TAB>")
""smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Define dictionary.
""let g:neocomplcache_dictionary_filetype_lists = {
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
""if !exists('g:neocomplcache_keyword_patterns')
""    let g:neocomplcache_keyword_patterns = {}
""endif
""let g:neocomplcache_keyword_patterns._ = '\h\w*'
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'


" Plugin key-mappings.

" These two lines conflict with the default digraph mapping of <C-K>
" If you prefer that functionality, add
" let g:spf13_no_neosnippet_expand = 1
" in your .vimrc.bundles.local file

""if !exists('g:spf13_no_neosnippet_expand')
""    imap <C-k> <Plug>(neosnippet_expand_or_jump)
""    smap <C-k> <Plug>(neosnippet_expand_or_jump)
""endif

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><CR> neocomplete#complete_common_string()

" <TAB>: completion.
""inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
""inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplete#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

""        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
""        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
""let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Use honza's snippets.
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Enable neosnippet snipmate compatibility mode
let g:neosnippet#enable_snipmate_compatibility = 1

" For snippet_complete marker.
""if has('conceal')
""    set conceallevel=2 concealcursor=i
""endif

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview
" }

" UndoTree {
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1
" }

" Syntastic :
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['ruby', 'php', 'puppet'],
    \ 'passive_filetypes': ['html'] }

map <leader>sc :SyntasticCheck<CR>      " manually check syntax
map <leader>se :Errors<CR>              " Open Error buffer
map <leader>sl :lclose<CR>              " close Error buffer
map <leader>st :SyntasticToggleMode<CR> " toggle syntastic active/passive mode

" indent_guides {
if !exists('g:spf13_no_indent_guides_autocolor')
    let g:indent_guides_auto_colors = 1
else
" For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
endif

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
" }

" GUI Settings {

" GVIM- (here instead of .gvimrc)
if has('gui_running')
    set guioptions-=T           " Remove the toolbar
    set lines=40                " 40 lines of text instead of 24
    if has("gui_gtk2")
        set guifont=Andale\ Mono\ Regular\ 10,Menlo\ Regular\ 10,Consolas\ Regular\ 10,Courier\ New\ Regular\ 10
        ""set guifont=Bistream\ Vera\ Sans\ Mono\ 10
    elseif has("gui_mac")
        set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
    elseif has("gui_win32")
        set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
    endif
    if has('gui_macvim')
        set transparency=5      " Make the window slightly transparent
        set guifont=Meslo\ LG\ S\ for\ Powerline:h14
    endif
    else
        if &term == 'xterm-color' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
    "set term=builtin_ansi       " Make arrow and other keys work
endif
""au BufRead,BufNewFile *.ddl   setfiletype mcollective_ddl    

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

inoremap <C-a> <Home>
inoremap <C-e> <End>

