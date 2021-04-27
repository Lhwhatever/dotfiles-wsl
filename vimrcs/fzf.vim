call GetEnv()
if g:env.head =~# 'VSCODE'
    finish
endif

packadd fzf
packadd fzf.vim

let g:fzf_layout = { 'window': {
            \   'width': 0.8,
            \   'height': 0.8,
            \   'highlight': 'FloatermBorder',
            \   'border': 'sharp',
            \ } }

let s:get_project_dir_cmd = printf('git rev-parse --show-toplevel 2> %s || printf $PWD', has('win32') ? 'NUL' : '/dev/null')

function! s:get_project_dir() abort
    return systemlist(s:get_project_dir_cmd)[0]
endfunction

let s:fzf_project_src_cmd_fmt = has('win32') ?
            \ 'dir %s /a-d /s /b | findstr /V /R /C:"\..*\\\\" | findstr /V /I /R /C:"\\.*cache.*\\\\" | findstr /V /I /R /C:"\\node_modules\\\\"' :
            \ 'fd -tf . "%s"'

let s:fzf_all_src_cmd_fmt = has('win32') ?
            \ 'dir %s /a-d /s /b' :
            \ 'fd -tf -H --no-ignore-vcs . "%s"'

function! s:fzf_project(no_ignore) abort
    let l:proj_dir = s:get_project_dir()
    let l:fzf_cmd = a:no_ignore ? s:fzf_all_src_cmd_fmt : s:fzf_project_src_cmd_fmt 
    call fzf#vim#files(
                \ l:proj_dir,
                \ fzf#vim#with_preview({
                \   'source': systemlist(printf(l:fzf_cmd, proj_dir)),
                \   'options': [
                \       '-m',
                \       '--header=Project Files',
                \       printf('--prompt=%s/', substitute(s:get_project_dir(), ' ', '\ ', 'g')),
                \   ]
                \ })
                \ )
endfunction

function! s:rg_fzf(query, no_ignore, dir) abort
    let command_fmt = printf(
                \ 'rg --column --line-number --no-heading --color=always --smart-case %s-e %%s -- %s || true', 
                \ a:no_ignore ? '--no-ignore-vcs --no-ignore-dot ' : '', 
                \ a:dir
                \ )
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec))
endfunction


command! -bang FilesProject call s:fzf_project(<bang>0)

nnoremap <silent> <C-p> :<C-u>FilesProject<CR>
nnoremap <silent> <M-b> :<C-u>Buffers<CR>

nnoremap <silent> <Leader>ff :<C-u>FilesProject<CR>
nnoremap <silent> <Leader>F :<C-u>FilesProject!<CR>
nnoremap <silent> <Leader>fb :<C-u>Buffers<CR>

inoremap <expr> <C-x><C-f> fzf#vim#complete#path('rg --files 2> /dev/null')
inoremap <expr> <C-x><C-f> fzf#vim#complete#path('rg --files 2> /dev/null')

if executable('rg')
    command! -nargs=* -bang RgDefault call s:rg_fzf(<q-args>, <bang>0, '')
    command! -nargs=* -bang RgProject call s:rg_fzf(<q-args>, <bang>0, s:get_project_dir())

    nnoremap <silent> <M-f> :<C-u>RgProject<CR>

    nnoremap <silent> <Leader>fr :<C-u>RgProject<CR>
    nnoremap <silent> <Leader>fR :<C-u>RgProject!<CR>
endif
