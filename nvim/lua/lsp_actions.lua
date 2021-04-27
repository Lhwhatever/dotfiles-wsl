local M = {}

function M.smart_jump_to_definition()
    local provider = require('lspsaga.provider')
    if provider.has_saga_def_preview() then
        vim.lsp.buf.definition()
    else
        vim.fn.nvim_feedkeys('<Enter>', 'n', true)
    end
end

return M
