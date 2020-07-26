call plug#begin(stdpath('data') . '/plugged')

" Start Screen
Plug 'mhinz/vim-startify'

" Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'edkolev/tmuxline.vim'
Plug 'norcalli/nvim-colorizer.lua'

" Filesystem Navigation
Plug 'tpope/vim-vinegar'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'	
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'tpope/vim-fugitive'

" Motions
Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'
Plug 'rhysd/accelerated-jk'
Plug 'terryma/vim-expand-region'

" Assistance
Plug 'liuchengxu/vim-which-key' 

" Editing
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'SirVer/ultisnips'
Plug 'AndrewRadev/splitjoin.vim'

" LSP
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Languages
Plug 'bfrg/vim-cpp-modern'              " C++
Plug 'HerringtonDarkholme/yats.vim'     " TypeScript
Plug 'peitalin/vim-jsx-typescript'      " TSX

" LaTeX
if has('win32')
    Plug 'lervag/vimtex'
endif

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Dev Icons (Must be loaded last)
Plug 'ryanoasis/vim-devicons'

call plug#end()
