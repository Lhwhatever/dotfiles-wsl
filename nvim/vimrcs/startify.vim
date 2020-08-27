call GetEnv()
if g:env.head =~# 'VSCODE'
    finish
endif

packadd vim-startify

let g:startify_session_persistence = 1
let g:startify_enable_special = 1

function! s:setup_startify() abort
    if !empty($FORTUNES)
        let g:startify_custom_header = startify#pad(systemlist('fortune $FORTUNES'))
    endif
endfunction

call s:setup_startify()

let g:startify_session_before_save = [
            \ 'Defx -close .',
            \ ]

let g:startify_change_to_vcs_root = 1


nnoremap <silent> <Leader>s :SLoad<CR>

