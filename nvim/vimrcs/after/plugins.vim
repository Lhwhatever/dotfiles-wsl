call GetEnv()
if g:env.head !~# 'VSCODE'
    packadd indentLine

    packadd vim-fugitive
    packadd vim-hexokinase

    packadd vim-devicons
endif
