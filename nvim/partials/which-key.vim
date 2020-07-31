let g:which_key_leader_map = { 'name': 'Leader map' }

let g:which_key_leader_map.n = ['\n', 'open defx']
let g:which_key_leader_map.f = ['\f', 'fzf']
let g:which_key_leader_map.F = ['\F', 'fzf fullscreen']
let g:which_key_leader_map['\'] = {
            \   'name': '+easymotion',
            \ }

let g:which_key_leader_map.w = {
            \   'name': '+windows',
            \   'h': ['\wh',         'go left window'],
            \   'j': ['\wj',         'go window below'],
            \   'k': ['\wk',         'go window above'],
            \   'l': ['\wl',         'go right window'],
            \   's': ['\ws',         'horizontal split'],
            \   'v': ['\wv',         'vertical split'],
            \   '+': ['\w+',         'heighten by 5'],
            \   '-': ['\w-',         'shorten by 5'],
            \   '>': ['\w>',         'widen by 5'],
            \   '<': ['\w<',         'narrow by 5'],
            \   '=': ['\w=',         'balance windows'],
            \   'q': ['\wq',         'quit window'],
            \   'f': ['\wf',         'split and goto file'],
            \   'H': ['\wH',         'move window to new split (left)'],
            \   'J': ['\wJ',         'move window to new split (bottom)'],
            \   'K': ['\wK',         'move window to new split (top)'],
            \   'L': ['\wL',         'move window to new split (right)'],
            \ }

let g:which_key_leader_map.h = [':nohl', 'remove highlights']
let g:which_key_leader_map.T = [':terminal', 'terminal']
let g:which_key_leader_map.t = {
            \   'name': '+tabs',
            \   'f': ['\wf',        'goto file in new tab'],
            \ }

call which_key#register('\', 'g:which_key_leader_map')

