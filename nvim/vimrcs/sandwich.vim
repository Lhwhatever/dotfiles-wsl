let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

let g:sandwich#recipes += [
            \ { 
            \   'buns': ['{ ', ' }'], 
            \   'nesting': 1, 
            \   'match_syntax': 1,
            \   'action': ['add'],
            \   'input': ['{'] 
            \ },
            \ { 
            \   'buns': ['[ ', ' ]'],
            \   'nesting': 1, 
            \   'match_syntax': 1,
            \   'action': ['add'],
            \   'input': ['[']
            \ },
            \ { 
            \   'buns': ['( ', ' )'],
            \   'nesting': 1,
            \   'match_syntax': 1,
            \   'action': ['add'],
            \   'input': ['('] 
            \ },
            \ { 
            \   'buns': ['{\s*', '\s*}'],
            \   'nesting': 1,
            \   'regex': 1,
            \   'match_syntax': 1,
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ['{'] 
            \ },
            \ { 
            \   'buns': ['[\s*', '\s*]'],
            \   'nesting': 1,
            \   'regex': 1,
            \   'match_syntax': 1,
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ['['] 
            \ },
            \ { 
            \   'buns': ['(\s*', '\s*)'],
            \   'nesting': 1,
            \   'regex': 1,
            \   'match_syntax': 1,
            \   'kind': ['delete', 'replace', 'textobj'],
            \   'action': ['delete'],
            \   'input': ['('] 
            \ },
            \ { 
            \   'buns': ['^', '$'],
            \   'nesting': 0,
            \   'match_syntax': 2,
            \   'syntax': ['String'],
            \   'kind': ['add', 'delete', 'textobj'],
            \   'action': ['add', 'delete'],
            \   'input': ['^$'] 
            \ }
            \ ]

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

augroup add_ft_recipes
    autocmd!
    autocmd FileType python call sandwich#util#addlocal(sandwich_recipes_python)
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact call sandwich#util#addlocal(sandwich_recipes_ecmascript)
augroup END
