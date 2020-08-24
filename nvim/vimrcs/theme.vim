packadd vim-monokai-tasty
packadd vim-monokai

" Color schemes
" Warning: italics doesn't seem to be available on Win10 1903. Reportedly
" available on Win10 2004.
" Update: still not available.
colorscheme monokai

" Status Line (vim-airline)
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='monokai_tasty'

" Status Line (lightline.vim)
function! CocCurrentFunction() abort
    return get(b:, 'coc_current_function', '')
endfunc

packadd lightline.vim
packadd tmuxline.vim

let g:lightline = {
            \ 'enable': { 'tabline': 0 },
            \ 'colorscheme': 'monokai_tasty_modified',
            \ 'active': {
            \   'left': [ ['mode', 'paste'],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ]],
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \ },
            \ 'separator': { 'left': "\uE0B0", 'right': "\uE0B2" },
            \ 'subseparator': { 'left': "\uE0B1", 'right': "\uE0B3" },
            \ }

function! s:refresh_lightline(...) abort
    if len(a:000) > 0
        let g:lightline.colorscheme = a:000[0]
    endif

    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunc

command! -nargs=? Lightline call s:refresh_lightline(<f-args>)

" vim-buffet
let s:light_green = { "cterm": 148, "gui": "#A4E400" }
let s:orange = { "cterm": 208, "gui": "#FF9700" }

let s:light_grey = { "cterm": 250, "gui": "#bcbcbc" }
let s:grey = { "cterm": 245, "gui": "#8a8a8a" }
let s:dark_grey = { "cterm": 59, "gui": "#5f5f5f" }
let s:darker_grey = { "cterm": 238, "gui": "#444444" }
let s:light_charcoal = { "cterm": 236, "gui": "#303030" }
let s:charcoal = { "cterm": 235, "gui": "#262626" }
let s:dark_charcoal = { "cterm": 234, "gui": "#1c1c1c" }

function! s:add(group, fg, bg, style)
    exe printf("hi! %s cterm=%s ctermfg=%s ctermbg=%s guifg=%s guibg=%s", a:group, a:style, a:fg.cterm, a:bg.cterm, a:fg.gui, a:bg.gui)
endfunc

function! g:BuffetSetCustomColors()
    call s:add("BuffetCurrentBuffer", s:light_green, s:dark_charcoal, 'NONE')
    call s:add("BuffetModCurrentBuffer", s:orange, s:dark_charcoal, 'NONE')

    call s:add("BuffetActiveBuffer", s:grey, s:dark_charcoal, 'NONE')
    call s:add("BuffetModActiveBuffer", s:orange, s:dark_charcoal, 'NONE')

    call s:add("BuffetBuffer", s:dark_grey, s:light_charcoal, 'NONE')
    call s:add("BuffetModBuffer", s:orange, s:light_charcoal, 'NONE')

    call s:add("BuffetTrunc", s:light_grey, s:darker_grey, 'bold')
    call s:add("BuffetTab", s:charcoal, s:light_green, 'bold')
endfunc

let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

packadd vim-buffet

" always show sign column
set signcolumn=yes:1

" Tmuxline
let g:tmuxline_theme = {
            \ 'bg':   [ 148, 236 ],
            \ 'a':    [ 235, 148, 'bold' ],
            \ 'b':    [ 250, 238 ],
            \ 'c':    [ 148, 236 ],
            \ 'x':    [ 148, 236 ],
            \ 'y':    [ 250, 238 ],
            \ 'z':    [ 235, 148, 'bold' ],
            \ 'cwin': [ 148, 234 ],
            \ 'win':  [  59, 236 ],
            \ }

function! s:clear_backgrounds()
    " enable transparent background
    hi! Normal guibg=NONE ctermbg=NONE

    " transparent sign column
    hi! clear SignColumn


    " transparent line numbers
    hi! LineNr guibg=NONE ctermbg=NONE
    hi! CursorLineNr guibg=NONE ctermbg=NONE

    " transparent fold bg
    hi! Folded guibg=NONE ctermbg=NONE
endfunc

call s:clear_backgrounds()
