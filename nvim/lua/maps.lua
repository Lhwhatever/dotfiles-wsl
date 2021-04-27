require 'nvim_utils'

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local general_maps = {
    ['n<C-h>'] = { '<C-w>h', noremap = true; };
    ['n<C-j>'] = { '<C-w>j', noremap = true; };
    ['n<C-k>'] = { '<C-w>k', noremap = true; };
    ['n<C-l>'] = { '<C-w>l', noremap = true; };
    ['n<F5>'] = { '<cmd>noh<CR><C-l>', noremap = true; };
    ['nY'] = { [[y$]], noremap = true; };
    ['nj'] = { [[(v:count > 0 ? 'j' : 'gj')]], noremap = true, expr = true; };
    ['nk'] = { [[(v:count > 0 ? 'k' : 'gk')]], noremap = true, expr = true; };
    ['n[q'] = { [[':<C-u>cprev ' . v:count1 . '<CR>']], noremap = true, expr = true; };
    ['n]q'] = { [[':<C-u>cnext ' . v:count1 . '<CR>']], noremap = true, expr = true; };
    ['n[Q'] = { [[':<C-u>cfir ' . v:count1 . '<CR>']], noremap = true, expr = true; };
    ['n]Q'] = { [[:<C-u>clast<CR>]], noremap = true };
    ['n<leader>Q'] = { [[:<C-u>cclose<CR>]], noremap = true };
}

nvim_apply_mappings(general_maps, { silent = true, noremap = true })
