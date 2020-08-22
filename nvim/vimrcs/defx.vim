augroup vimrc_defx
    autocmd!
    autocmd FileType defx call s:defx_mappings()
    autocmd FileType defx setl cursorline
    autocmd VimEnter * call s:setup_defx()
augroup END

function! s:get_packages() abort
    packadd defx.nvim
    packadd defx-icons
    packadd defx-git
endfunction

command! OpenExplorer 
            \ call s:get_packages() |
            \ call s:defx_open() 

command! OpenThisInExplorer
            \ call s:get_packages() |
            \ call s:defx_open({ 'find_current_file': v:true })

let s:default_columns = 'indent:git:mark:icons:filename'

function! s:setup_defx() abort
    silent! call defx#custom#option('_', {
                \ 'columns': s:default_columns,
                \ 'winwidth': 40,
                \ 'direction': 'topleft',
                \ 'split': 'vertical',
                \ })

    silent! call defx#custom#column('filename', {
                \ 'min_width': 80,
                \ 'max_width': 80,
                \ })

    call s:defx_open({ 'dir': expand('<afile>') })
endfunction

function s:get_project_root() abort
    let l:git_root = ''
    let l:path = expand('%:p:h')
    let l:cmd = systemlist('cd ' . l:path . ' && git rev-parse --show-toplevel')
    if !v:shell_error && !empty(l:cmd)
        let l:git_root = fnamemodify(l:cmd[0], ':p:h')
    endif

    if !empty(l:git_root)
        return l:git_root
    endif

    return getcwd()
endfunction

function! s:defx_open(...) abort
    let l:opts = get(a:, 1, {})
    let l:is_file = has_key(l:opts, 'dir') && !isdirectory(l:opts.dir)

    if  &filetype ==? 'defx' || l:is_file
        return
    endif

    let l:path = s:get_project_root()

    if has_key(l:opts, 'dir') && isdirectory(l:opts.dir)
        let l:path = l:opts.dir
    endif

    if has_key(l:opts, 'find_current_file')
        call execute(printf('Defx -search=%s %s', expand('%:p'), l:path))
    else
        call execute(printf('Defx -toggle %s', l:path))
        call execute('wincmd p')
    endif

    return execute("norm!\<C-w>=")
endfunction

function s:open(dirargs, fileargs) abort
    if defx#is_directory()
        return call('defx#do_action', ['open_tree'] + a:dirargs)
    endif
    return call('defx#do_action', ['drop'] + a:fileargs)
endfunction

function! s:open_winchoose(cmd) abort
    let defx_win_id = win_getid()
    let result = choosewin#start(range(1, winnr('$')))
    call win_gotoid(defx_win_id)
    if len(result) > 0
        let [tabpagenum, winnum] = result
        call defx#call_action('open', printf('tabn %s | %swinc w | %s', tabpagenum, winnum, a:cmd))
    endif
endfunction

let g:defx_help_map = {
            \   'name': 'defx',
            \   'o': [":call <sid>open(['toggle'], ['drop'])", 'drop file / toggle dir'],
            \   '<CR>': [":call <sid>open(['toggle'], ['drop'])", 'drop file / toggle dir'],
            \   's': [":call <sid>open(['toggle'], ['botright sp'])", 'split file / toggle dir'],
            \   'v': [":call <sid>open(['toggle'], ['botright vs'])", 'vsplit file / toggle dir'],
            \   'O': [":call <sid>open(['toggle', 'recursive'], ['drop'])", 'drop file / recursive toggle dirs'],
            \   'S': [":call <sid>open(['toggle', 'recursive'], ['botright sp'])", 'split file / recursive toggle dirs'],
            \   'V': [":call <sid>open(['toggle', 'recursive'], ['botright vs'])", 'vsplit file / recursive toggle dirs'],
            \   'C': [":call defx#is_directory() && defx#do_action('multi', ['open', 'change_vim_cwd'])", 'set as cwd'],
            \   'R': [":call defx#do_action('redraw')", 'refresh'],
            \   'U': [":call defx#do_action('multi', [['cd', '..'], 'change_vim_cwd'])", 'set .. as cwd'],
            \   'H': [":call defx#do_action('toggle_ignored_files')", 'toggle hidden files'],
            \   '<Space>': [":call defx#do_action('toggle_select')", 'toggle select'],
            \   'J': [":call search('[]')", 'goto next dir'],
            \   'K': [":call search('[]', 'b')", 'goto prev dir'],
            \   'yy': [":call defx#do_action('yank_path')", 'yank path'],
            \   'a': [":call defx#do_action('new_multiple_files')", 'add file (trailing slash for dir)'],
            \   'r': [":call defx#do_action('rename')", 'rename'],
            \   'c': [":call defx#do_action('copy')", 'copy'],
            \   'x': [":call defx#do_action('move')", 'cut'],
            \   '!': [":call defx#do_action('execute_system')", 'execute'],
            \   'p': [":call defx#do_action('paste')", 'paste'],
            \   'd': [":call defx#do_action('remove')", 'remove'],
            \   'q': [":call defx#do_action('quit')", 'quit defx'],
            \   '-': [":call <sid>open_winchoose('edit')", 'open with winchoose'],
            \   '>': [":call defx#do_action('resize', defx#get_context().winwidth + 8)", 'widen by 8'],
            \   '<': [":call defx#do_action('resize', defx#get_context().winwidth - 8)", 'narrow by 8'],
            \   'h': [":WhichKey! g:defx_help_map", 'this help'],
            \ }

function! s:defx_mappings() abort
    nnoremap <silent><buffer><expr> o <sid>open(['toggle'], ['drop'])
    nnoremap <silent><buffer><expr> O <sid>open(['toggle', 'recursive'], ['drop'])
    nmap <silent><buffer> <CR> o
    nmap <silent><buffer> <2-LeftMouse> o

    nnoremap <silent><buffer><expr> s <sid>open(['toggle'], ['botright sp'])
    nnoremap <silent><buffer><expr> S <sid>open(['toggle', 'recursive'], ['botright sp'])
    nnoremap <silent><buffer><expr> v <sid>open(['toggle'], ['botright vs'])
    nnoremap <silent><buffer><expr> V <sid>open(['toggle', 'recursive'], ['botright vs'])

    nnoremap <silent><buffer><expr> C defx#is_directory() && defx#do_action('multi', ['open', 'change_vim_cwd'])
    nnoremap <silent><buffer><expr> R defx#do_action('redraw')
    nnoremap <silent><buffer><expr> U defx#do_action('multi', [['cd', '..'], 'change_vim_cwd'])
    nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')

    nnoremap <silent><buffer><expr> > defx#do_action('resize', defx#get_context().winwidth + 8)
    nnoremap <silent><buffer><expr> < defx#do_action('resize', defx#get_context().winwidth - 8)

    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer> J :call search('[]')<CR>
    nnoremap <silent><buffer> K :call search('[]', 'b')<CR>
    nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> a defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <nowait><silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> ! defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <nowait><silent><buffer><expr> d defx#do_action('remove')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Leader>n defx#do_action('quit')
    nnoremap <nowait><silent><buffer> - :<C-u>call <sid>open_winchoose('edit')<CR>
    nnoremap <silent><buffer> -v :<C-u>call <sid>open_winchoose('vsplit')<CR>
    nnoremap <silent><buffer> -s :<C-u>call <sid>open_winchoose('split')<CR>
    nnoremap <silent><buffer> h :<C-u>WhichKey! g:defx_help_map<CR>
endfunction

