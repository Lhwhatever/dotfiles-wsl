require 'nvim_utils'

require 'bufferline'.setup { 
    options = {
        numbers = 'ordinal',
        mappings = true,
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = false,
        separator_style = { ' ', ' ' },
    }
}

local bufferline_maps = {
    ['n[b'] = { [[<cmd>BufferLineCyclePrev<CR>]], noremap = true };
    ['n]b'] = { [[<cmd>BufferLineCycleNext<CR>]], noremap = true };
    ['n[B'] = { [[<cmd>BufferLineMovePrev<CR>]], noremap = true };
    ['n]B'] = { [[<cmd>BufferLineMoveNext<CR>]], noremap = true };
    ['n<leader>b'] = { [[<cmd>BufferLinePick<CR>]], noremap = true };
}

nvim_apply_mappings(bufferline_maps, { silent = true })
