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
            \ call s:try_open_floaterm(<q-args>)

command! -bang FloatermList 
            \ call fzf#run(fzf#wrap({ 
            \   'source': floaterm#cmdline#floaterm_names(),
            \   'sink': 'FloatermTry',
            \   'options': ['+m', '--header=Floaterms']
            \ }), <bang>0)

