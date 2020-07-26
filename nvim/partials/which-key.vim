let g:which_key_leader_map = {}

let g:which_key_leader_map.n = ['n', 'open-defx-explorer']

let g:which_key_leader_map.w = {
            \ 'name': '+windows',
            \ 'h': ['wh',           'go left window'],
            \ 'j': ['wj',           'go window below'],
            \ 'k': ['wj',           'go window above'],
            \ 'l': ['wl',           'go right window'],
            \ 's': ['w-',           'horizontal split'],
            \ 'v': ['w\',           'vertical split'],
            \ '+': ['w+',           'horizontal resize +5'],
            \ '-': ['w-',           'horizontal resize -5'],
            \ '>': ['w>',           'vertical resize +5'],
            \ '<': ['w<',           'vertical resize -5'],
            \ '=': ['w=',           'autoresize windows'],
            \ 'q': ['wq',           'quit window'],
            \}

call which_key#register('\\', 'g:which_key_leader_map')
