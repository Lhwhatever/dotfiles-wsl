require 'nvim_utils'

function in_qf(func, ...)
    func(...)
    vim.fn.command()
end

local nvim_lsp = require 'lspconfig'
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) nvim.buf_set_keymap(bufnr, ...) end
    nvim.buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gdd', [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
    buf_set_keymap('n', 'gD', [[<cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
    buf_set_keymap('n', 'gi', [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
    buf_set_keymap('n', 'gh', [[<cmd>lua require 'lspsaga.provider'.lsp_finder()<CR>]], opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    buf_set_keymap('n', 'gd', [[:Lspsaga preview_definition<CR>]], opts)
    buf_set_keymap('n', '<Enter>', [[<cmd> lua require('lsp_actions').smart_jump_to_definition()<CR>]], opts)
    buf_set_keymap('n', 'K', [[:Lspsaga hover_doc<CR>]], opts)
    buf_set_keymap('n', '<C-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
    buf_set_keymap('n', '<C-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)

    buf_set_keymap('n', 'cd', [[:Lspsaga show_line_diagnostics<CR>]], opts)
    buf_set_keymap('n', ']e', [[:Lspsaga diagnostic_jump_next<CR>]], opts)
    buf_set_keymap('n', '[e', [[:Lspsaga diagnostic_jump_prev<CR>]], opts)

    buf_set_keymap('n', 'gs', [[:Lspsaga signature_help<CR>]], opts)
    buf_set_keymap('n', '<leader>rn', [[:Lspsaga rename<CR>]], opts)

    buf_set_keymap('n', 'ga', [[:Lspsaga code_action<CR>]], opts)
    buf_set_keymap('v', 'ga', [[:<C-U>Lspsaga range_code_action<CR>]], opts)

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Servers with normal settings
local servers = { "pyls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { 
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Lua
local sumneko_root_path = vim.fn.stdpath('data') .. '/lspinstall/lua-langauge-server' -- note misspelling of language
local sumneko_bin = sumneko_root_path .. '/bin/' .. nvim.g.env.os .. '/lua-language-server'

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_bin, '-E', sumneko_root_path .. '/main.lua'},
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}
