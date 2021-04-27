function! s:get_env() abort
    let g:env = {}

    if has('win64') || has('win32') || has('win16')
        let g:env.os = 'WINDOWS'
    else
        let g:env.os = toupper(substitute(system('uname'), '\n', '', ''))
    endif

    if has('g:vscode')
        let g:env.head = 'VSCODE'
    elseif len(nvim_list_uis()) < 1
        let g:env.head = 'HEADLESS'
    else
        let g:env.head = 'NVIM'
    endif
endfunc

function! GetEnv()
    if exists('g:env')
        return
    endif

    call s:get_env()
endfunc

" Go to subconfigs
runtime! vimrcs/plugins.vim
runtime! vimrcs/*.vim
runtime! vimrcs/after/plugins.vim

" Win32 settings
" if has('win32')
"     " VimTeX settings
"     let g:tex_flavor = 'latex'
"     let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
"     let g:vimtex_view_general_viewer_options = '@pdf'
"     let g:vimtex_view_general_options_latexmk = ''
"     let g:vimtex_indent_on_ampersands = 0
" 
"     func CreateSubTexFile(parent, child) 
"         python3 << endpython
" import os, vim
" child_path = vim.eval('a:child')
" rel_path = os.path.relpath(vim.eval('a:parent'), child_path).replace('\\', '/')
" content = '\n'.join((
"     r"\documentclass[{}]{{subfiles}}".format(rel_path),
"     r"\begin{document}",
"     '',
"     r"\end{document}"
" ))
" with open(child_path, 'w') as f:
"     f.write(content)
" endpython
"         execute 'bo vs +3 '.a:child
"     endfunc
" endif

