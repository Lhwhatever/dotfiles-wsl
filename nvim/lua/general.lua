require 'utils'
require 'nvim_utils'

if vim.g.env.head == 'VSCODE' then
    return
end

require 'maps'

-- Keep multiple buffers open
vim.o.hidden = true

-- Split to right/below
vim.o.splitright = true
vim.o.splitbelow = true

-- Use clipboard instead of registers for copy-paste operations
vim.o.clipboard = 'unnamedplus'

-- Folding
-- temporary until treesitter folding is better supported
-- buffer local options need to use :set to set default
vim.cmd [[set foldmethod=indent foldlevel=2]]

-- Tabs/spaces
vim.o.smarttab = true
vim.cmd [[set shiftwidth=4 tabstop=4 expandtab]]

-- Line numbers
vim.cmd [[set number]]
local autocmds = {
    numbertoggle = {
        {"BufEnter,FocusGained,InsertLeave",    "*",    "setl relativenumber"},
        {"BufLeave,FocusLost,InsertEnter",      "*",    "setl norelativenumber"},
    }
}
nvim_create_augroups(autocmds)

-- No backups
vim.g.backup = false
vim.g.writebackup = false

-- Update time
vim.o.updatetime = 100

-- Python settings
if vim.g.env.os == 'Windows' then
    vim.g.python3_host_prog = 'C:\\tools\\neovim\\python\\Scripts\\python.exe'
elseif vim.g.env.os == 'Linux' then
    vim.g.python_host_prog = '/usr/bin/python2'
    vim.g.python3_host_prog = '~/.pynvim/bin/python3'
end

