" Leader
let mapleader = "\<Space>"

" CamelCaseMotion
let g:camelcasemotion_key = ','

" Re-source vimrcs
command! -bar ReSourceRC exe 'source $MYVIMRC'
nnoremap <silent> <leader>S :<C-u>ReSourceRC<CR>

" Change defaults
nnoremap <silent> x "_dl
nnoremap <silent> X "_dh
nnoremap <silent> Y y$

" Window commands
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Delete a buffer without closing the window
nnoremap <silent> <leader>bd :<C-u>Bclose<CR>

" Line navigation
nnoremap <silent> <expr> j (v:count ? 'j' : 'gj')
vnoremap <silent> <expr> j (v:count ? 'j' : 'gj')
nnoremap <silent> <expr> k (v:count ? 'k' : 'gk')
vnoremap <silent> <expr> k (v:count ? 'k' : 'gk')
