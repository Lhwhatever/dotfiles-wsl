" Incremental Search
nmap / <Plug>(incsearch-easymotion-/)
nmap ? <Plug>(incsearch-easymotion-?)
nmap g/ <Plug>(incsearch-easymotion-stay)

" EasyMotion
nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-overwin-f2)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Plug>(easymotion-prefix)^ <Plug>(easymotion-sol-k)
map <Plug>(easymotion-prefix)g^ <Plug>(easymotion-sol-j)
map <Plug>(easymotion-prefix)$ <Plug>(easymotion-eol-j)
map <Plug>(easymotion-prefix)g$ <Plug>(easymotion-eol-k)
map <Plug>(easymotion-prefix)gw <Plug>(easymotion-overwin-w)
map <Plug>(easymotion-prefix)gg <Plug>(easymotion-overwin-line)
map <Plug>(easymotion-prefix)<Space> <Plug>(easymotion-jumptoanywhere)
nnoremap <silent> gl :<C-u>noh<CR><C-l>

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

