" For plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'patstockwell/vim-monokai-tasty'

Plug 'edkolev/tmuxline.vim'

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
