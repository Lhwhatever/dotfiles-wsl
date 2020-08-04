runtime! partials/plugins.vim
runtime! partials/basic.vim

" Win32 settings
if has('win32')
    " VimTeX settings
    let g:tex_flavor = 'latex'
    let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
    let g:vimtex_view_general_viewer_options = '@pdf'
    let g:vimtex_view_general_options_latexmk = ''
    let g:vimtex_indent_on_ampersands = 0

    func CreateSubTexFile(parent, child) 
        python3 << endpython
import os, vim
child_path = vim.eval('a:child')
rel_path = os.path.relpath(vim.eval('a:parent'), child_path).replace('\\', '/')
content = '\n'.join((
    r"\documentclass[{}]{{subfiles}}".format(rel_path),
    r"\begin{document}",
    '',
    r"\end{document}"
))
with open(child_path, 'w') as f:
    f.write(content)
endpython
        execute 'bo vs +3 '.a:child
    endfunc
endif

" Go to subconfigs
runtime! partials/theme.vim
runtime! partials/startify.vim
runtime! partials/defx.vim
runtime! partials/which-key.vim
runtime! partials/fzf.vim
runtime! partials/snips.vim
runtime! partials/floaterm.vim
runtime! partials/language.vim
runtime! partials/maps.vim
runtime! partials/sandwich.vim
