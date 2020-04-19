" For plugins
call plug#begin(stdpath('data') . '/plugged')

" Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'edkolev/tmuxline.vim'

" Navigation
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Editing
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Git
Plug 'tpope/vim-fugitive'

" C++
Plug 'bfrg/vim-cpp-modern'

" LaTeX
if has('win32')
    Plug 'lervag/vimtex'
endif

call plug#end()

" Color schemes
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" Status Line (vim-airline)
let g:airline_powerline_fonts = 1
let g:airline_theme='monokai_tasty'

" Enable line numbers
set number

" Filetype plugins
filetype plugin indent on

" Use clipboard instead of registers for copy-paste operations
"set clipboard+=unnamedplus

" Tab/spaces settings
set shiftwidth=4
set tabstop=4
set expandtab

" Show line width guide at 81st character
set colorcolumn=

" netrw settings
let g:netrw_browse_split = 4    " open in previous window
let g:netrw_preview = 1         " open in vertically split window
let g:netrw_winsize = 20        " splits take up 20% of the screen
let g:netrw_liststyle = 3       " tree style
let g:netrw_banner = 0          " remove banner
let g:netrw_list_hide = '.git'  " hide .git folders

" enable transparent background
hi Normal guibg=NONE ctermbg=NONE

" things to make coc.nvim behave better
set cmdheight=2
set updatetime=300

" Python settings
if has('unix')
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
elseif has('win32')
    let g:python3_host_prog = '%AppData%/Local/Programs/Python/Python38/python'
endif

" Git settings
if has('unix') && has('nvim')
    let $GIT_EDITOR = 'nvr -cc split --remote-wait'
    autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
endif

" Win32 settings
if has('win32')
    " VimTeX settings
    let g:tex_flavor = 'latex'
    set conceallevel=1
    let g:tex_conceal = 'abdmg'
    let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
    let g:vimtex_view_general_viewer_options = '@pdf'
    let g:vimtex_view_general_options_latexmk = ''
endif
