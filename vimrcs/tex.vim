call GetEnv()
if g:env.head =~# 'VSCODE'
    finish
endif

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

let g:tex_conceal='abdmg'

packadd vimtex
