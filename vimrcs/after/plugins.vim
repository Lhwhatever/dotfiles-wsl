call GetEnv()
if g:env.head !~# 'VSCODE'
    packadd vim-fugitive
    packadd vim-hexokinase

    packadd vim-devicons
endif
