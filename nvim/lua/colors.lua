require 'utils'

if utils.has('termguicolors') then
    vim.o.termguicolors = true
end

vim.g.sonokai_style = 'default'
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_sign_column_background = 'none'
vim.g.sonokai_diagnostic_text_highlight = 1
vim.g.sonokai_better_performance = 1
vim.cmd 'colorscheme sonokai'
vim.cmd [[hi! link CursorLineNr String]]
