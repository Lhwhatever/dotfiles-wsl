" CamelCaseMotion
let g:camelcasemotion_key = '<Space>'

" WhichKey
nnoremap <silent> <Leader> :<C-u>WhichKey '\'<CR>
nnoremap <silent> <Plug>(easymotion-prefix) :<C-u>WhichKey '\\'<CR>

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

" EasyMotion
nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-overwin-f2)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Plug>(easymotion-prefix)^ <Plug>(easymotion-sol-j)
map <Plug>(easymotion-prefix)g^ <Plug>(easymotion-sol-k)
map <Plug>(easymotion-prefix)$ <Plug>(easymotion-eol-k)
map <Plug>(easymotion-prefix)g$ <Plug>(easymotion-eol-j)
map <Plug>(easymotion-prefix)gw <Plug>(easymotion-overwin-w)
map <Plug>(easymotion-prefix)gg <Plug>(easymotion-overwin-line)
map <Plug>(easymotion-prefix)<Space> <Plug>(easymotion-jumptoanywhere)
nmap <silent> <Leader>h :<C-u>nohl<CR>

let g:EasyMotion_use_upper = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'ASDFGHJKLZXCVBNMQEWRTYUIOP;'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_re_anywhere = '\v'
            \ . '(<\i)'
            \ . '|' . '(\i>)'
            \ . '|' . '(\l)\zs(\u)'
            \ . '|' . '_\zs(\a|\d)'

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

" Defx Explorer
nnoremap <silent> <Leader>n :<C-u>OpenExplorer<CR>
nnoremap <silent> <Leader>N :<C-u>OpenThisInExplorer<CR>

" Fuzzy finding
nnoremap <silent> <Leader>f :<C-u>FilesProject<CR>
nnoremap <silent> <Leader>ff :<C-u>FilesProject<CR>
nnoremap <silent> <Leader>f! :<C-u>FilesProject!<CR>
nnoremap <silent> <Leader>fr :<C-u>RgProject<CR>
nnoremap <silent> <Leader>fR :<C-u>RgProject!<CR>
nnoremap <silent> <Leader>fb :<C-u>Buffers<CR>
nnoremap <silent> <Leader>fB :<C-u>Buffers!<CR>
inoremap <expr> <C-x><C-f> fzf#vim#complete#path('rg --files 2> /dev/null')
inoremap <expr> <C-x><C-f> fzf#vim#complete#path('rg --files 2> /dev/null')

" Terminal
nnoremap <silent> <Leader>T :terminal<CR>

" Startify
nnoremap <silent> <Leader>s :SLoad<CR>
