-- bootstrapping
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd [[au BufWritePost plugins.lua PackerCompile]]

local packer = require 'packer'

local compile_path = require 'packer.util'.join_paths(
    vim.fn.stdpath('data'),
    'site',
    'plugin',
    'packer_compiled.vim'
)

packer.init { compile_path = compile_path }

local is_windows = vim.g.env.os == 'Windows'

return packer.startup(function()
    use {
        'wbthomason/packer.nvim',
        opt = true
    }

    -- Editing
    use {
        'machakann/vim-sandwich',
        config = function() require 'sandwich' end,
        after = 'nvim_utils'
    }

    -- Lua companion tools
    use {
        'norcalli/nvim_utils',
        config = function() require 'general' end,
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        event = 'User NvimSpawn',
        config = function() require 'lsp' end,
    }

    use {
        'anott03/nvim-lspinstall',
        disable = is_windows,
        cmd = {'LspInstall'},
        after = 'nvim-lspconfig'
    }

    use {
        'glepnir/lspsaga.nvim',
        event = 'User NvimSpawn',
        after = 'nvim-lspconfig',
        config = function() require 'lspsaga'.init_lsp_saga() end
    }

    use {
        'onsails/lspkind-nvim',
        event = 'User NvimConnect',
        after = { 'nvim-compe' },
        config = function() require 'lspkind'.init {} end
    }

    -- Completion
    use {
        'hrsh7th/nvim-compe',
        requires = 'Raimondi/delimitMate',
        after = 'nvim_utils',
        config = function()
            require 'completion'
        end
    }

    local telescope_after = nil
    if not is_windows then
        telescope_after = 'nvim-treesitter'
    end

    -- Fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        event = 'User NvimConnect',
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
            {
                'kyazdani42/nvim-web-devicons',
                config = function() require 'nvim-web-devicons' end
            }
        },
        after = telescope_after,
        config = function() require 'fuzzy' end
    }

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        disable = is_windows,
        event = 'User NvimSpawn',
        config = function() require 'treesitter' end
    }

    -- Colorscheme
    use {
        'sainnhe/sonokai',
        event = 'User NvimConnect',
        config = function() require 'colors' end
    }

    -- Statusline and bufferline
    use {
        'akinsho/nvim-bufferline.lua',
        after = { 'nvim-lspconfig', 'sonokai' },
        event = 'User NvimConnect',
        config = function () require 'bline' end
    }

    local galaxyline_after = nil
    if is_windows then
        galaxyline_after = 'sonokai'
    else
        galaxyline_after = { 'sonokai', 'nvim-treesitter' }
    end

    use {
        'glepnir/galaxyline.nvim',
        event = 'User NvimConnect',
        after = galaxyline_after,
        config = function() require 'sline' end
    }

    -- Indent guides
    use {
        'lukas-reineke/indent-blankline.nvim',
        event = 'User NvimConnect',
        branch = 'lua',
        config = function() require 'indent' end
    }

    -- Git
    use {
        'tpope/vim-fugitive',
        event = 'User NvimConnect',
        cmd = { 'Git',  'GBrowse', 'GDelete', 'GRemove', 'GRename', 'Gdiffsplit', 'Ghdiffsplit', 'Gvdiffsplit', 'Gclog' }
    }

    use {
        'mhinz/vim-signify',
        event = 'User NvimConnect',
    }

    -- Commenting
    use {
        'b3nj5m1n/kommentary',
        event = 'User NvimSpawn',
        keys = {
            { 'n', '<Plug>kommentary_motion_default' },
            { 'v', '<Plug>kommentary_visual_default' },
            { 'n', '<Plug>kommentary_line_default' },
        }
    }
end)
