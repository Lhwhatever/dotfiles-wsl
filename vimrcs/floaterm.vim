call GetEnv()
if g:env.head =~# 'VSCODE'
    finish
endif

let g:floaterm_name_map = {
            \   'shell': '',
            \   'python': 'python3',
            \ }

function! s:try_open_floaterm(name) abort
    if index(floaterm#cmdline#floaterm_names(), a:name) == -1
        " Terminal not open
        let cmd = has_key(g:floaterm_name_map, a:name) ? g:floaterm_name_map[a:name] : a:name
        exe printf('FloatermNew --name=%s %s', a:name, cmd)
    else
        exe 'FloatermToggle ' . a:name
    endif
endfunction

command! -nargs=? -complete=customlist,floaterm#cmdline#floaterm_names FloatermTry
            \ packadd vim-floaterm <bar> call s:try_open_floaterm(<q-args>)

command! -bang FloatermList 
            \ call fzf#run(fzf#wrap({ 
            \   'source': floaterm#cmdline#floaterm_names(),
            \   'sink': 'FloatermTry',
            \   'options': ['+m', '--header=Floaterms']
            \ }), <bang>0)

nnoremap <silent> <Leader>tt :<C-u>FloatermTry shell<CR>
nnoremap <silent> <Leader>tp :<C-u>FloatermTry python<CR>
nnoremap <silent> <Leader>tr :<C-u>FloatermTry ranger<CR>
nnoremap <silent> <Leader>tg :<C-u>FloatermTry lazygit<CR>
nnoremap <silent> <Leader>tl :<C-u>FloatermList<CR>
nnoremap <silent> <Leader>tL :<C-u>FloatermList!<CR>
nnoremap <silent> <Leader>T :<C-u>FloatermShow!<CR>

