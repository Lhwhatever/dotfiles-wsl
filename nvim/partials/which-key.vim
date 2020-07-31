let g:which_key_leader_map = { 'name': '+leader' }

let g:which_key_leader_map.n = [':OpenExplorer', 'open defx']

let g:which_key_leader_map.f = {
            \   'name': '+fzf',
            \   'f': [':FilesProject',  'project files'],
            \   'F': [':FilesProject!', 'project files (fullscreen)'],
            \   '!': [':FilesProject!', 'project files (fullscreen)'],
            \   'r': [':RgProject',     'ripgrep project'],
            \   'R': [':RgProject!',    'ripgrep project (fullscreen)'],
            \   'b': [':Buffers',       'buffers'],
            \   'B': [':Buffers!',      'buffers (fullscreen)'],
            \ }

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

let g:which_key_leader_map.h = [':nohl', 'remove highlights']
let g:which_key_leader_map.T = [':terminal', 'terminal']
let g:which_key_leader_map.t = {
            \   'name': '+tabs',
            \   'f': ['<C-w>gf',        'goto file at cursor in new tab'],
            \ }

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
