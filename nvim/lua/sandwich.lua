require 'nvim_utils'

local recipes = vim.call('sandwich#get_recipes')
table.insert(recipes, {
    buns = { '{ ', ' }' },
    nesting = 1,
    match_syntax = 1,
    action = { 'add' },
    input = { '{' }
})

table.insert(recipes, {
    buns = { '[ ', ' ]' },
    nesting = 1,
    match_syntax = 1,
    action = { 'add' },
    input = { '[' }
})

table.insert(recipes, {
    buns = { '( ', ' )' },
    nesting = 1,
    match_syntax = 1,
    action = { 'add' },
    input = { '(' }
})

table.insert(recipes, {
    buns = { '{\\s*', '\\s*}' },
    nesting = 1,
    regex = 1,
    match_syntax = 1,
    kind = { 'delete', 'replace', 'textobj' },
    action = { 'delete' },
    input = { '{' }
})

table.insert(recipes, {
    buns = { '[\\s*', '\\s*]' },
    nesting = 1,
    regex = 1,
    match_syntax = 1,
    kind = { 'delete', 'replace', 'textobj' },
    action = { 'delete' },
    input = { '[' }
})

table.insert(recipes, {
    buns = { '(\\s*', '\\s*)' },
    nesting = 1,
    regex = 1,
    match_syntax = 1,
    kind = { 'delete', 'replace', 'textobj' },
    action = { 'delete' },
    input = { '(' }
})

table.insert(recipes, {
    buns = { '^', '$' },
    nesting = 0,
    match_syntax = 2,
    syntax = {'String'},
    kind = { 'add', 'delete', 'textobj' },
    action = { 'add', 'delete' },
    input = { '^$' }
})

table.insert(recipes, {
    buns = {}
})

vim.g['sandwich#recipes'] = recipes
vim.cmd 'runtime! vimrcs/sandwich.vim'

-- Python mappings
local python_maps = {
    {
        buns = { 'r"', '"' },
        motionwise = { 'char', 'block' },
        kind = { 'add', 'replace' },
        action = { 'add' },
        input = { 'r' }
    }
}
