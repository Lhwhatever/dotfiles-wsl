let g:startify_session_persistence = 1
let g:startify_enable_special = 1

if !empty($FORTUNES)
    let g:startify_custom_header = startify#pad(systemlist('fortune $FORTUNES'))
endif

let g:startify_session_before_save = [
            \ 'Defx -close .',
            \ ]

let g:startify_change_to_vcs_root = 1
