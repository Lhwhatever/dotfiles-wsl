require 'nvim_utils'

require 'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { 'python' }
    }
}

local autocmds = {
    -- disabled until folding works better
    --fold = {
    --    {"BufReadPre", "*", [[set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()]]}
    --}
}

nvim_create_augroups(autocmds)
