" Python
let s:sandwich_recipes_python = [
            \ {
            \   'buns': ['r"', '"'],
            \   'motionwise': ['char', 'block'],
            \   'kind': ['add', 'replace'],
            \   'action': ['add'],
            \   'input': ['r"'],
            \ },
            \ {
            \   'buns': ['R"', '"'],
            \   'motionwise': ['char', 'block'],
            \   'kind': ['add', 'replace'],
            \   'action': ['add'],
            \   'input': ['R"'],
            \ },
            \ {
            \   'buns': ["r'", "'"],
            \   'motionwise': ['char', 'block'],
            \   'kind': ['add', 'replace'],
            \   'action': ['add'],
            \   'input': ["r'"],
            \ },
            \ {
            \   'buns': ["R'", "'"],
            \   'motionwise': ['char', 'block'],
            \   'kind': ['add', 'replace'],
            \   'action': ['add'],
            \   'input': ["R'"],
            \ },
            \ {
            \   'buns': ['[rR]"', '"'],
            \   'regex': 1,
            \   'quoteescape': 1,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 2,
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'input': ['r"', 'R"'],
            \ },
            \ {
            \   'buns': ["[rR]'", "'"],
            \   'regex': 1,
            \   'quoteescape': 1,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 2,
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ["r'", "R'"],
            \ },
            \ {
            \   'buns': ['[fF]"', '"'],
            \   'regex': 1,
            \   'quoteescape': 1,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 1,
            \   'inner_syntax': ['String', 'Constant'],
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ['f"', 'F"'],
            \ },
            \ {
            \   'buns': ["[fF]'", "'"],
            \   'regex': 1,
            \   'quoteescape': 1,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 1,
            \   'inner_syntax': ['String', 'Constant'],
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ["f'", "F'"],
            \ },
            \ {
            \   'buns': ['[uU]"', '"'],
            \   'regex': 1,
            \   'quoteescape': 1,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 1,
            \   'inner_syntax': ['String', 'Constant'],
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ['u"', 'U"'],
            \ },
            \ {
            \   'buns': ["[uU]'", "'"],
            \   'regex': 1,
            \   'quoteescape': 1,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 1,
            \   'inner_syntax': ['String', 'Constant'],
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ["u'", "U'"],
            \ },
            \ {
            \   'buns': ['\([rRfFuU]\|[rR][fF]\|[fF][rR]\)\="', '"'],
            \   'regex': 1,
            \   'quoteescape': 1,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 1,
            \   'inner_syntax': ['String', 'Constant'],
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ['"', 'q'],
            \ },
            \ ]

let sandwich_recipes_ecmascript = [
            \ {
            \   'buns': ['/', '/[gmiyus]*'],
            \   'regex': 1,
            \   'motionwise': ['char', 'block'],
            \   'nesting': 0,
            \   'expand_range': 0,
            \   'syntax': ['String'],
            \   'match_syntax': 2,
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ['R', '//', '/i', '/g']
            \ },
            \ {
            \   'buns': ['/', '/'],
            \   'motionwise': ['char', 'block'],
            \   'kind': ['add', 'replace'],
            \   'action': ['add'],
            \   'input': ['R', '//']
            \ },
            \ {
            \   'buns': ['/', '/i'],
            \   'motionwise': ['char', 'block'],
            \   'kind': ['add', 'replace'],
            \   'action': ['add'],
            \   'input': ['/i']
            \ },
            \ {
            \   'buns': ['/', '/g'],
            \   'motionwise': ['char', 'block'],
            \   'kind': ['add', 'replace'],
            \   'action': ['add'],
            \   'input': ['/g']
            \ },
            \ ]

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

