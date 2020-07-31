" CamelCaseMotion
let g:camelcasemotion_key = '<Space>'

" WhichKey
nnoremap <silent> <Leader> :<C-u>WhichKey '\'<CR>
nmap <Leader><Leader> :<C-u>WhichKey '\\'<CR>

" Sandwich
let g:operator_sandwich_no_default_key_mappings = 1
let g:sandwich_no_default_key_mappings = 1
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sanwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sanwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sanwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sanwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap sa <Plug>(operator-sandwich-add)

" Change defaults
nnoremap <silent> x "_dl
nnoremap <silent> X "_dh
smap <silent> <C-c> <C-o>y
imap <silent> <C-v> <Esc>pi
imap <silent> <C-s> <Esc>:<C-u>w<CR>i

" Window commands
nnoremap <silent> <Leader>wh <C-w>h
nnoremap <silent> <Leader>wj <C-w>j
nnoremap <silent> <Leader>wk <C-w>k
nnoremap <silent> <Leader>wl <C-w>l
nnoremap <silent> <Leader>ws :<C-u>split<CR>
nnoremap <silent> <Leader>wv :<C-u>vsplit<CR>
nnoremap <silent> <Leader>w+ :<C-u>res +5<CR>
nnoremap <silent> <Leader>w- :<C-u>res -5<CR>
nnoremap <silent> <Leader>w> :<C-u>vertical resize +5<CR>
nnoremap <silent> <Leader>w< :<C-u>vertical resize -5<CR>
nnoremap <silent> <Leader>w= <C-w>=
nnoremap <silent> <Leader>wq <C-w>q
nnoremap <silent> <Leader>wf <C-w>f
nnoremap <siLent> <Leader>wH <C-w>H
nnoremap <siLent> <Leader>wJ <C-w>J
nnoremap <siLent> <Leader>wK <C-w>K
nnoremap <siLent> <Leader>wL <C-w>L

" Tab commands
nnoremap <silent> <Leader>tf <C-w>gf

" Incremental Search
nmap / <Plug>(incsearch-easymotion-/)
nmap ? <Plug>(incsearch-easymotion-?)
nmap g/ <Plug>(incsearch-easymotion-stay)
nmap <silent> <Leader>h :<C-u>nohl<CR>

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

nnoremap <silent><expr> z/ incsearch#go(<SID>config_easyfuzzymotion())

" Fuzzy finding
nnoremap <silent> <Leader>f :FzfProject<CR>
nnoremap <silent> <Leader>F :FzfProject!<CR>

" Terminal
nnoremap <silent> <Leader>T :terminal<CR>

" Startify
nnoremap <silent> <Leader>s :SLoad<CR>
