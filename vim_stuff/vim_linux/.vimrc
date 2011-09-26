set nocompatible
 
"colorscheme vibrantink
"colorscheme vividchalk
colorscheme desertEx
let g:load_doxygen_syntax=1
set ff=unix
set matchpairs+={:},(:),[:],<:>
set guioptions=gR
set showtabline=2
set ignorecase
set smartcase
set incsearch
set hlsearch
filetype plugin indent on
set autowrite
syntax on
set cindent
"set cinoptions=4,g0,t0,c0,(s,(0,w1,(0,W4,(s,m1,:0,b1,l1
"set cinoptions=(0,l1,g0
set cinoptions=(s,(0,W4,l1,g0
"set cino=>2,:0,=0,l1,g0,t0,c0,(0,w1,(s,m1,)100,*100
set autoindent
set autoread
set cmdheight=1
set textwidth=80
set columns=80
set cursorline
set errorbells
set fo=tcrn
set foldcolumn=2
set foldmethod=indent
set foldenable
set foldminlines=50
set foldopen=all
if has("win32")
  set guifont=Consolas:h14
elseif has("unix")
  "set guifont=Liberation\ Mono\ 14
  "set guifont=Envy\ Code\ R\ 10
  set guifont=Dina\ 12
endif
set history=100
set ruler
set scrolloff=2
set shiftwidth=4
set showbreak="+++"
set showmode
set showcmd
set showfulltag
set showmatch
"set smartindent
set smarttab
set expandtab
set splitright
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
set number
set numberwidth=4
set tabstop=8
set softtabstop=4
set visualbell
set wrap
set wildmenu
set showfulltag
set display+=lastline
set printoptions=syntax:y,wrap:y
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/
" configure tags - add additional tags here or comment out not-used ones
if has("win32")
  set tags+=C:/opt/utils/tags/msvcrt_tags
  set tags+=C:/opt/utils/tags/stl_tags
  set tags+=C:/opt/utils/tags/winsdk_tags
endif
if has("unix")
  set tags+=~/opt/tags/linux_tags
  set tags+=~/opt/tags/stl_tags
endif

"switch tabs
nnoremap <silent> <C-n> :tabnext <CR>
nnoremap <silent> <C-p> :tabprevious <CR>

"showfunc
map <F7> <Plug>ShowFunc
map! <F7> <Plug>ShowFunc

" c syntax highlight
let c_c_vim_compatible = 1
let c_gnu = 1
let c_ansi_typedefs = 1
let c_ansi_constants = 1
let c_posix = 1
let c_math = 1
let c_C99 = 1
let c_syntax_for_h = 1  
"let c_comment_strings = 1
"let c_comment_numbers = 1
"let c_comment_types = 1
"let c_comment_date_time = 1
 
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
 
" build tags of your own project with CTRL+F12
map <C-F12> :silent !exctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" switch between header/*.c/*.cpp
map <C-O><C-O> :A <CR>
map <C-O><C-H> :AS <CR>
map <C-O><C-V> :AV <CR>
map <C-O><C-T> :AT <CR>
 
let g:EchoFuncLangsUsed = ["java","cpp","c"]
let g:EchoFuncKeyNext = '<M-+>'
let g:EchoFuncKeyPrev	= '<M+=>'

"
" Minibuff explorer shit
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let Tlist_Ctags_Cmd='/usr/local/bin/exctags'
map T :TaskList<CR>
map P :TlistToggle<CR>
"
" Completion for python
autocmd FileType python set ofu=pythoncomplete#Complete
let python_highlight_all = 1
let python_slow_sync = 1

autocmd BufNewFile,BufRead *.h set filetype=cpp
