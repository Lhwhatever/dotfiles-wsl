" Color schemes
" Warning: italics doesn't seem to be available on Win10 1903. Reportedly
" available on Win10 2004.
colorscheme monokai

" Status Line (vim-airline)
let g:airline_powerline_fonts = 1
let g:airline_theme='monokai_tasty'
let g:airline#extensions#tabline#enabled = 1

" enable transparent background
hi Normal guibg=NONE ctermbg=NONE

" transparent sign column
hi clear SignColumn

" always show sign column
set signcolumn=yes:1

" transparent line numbers
hi LineNr guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE

