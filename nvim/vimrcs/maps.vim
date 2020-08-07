" CamelCaseMotion
let g:camelcasemotion_key = '<Space>'

" WhichKey
nnoremap <silent> <Leader> :<C-u>WhichKey '\'<CR>
nnoremap <silent> <Plug>(easymotion-prefix) :<C-u>WhichKey '\\'<CR>

" Re-source vimrcs
command! ReSourceRC exe printf('source %s/init.vim', stdpath('config'))
nnoremap <silent> <leader>S :<C-u>ReSourceRC<CR>

" Sandwich
let g:operator_sandwich_no_default_key_mappings = 1
let g:sandwich_no_default_key_mappings = 1
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap ds <Plug>(operator-sandwich-delete)
nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap cs <Plug>(operator-sandwich-replace)
nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap sa <Plug>(operator-sandwich-add)
xmap sa <Plug>(operator-sandwich-add)
omap sa <Plug>(operator-sandwich-g@)

" Fast create matching pairs
imap <C-s>( <Space><C-o><Plug>(operator-sandwich-add)l)<Delete>
imap <C-s>(<Space> <Space><C-o><Plug>(operator-sandwich-add)l(<Delete>
imap <C-s>(<CR> <Space><C-o><Plug>(operator-sandwich-add)l(<Delete><CR><C-o>O

" Change defaults
nnoremap <silent> x "_dl
nnoremap <silent> X "_dh
nnoremap <silent> Y y$
smap <silent> <C-c> <C-o>y
imap <silent> <C-v> <C-r>"

" Window commands
nnoremap <silent> <Leader>wh <C-w>h
nnoremap <silent> <Leader>wj <C-w>j
nnoremap <silent> <Leader>wk <C-w>k
nnoremap <silent> <Leader>wl <C-w>l
nnoremap <silent> <Leader>ws :<C-u>split<CR>
nnoremap <silent> <Leader>wv :<C-u>vsplit<CR>
nnoremap <silent> <Leader>w+ :<C-u>resize +5<CR>
nnoremap <silent> <Leader>w- :<C-u>resize -5<CR>
nnoremap <silent> <Leader>w> :<C-u>vertical resize +5<CR>
nnoremap <silent> <Leader>w< :<C-u>vertical resize -5<CR>
nnoremap <silent> <Leader>w= <C-w>=
nnoremap <silent> <Leader>wq <C-w>q
nnoremap <silent> <Leader>wf <C-w>f
nnoremap <silent> <Leader>wH <C-w>H
nnoremap <silent> <Leader>wJ <C-w>J
nnoremap <silent> <Leader>wK <C-w>K
nnoremap <silent> <Leader>wL <C-w>L

" Incremental Search
nmap / <Plug>(incsearch-easymotion-/)
nmap ? <Plug>(incsearch-easymotion-?)
nmap g/ <Plug>(incsearch-easymotion-stay)

" EasyMotion
nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-overwin-f2)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Plug>(easymotion-prefix)^ <Plug>(easymotion-sol-k)
map <Plug>(easymotion-prefix)g^ <Plug>(easymotion-sol-j)
map <Plug>(easymotion-prefix)$ <Plug>(easymotion-eol-j)
map <Plug>(easymotion-prefix)g$ <Plug>(easymotion-eol-k)
map <Plug>(easymotion-prefix)gw <Plug>(easymotion-overwin-w)
map <Plug>(easymotion-prefix)gg <Plug>(easymotion-overwin-line)
map <Plug>(easymotion-prefix)<Space> <Plug>(easymotion-jumptoanywhere)
nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>

let g:EasyMotion_use_upper = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'ASDFGHJKLZXCVBNMQEWRTYUIOP;'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_re_anywhere = '\v'
            \ . '(<\i)'
            \ . '|' . '(\i>)'
            \ . '|' . '(\l)\zs(\u)'
            \ . '|' . '_\zs(\a|\d)'

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

nnoremap <silent><expr> z/ incsearch#go(<SID>config_easyfuzzymotion())

" Floaterm
nnoremap <silent> <Leader>tt :<C-u>FloatermTry shell<CR>
nnoremap <silent> <Leader>tp :<C-u>FloatermTry python<CR>
nnoremap <silent> <Leader>tr :<C-u>FloatermTry ranger<CR>
nnoremap <silent> <Leader>tg :<C-u>FloatermTry lazygit<CR>
nnoremap <silent> <Leader>tl :<C-u>FloatermList<CR>
nnoremap <silent> <Leader>tL :<C-u>FloatermList!<CR>
nnoremap <silent> <Leader>T :<C-u>FloatermShow!<CR>

" Defx Explorer
nnoremap <silent> <Leader>n :<C-u>OpenExplorer<CR>
nnoremap <silent> <Leader>N :<C-u>OpenThisInExplorer<CR>

" Fuzzy finding
nnoremap <silent> <Leader>ff :<C-u>FilesProject<CR>
nnoremap <silent> <Leader>F :<C-u>FilesProject!<CR>
nnoremap <silent> <Leader>fr :<C-u>RgProject<CR>
nnoremap <silent> <Leader>fR :<C-u>RgProject!<CR>
nnoremap <silent> <Leader>fb :<C-u>Buffers<CR>
nnoremap <silent> <Leader>fB :<C-u>Buffers!<CR>
nnoremap <silent> <Leader>bb :<C-u>Buffers<CR>
nnoremap <silent> <Leader>B :<C-u>Buffers!<CR>
inoremap <expr> <C-x><C-f> fzf#vim#complete#path('rg --files 2> /dev/null')
inoremap <expr> <C-x><C-f> fzf#vim#complete#path('rg --files 2> /dev/null')

" Startify
nnoremap <silent> <Leader>s :SLoad<CR>

" ChooseWin
nmap <silent> - <Plug>(choosewin)

" Language
nmap <silent> <Leader>lf <Plug>(coc-fix-current)
nmap <silent> <Leader>lv :<C-u>Vista!! coc<CR>
nmap <silent> <Leader>fl :<C-u>Vista finder:coc<CR>

inoremap <silent> <expr> <tab>
            \ pumvisible() ? coc#_select_confirm() :
            \   coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<C-r>" :
            \   <SID>check_back_space() ? "\<tab>" : 
            \   coc#refresh()

inoremap <silent> <expr> <C-space> coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let g:coc_snippet_next = '<tab>'
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)

nmap <Leader>lp :<C-u>CocList diagnostics<CR>
nmap gd <Plug>(coc-definition)
nmap <Leader>ld gd
nmap gy <Plug>(coc-type-definition)
nmap <Leader>lt gy
nmap gi <Plug>(coc-implementation)
nmap <Leader>li gi
nmap gr <Plug>(coc-references)
nmap <Leader>lr gr

" Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h ' . expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming and formatting
nmap <silent> <leader>a <Plug>(coc-codeaction-selected)
xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>aa <Plug>(coc-codeaction-line)
nmap <leader>A <Plug>(coc-codeaction-file)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>R <Plug>(coc-refactor)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType * call s:setup_formatexpr()
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

function! s:setup_formatexpr() abort
    if &ft == ''
        return
    endif
    if match(&ft, '\v' . join(map(g:denylist_format_with_coc, '"<" . v:val . ">"'), '|')) != -1
        setl formatexpr=CocAction('formatSelected')
    endif
endfunction

" Coc function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format call CocAction('format')
command! -nargs=? Fold call CocAction('fold', <f-args>)
command! -nargs=0 OrganizeImports call CocAction('runCommand', 'editor.action.organizeImport')


