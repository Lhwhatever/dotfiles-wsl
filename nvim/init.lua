require 'base'
base.get_env()

require 'plugins'
vim.cmd 'packloadall'

function _G.startup_call()
    if vim.g.env.head ~= 'VSCODE' then
        vim.cmd [[doautocmd User NvimSpawn]]
    end

    if vim.g.env.head == 'NVIM' then
        vim.cmd [[doautocmd User NvimConnect]]
    end
end

vim.cmd [[au VimEnter * call v:lua.startup_call()]]

require 'commands'
