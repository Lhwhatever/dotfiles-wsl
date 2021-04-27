require 'nvim_utils'

vim.o.completeopt = 'menu,menuone,noselect'
vim.g.delimitMate_expand_cr = 2
vim.g.delimitMate_expand_space = 1
vim.g.delimitMate_jump_expansion = 1
vim.g.delimitMate_balance_matchpairs = 1

local completion_maps = {
    ['i<C-space>'] = {
        [[compe#complete()]],
        noremap = true, expr = true;
    };
    ['i<CR>'] = {
        [[compe#confirm({ 'keys': "<Plug>delimitMateCR", 'mode': '' })]],
        noremap = true, expr = true;
    };
    ["i<C-e>"] = {
        [[compe#close('<C-e>')]],
        noremap = true, expr = true;
    };
    ["i<C-u>"] = {
        [[compe#scroll({ 'delta': +4 })]],
        noremap = true, expr = true;
    };
    ["i<C-d>"] = {
        [[compe#scroll({ 'delta': -4 })]],
        noremap = true, expr = true;
    };
    ["i<Tab>"] = {
        [[v:lua.tab_complete()]],
        noremap = true, expr = true;
    };
    ["s<Tab>"] = {
        [[v:lua.tab_complete()]],
        noremap = true, expr = true;
    };
    ["i<S-Tab>"] = {
        [[v:lua.s_tab_complete()]],
        noremap = true, expr = true;
    };
    ["s<S-Tab>"] = {
        [[v:lua.s_tab_complete()]],
        noremap = true, expr = true;
    }
}

nvim_apply_mappings(completion_maps, { silent = true })

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return utils.t '<C-n>'
    elseif check_back_space() then
        return utils.t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return utils.t '<C-p>'
    else
        return utils.t '<S-Tab>'
    end
end

require 'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    preselect = 'enable';

    source = {
        path = true;
        buffer = true;
        nvim_lsp = true;
        nvim_lua = true;
    }
}

