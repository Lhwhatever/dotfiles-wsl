" Setup colorizer
set termguicolors

" Keep multiple buffers open
set hidden

" Enable relative line numbers
set number
set relativenumber

" Enable indentation-based folding
set foldmethod=indent

" Split to right/below
set splitright
set splitbelow

" Filetype plugins
filetype plugin indent on

" Use clipboard instead of registers for copy-paste operations
set clipboard+=unnamedplus

" Disable stuff like --INSERT--
set noshowmode

" Tab/spaces settings
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set autoindent
set smartindent

" Shorter timeoutlen for faster WhichKey
set timeoutlen=800

" Things to make coc.nvim behave better
set cmdheight=2
set updatetime=300
set shortmess+=c
set nobackup
set nowritebackup

" Tabline displays
set showtabline=2

" Preserve last position
augroup preserve_last_position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Python settings
if has('unix')
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '~/.pynvim/bin/python3'
elseif has('win32')
    let g:python3_host_prog = 'C:\Users\ultim\AppData\Local\Programs\Python\Python38\python.exe'
endif

" Git settings
if has('unix') && has('nvim')
    let $GIT_EDITOR = 'nvr --remote-tab-wait'
endif

" Fix for incorrect terminal colors on nvim 0.4 and earlier
" Colors are taken from alacritty.yml
if !has('nvim-0.5')
    let g:tnb_colors = [
                \ "#000000", "#d54e53", "#b9ca4a", "#e6c547", 
                \ "#7aa6da", "#c397d8", "#70c0ba", "#eaeaea",
                \ "#666666", "#ff3334", "#9ec400", "#e7c547",
                \ "#7aa6da", "#b77ee0", "#54ced6", "#ffffff",
                \ ]

    for i in range(0, 15)
        exe printf('let g:terminal_color_%s = "%s"', i, g:tnb_colors[i])
    endfor
endif

function! s:create_scratch_buffer(help, ...)
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    let &filetype = get(a:, 1, 'text')
    exe 'file scratch-' . &filetype
    if !a:help
        call append(0, printf(&commentstring, 'Use :file <filename> to name this buffer.'))
    endif
endfunction

" Scratch buffer
command! -bang -nargs=? Scratch call s:create_scratch_buffer(<bang>0, <f-args>)
