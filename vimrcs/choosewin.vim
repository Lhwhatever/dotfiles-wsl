call GetEnv()
if g:env.head =~# 'VSCODE'
endif

nmap - <Plug>(choosewin)
nmap -- <Plug>(choosewin)
nmap <silent> -s :<C-u>ChooseWinSwap<CR>
nmap <silent> -S :<C-u>ChooseWinSwapStay<CR>
