let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let width = float2nr(0.80 * &columns)
    let height = float2nr(0.80 * &lines)

    let x = float2nr((&columns - width) / 2)
    let y = float2nr((&lines - height) / 2)

    let opts = {
                \ 'relative': 'editor',
                \ 'col': x,
                \ 'row': y,
                \ 'width': width,
                \ 'height': height,
                \ 'style': 'minimal'
                \ }

    call CreateFloatingWindow(buf, opts, 'FZF')
endfunction

let s:get_project_dir_cmd = printf('git rev-parse --show-toplevel 2> %s || printf $PWD', has('win32') ? 'NUL' : '/dev/null')

function! s:get_project_dir() abort
    return systemlist(s:get_project_dir_cmd)[0]
endfunction

let s:fzf_project_src_cmd_fmt = has('win32') ?
            \ 'dir %s /a-d /s /b | findstr /V /R /C:"\..*\\\\" | findstr /V /I /R /C:"\\.*cache.*\\\\" | findstr /V /I /R /C:"\\node_modules\\\\"' :
            \ 'find -L %s -type d \( -name ".*" -o -name "*cache*" -o -name "node_modules" \) -prune -o -type f -printf "%%P\n"'

function! s:fzf_project(fullscreen) abort
    let proj_dir = s:get_project_dir()
    call fzf#vim#files(
                \ proj_dir,
                \ fzf#vim#with_preview({
                \   'source': systemlist(printf(s:fzf_project_src_cmd_fmt, proj_dir)),
                \   'options': [
                \       '-m',
                \       '--header=Project Files',
                \       printf('--prompt=%s/', substitute(s:get_project_dir(), ' ', '\ ', 'g')),
                \   ]
                \ }),
                \ a:fullscreen
                \ )
endfunction

function! s:rg_fzf(query, fullscreen, dir) abort
    let command_fmt = printf('rg --column --line-number --no-heading --color=always --smart-case -e %%s -- %s || true', a:dir)
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction


command! -bang FilesProject call s:fzf_project(<bang>0)
command! -nargs=* -bang RgDefault call s:rg_fzf(<q-args>, <bang>0, '')
command! -nargs=* -bang RgProject call s:rg_fzf(<q-args>, <bang>0, s:get_project_dir())

