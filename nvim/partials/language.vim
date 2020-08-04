let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
let g:airline#extensions#ale#enabled = 1

" Disable linters which coc.nvim covers
let g:ale_linters = {
            \   'javascript': [],
            \   'typescript': [],
            \ }

let g:ale_fixers = {
            \   'javascript': [],
            \   'typescript': [],
            \ }

let g:vista_fzf_preview = ['right: 50%']
let g:vista#renderer#enable_icon = 1

let g:airline#extensions#coc#enabled = 1

" Denylist of filetypes to use CocAction for formatSelected
let g:denylist_format_with_coc = ['startify', 'markdown', 'text', 'help']
