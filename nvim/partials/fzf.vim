function! s:fzf_by_command(source, fullscreen) abort
    echo a:source
    call fzf#run(fzf#wrap({ 
                \ 'source': 'find ./* -type d -name ".*" -prune -o -type f -print',
                \ 'dir': a:source,
                \ 'options': ['-m', '--header=Files', '--prompt=' . substitute(a:source, ' ', '\ ', 'g') . '/'],

command! -bang FzfProject 
            \ call s:fzf_by_command(systemlist('git rev-parse --show-toplevel 2> /dev/null || printf $PWD')[0], <bang>0)
command! -bang FzfHere
            \ call s:fzf_by_command(system('printf $PWD'), <bang>0)
command! -bang FzfHome
            \ call s:fzf_by_command('~', <bang>0)
