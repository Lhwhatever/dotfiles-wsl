" For plugins
call plug#begin(stdpath('data') . '/plugged')

" Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'edkolev/tmuxline.vim'

" Navigation
Plug 'tpope/vim-vinegar'

" Git
Plug 'tpope/vim-fugitive'

" C++
Plug 'bfrg/vim-cpp-modern'

call plug#end()

" Color schemes
colorscheme vim-monokai-tasty

" Status Line (vim-airline)
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" Enable line numbers
set number

" Use clipboard instead of registers for copy-paste operations
set clipboard+=unnamedplus

" Tab/spaces settings
set shiftwidth=4
set tabstop=4
set expandtab

" Show line width guide at 81st character
set colorcolumn=81

" netrw settings
let g:netrw_browse_split = 4    " open in previous window
let g:netrw_preview = 1         " open in vertically split window
let g:netrw_winsize = 20        " splits take up 20% of the screen
let g:netrw_liststyle = 3       " tree style
let g:netrw_banner = 0          " remove banner
let g:netrw_list_hide = '.git'  " hide .git folders

