require 'nvim_utils'
local actions = require 'telescope.actions'

local telescope_maps = {
    ['n<C-p>'] = { '<cmd>Telescope find_files<cr>', noremap = true; };
    ['n<M-f>'] = { '<cmd>Telescope live_grep<cr>', noremap = true; };
    ['n<M-b>'] = { '<cmd>Telescope buffers<cr>', noremap = true; };
    ['n<M-h>'] = { '<cmd>Telescope help_tags<cr>', noremap = true; };
    ['n<M-p>'] = { '<cmd>Telescope commands<cr>', noremap = true; };
    ['n<leader>fd'] = { '<cmd>lua require"telescope.builtin".file_browser()<cr>', noremap = true; };
    ['n<leader>fm'] = { '<cmd>lua require"telescope.builtin".marks()<cr>', noremap = true; };
    ['n<leader>fq'] = { '<cmd>lua require"telescope.builtin".quickfix()<cr>', noremap = true; };
    ['n<leader>fl'] = { '<cmd>lua require"telescope.builtin".loclist()<cr>', noremap = true; };
    ['n<leader>fr'] = { '<cmd>lua require"telescope.builtin".lsp_references()<cr>', noremap = true; };
    ['n<leader>ff'] = { '<cmd>lua require"telescope.builtin".lsp_document_symbols()<cr>', noremap = true; };
    ['n<leader>F'] = { '<cmd>lua require"telescope.builtin".lsp_workspace_symbols()<cr>', noremap = true; };
    ['n<leader>fa'] = { '<cmd>lua require"telescope.builtin".lsp_code_actions()<cr>', noremap = true; };
    ['n<leader>fA'] = { '<cmd>lua require"telescope.builtin".lsp_range_code_actions()<cr>', noremap = true; };
    ['n<leader>gg'] = { '<cmd>lua require"telescope.builtin".git_status()<cr>', noremap = true; };
    ['n<leader>G'] = { '<cmd>lua require"telescope.builtin".git_commits()<cr>', noremap = true; };
    ['n<leader>gb'] = { '<cmd>lua require"telescope.builtin".git_bcommits()<cr>', noremap = true; };
}

nvim_apply_mappings(telescope_maps, { silent = true; })

require 'telescope'.setup {
    defaults = {
        mappings = {
            i = {
                ["<Tab>"] = actions.toggle_selection;
                ["<S-Tab>"] = actions.remove_selection;
            }
        }
    }
}
