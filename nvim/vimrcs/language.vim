call GetEnv()
if g:env.head =~# 'VSCODE'
    finish
endif


packadd vista.vim
packadd ale
packadd coc.nvim


let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
let g:airline#extensions#ale#enabled = 1

" Disable linters which coc.nvim covers
let g:ale_linters = {
            \   'javascript': [],
            \   'typescript': [],
            \ }

let g:ale_fixers = {
            \   'javascript': [],
            \   'typescript': [],
            \ }

" Vista
let g:vista_fzf_preview = ['right: 50%']
let g:vista#renderer#enable_icon = 1

nmap <silent> <Leader>lv :<C-u>Vista!! coc<CR>
nmap <silent> <Leader>fl :<C-u>Vista finder:coc<CR>

" Denylist of filetypes to use CocAction for formatSelected
let g:denylist_format_with_coc = ['startify', 'markdown', 'text', 'help']

" Coc Mappings
nmap <silent> <Leader>lf <Plug>(coc-fix-current)

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


