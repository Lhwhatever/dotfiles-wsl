" CamelCaseMotion
let g:camelcasemotion_key = '<Space>'

" WhichKey
nnoremap <silent> <Leader> :<C-u>WhichKey '\\'<CR>

" Sandwich
let g:operator_sandwich_no_default_key_mappings = 1
map ds <Plug>(operator-sandwich-delete)
map cs <Plug>(operator-sandwich-replace)

" Window commands
nnoremap <silent> <Leader>wh <C-w>h
nnoremap <silent> <Leader>wj <C-w>j
nnoremap <silent> <Leader>wk <C-w>k
nnoremap <silent> <Leader>wl <C-w>l
nnoremap <silent> <Leader>ws <C-w>s
nnoremap <silent> <Leader>wv <C-w>v
nnoremap <silent> <Leader>w+ :res +5<CR>
nnoremap <silent> <Leader>w- :res -5<CR>
nnoremap <silent> <Leader>w> :vertical resize +5<CR>
nnoremap <silent> <Leader>w< :vertical resize -5<CR>
nnoremap <silent> <Leader>w= <C-w>=
nnoremap <silent> <Leader>wq <C-w>q

" Incremental Search
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_easyfuzzymotion())
