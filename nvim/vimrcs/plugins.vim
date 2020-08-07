call plug#begin(stdpath('data') . '/plugged')

" Editing
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'

if exists('g:vscode')
    Plug 'asvetliakov/vim-easymotion'
else
    if has('win32')
        Plug 'lervag/vimtex'
    endif

    " Window Management
    Plug 'voldikss/vim-floaterm'
    Plug 't9md/vim-choosewin'

    " Buffers
    Plug 'rbgrouleff/bclose.vim'

    " Start Screen
    Plug 'mhinz/vim-startify'

    " Aesthetics
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'

    " Colorschemes
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'crusoexia/vim-monokai'

    " Filesystem Navigation
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-icons'
    Plug 'kristijanhusak/defx-git'	
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Tags
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'liuchengxu/vista.vim'

    " Search
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'

    " Motions
    Plug 'easymotion/vim-easymotion'
    Plug 'bkad/CamelCaseMotion'
    Plug 'rhysd/accelerated-jk'
    Plug 'terryma/vim-expand-region'

    " Assistance
    Plug 'liuchengxu/vim-which-key' 

    " Editing
    Plug 'SirVer/ultisnips'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'jiangmiao/auto-pairs'

    " LSP
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    " Syntax
    Plug 'norcalli/nvim-colorizer.lua'      " Colors
    Plug 'bfrg/vim-cpp-modern'              " C++
    Plug 'HerringtonDarkholme/yats.vim'     " TypeScript
    Plug 'MaxMEllon/vim-jsx-pretty'         " TSX

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

    " Dev Icons (Must be loaded last)
    Plug 'ryanoasis/vim-devicons'

endif

call plug#end()
