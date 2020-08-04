augroup whichkeyhidestatus
    autocmd! FileType which_key
    autocmd FileType which_key set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

let g:which_key_leader_map = { 'name': '+leader' }

let g:which_key_leader_map.n = [':OpenExplorer', 'toggle defx window']
let g:which_key_leader_map.N = [':OpenThisInExplorer', 'toggle defx window (this file)']

let g:which_key_leader_map.f = {
            \   'name': '+fzf',
            \   'f': [':FilesProject',  'project files'],
            \   'r': [':RgProject',     'ripgrep project'],
            \   'R': [':RgProject!',    'ripgrep project (fullscreen)'],
            \   'b': [':Buffers',       'buffers'],
            \   'B': [':Buffers!',      'buffers (fullscreen)'],
            \   'l': [':Vista finder',  'find LSP symbols'],
            \ }

let g:which_key_leader_map.F = [':FilesProject!', 'fzf project files (fullscreen)']

let g:which_key_leader_map.b = {
            \   'name': '+buffers',
            \   'b': [':Buffers',       'open buffer'],
            \   'd': [':Bclose',        'close buffer'],
            \ }

let g:which_key_leader_map.B = [':Buffers!', 'fzf buffers (fullscreen)']

let g:which_key_leader_map['\'] = ['<Plug>(easymotion-prefix)', '+easymotion']

let g:which_key_leader_map.w = {
            \   'name': '+windows',
            \   'h': ['<C-w>h',         'go left window'],
            \   'j': ['<C-w>j',         'go window below'],
            \   'k': ['<C-w>k',         'go window above'],
            \   'l': ['<C-w>l',         'go right window'],
            \   's': [':split',         'horizontal split'],
            \   'v': [':vsplit',        'vertical split'],
            \   '+': [':resize +5',     'heighten by 5'],
            \   '-': [':resize -5',     'shorten by 5'],
            \   '>': [':vert res +5',   'widen by 5'],
            \   '<': [':vert res -5',   'narrow by 5'],
            \   '=': ['<C-w>=',         'balance windows'],
            \   'q': ['<C-w>q',         'quit window'],
            \   'f': ['<C-w>f',         'split and goto file at cursor'],
            \   'H': ['<C-w>H',         'as new top-level split (left)'],
            \   'J': ['<C-w>J',         'as new top-level split (bottom)'],
            \   'K': ['<C-w>K',         'as new top-level split (top)'],
            \   'L': ['<C-w>L',         'as new top-level split (right)'],
            \ }

let g:which_key_leader_map.T = [':FloatermShow!', 'show all terminals']
let g:which_key_leader_map.t = {
            \   'name': '+terminal',
            \   't': [':FloatermTry shell',     'shell'],
            \   'p': [':FloatermTry python',    'python REPL'],
            \   'r': [':FloatermTry ranger',    'ranger'],
            \   'g': [':FloatermTry lazygit',   'lazygit'],
            \ }

let g:which_key_leader_map.l = {
            \   'name': '+language',
            \   'v': [':Vista!! coc',                   'toggle tags window'],
            \   'p': [':CocList diagnostics',           'diagnose problems'],
            \   'd': ['<Plug>(coc-definition)',         'go to definition'],
            \   't': ['<Plug>(coc-type-definition)',    'go to type definition'],
            \   'i': ['<Plug>(coc-implementation)',     'go to implementation'],
            \   'r': ['<Plug>(coc-references)',         'go to references'],
            \ }

let g:which_key_leader_map.a = ['<Plug>(coc-codeaction-selected)', 'run code actions on {motion}']
let g:which_key_leader_map.aa = ['<Plug>(coc-codeaction-line)', 'run code actions on line']
let g:which_key_leader_map.A = ['<Plug>(coc-codeaction)', 'run code actions on buffer']

let g:which_key_leader_map.r = {
            \   'name': '+refactor',
            \   'n': ['<Plug>(coc-rename)',         'rename symbol']
            \ }

let g:which_key_leader_map.R = ['<Plug>(coc-refactor)', 'open refactor window']

call which_key#register('\', 'g:which_key_leader_map')

let g:which_key_easymotion_map = {
            \   'name': '+easymotion',
            \   'w':  ['<Plug>(easymotion-w)',      'start of following words'],
            \   'W':  ['<Plug>(easymotion-W)',      'start of following WORDs'],
            \   'e':  ['<Plug>(easymotion-e)',      'end of following words'],
            \   'E':  ['<Plug>(easymotion-E)',      'end of following WORDs'],
            \   'b':  ['<Plug>(easymotion-b)',      'start of preceding words'],
            \   'B':  ['<Plug>(easymotion-B)',      'start of preceding WORDs'],
            \   'ge': ['<Plug>(easymotion-ge)',     'end of preceding words'],
            \   'gE': ['<Plug>(easymotion-gE)',     'end of preceding WORDs'],
            \   'f':  ['<Plug>(easymotion-f)',      'find following {char}s'],
            \   'F':  ['<Plug>(easymotion-F)',      'find preceding {char}s'],
            \   't':  ['<Plug>(easymotion-t)',      'char before following {char}s'],
            \   'T':  ['<Plug>(easymotion-T)',      'char after preceding {char}s'],
            \   'n':  ['<Plug>(easymotion-n)',      'repeat last search forwards'],
            \   'N':  ['<Plug>(easymotion-N)',      'repeat last search backwards'],
            \   'j':  ['<Plug>(easymotion-j)',      'lines below'],
            \   'k':  ['<Plug>(easymotion-k)',      'lines above'],
            \   '^':  ['<Plug>(easymotion-sol-j)',  'preceding start of lines'],
            \   'g^': ['<Plug>(easymotion-sol-k)',  'following start of lines'],
            \   '$':  ['<Plug>(easymotion-eol-k)',  'preceding end of lines'],
            \   'g$': ['<Plug>(easymotion-eol-j)',  'following end of lines'],
            \   's':  ['<Plug>(easymotion-overwin-f2)', 'search 2 chars (overwin)'],
            \   'gw': ['<Plug>(easymotion-overwin-w)', 'start of words (overwin)'],
            \   'gg': ['<Plug>(easymotion-overwin-line)', 'lines (overwin)'],
            \   '<Space>':  ['<Plug>(easymotion-jumptoanywhere)', 'camelCase/snake_case'],
            \   '\': 'which_key_ignore',
            \ }

call which_key#register('\\', 'g:which_key_easymotion_map')
