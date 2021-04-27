packadd tex-conceal.vim

command! -nargs=1 CreateSubTex call CreateSubTexFile(expand('%:t'), "<args>")
set tw=120
set colorcolumn=121

set conceallevel=2
let g:tex_conceal="abdgm"

hi Conceal none
setlocal spell

nnoremap <silent> <localleader>c :<C-u>VimtexCompile<Esc>
nnoremap <silent> <localleader>v :<C-u>VimtexView<Esc>
nnoremap <silent> <localleader>e :<C-u>VimtexErrors<Esc>
nnoremap <silent> <localleader><localleader> :<C-u>VimtexReload<Esc>
