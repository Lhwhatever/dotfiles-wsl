require 'utils'
require 'nvim_utils'

-- Rename files
function _G.rename_buffer(new_name, keep_path)
    local old_name = vim.fn.expand('%')

    if keep_path == 1 then
        new_name = '%:h/' .. new_name
    end

    vim.cmd('file ' .. new_name)
    vim.cmd('write')
    vim.fn.delete(old_name)
end

vim.cmd [[com! -nargs=1 -bang Rename call v:lua.rename_buffer(<f-args>, <bang>0)]]
