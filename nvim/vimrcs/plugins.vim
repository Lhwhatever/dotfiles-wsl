call plugpac#begin()

Pack 'k-takata/minpac', { 'type': 'opt' }
Pack 'tpope/vim-repeat'
Pack 'machakann/vim-sandwich'

" Motion
Pack 'bkad/CamelCaseMotion'

" Search
Pack 'easymotion/vim-easymotion'
Pack 'haya14busa/incsearch.vim'
Pack 'haya14busa/incsearch-fuzzy.vim'
Pack 'haya14busa/incsearch-easymotion.vim'

" Utility
Pack 'Yggdroot/indentLine', { 'type': 'opt' }

" Window Management
Pack 'rbgrouleff/bclose.vim', { 'on': 'Bclose' }
Pack 'voldikss/vim-floaterm', { 'on': ['FloatermToggle', 'FloatermShow', 'FloatermList', 'FloatermNew'] }

Pack 't9md/vim-choosewin', { 'on': ['<Plug>(choosewin)', 'ChooseWinSwap', 'ChooseWinSwapStay'] }

" Start Screen
Pack 'mhinz/vim-startify', { 'type': 'opt' }

" Aesthetics
Pack 'itchyny/lightline.vim', { 'type': 'opt' }
Pack 'bagrat/vim-buffet', { 'type': 'opt' }
Pack 'vim-airline/vim-airline', { 'type': 'opt' }
Pack 'vim-airline/vim-airline-themes', { 'type': 'opt' }
Pack 'edkolev/tmuxline.vim', { 'type': 'opt' }
Pack 'patstockwell/vim-monokai-tasty', { 'type': 'opt' }
Pack 'crusoexia/vim-monokai', { 'type': 'opt' }

" Filesystem Navigation
Pack 'junegunn/fzf', { 'type': 'opt', 'do': { -> fzf#install() } }
Pack 'junegunn/fzf.vim', { 'type': 'opt' }

" Git
Pack 'tpope/vim-fugitive', { 'type': 'opt' }

" Tags
Pack 'ludovicchabant/vim-gutentags', { 'type': 'opt' }
Pack 'liuchengxu/vista.vim', { 'type': 'opt' }

" Assistance
Pack 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKeyVisual'] }

" Editing
Pack 'SirVer/ultisnips', { 'type': 'opt' }

Pack 'AndrewRadev/splitjoin.vim', {
            \ 'on': ['SplitjoinSplit', 'SplitjoinJoin', '<Plug>(SplitjoinSplit)', '<Plug>(SplitjoinJoin)'],
            \ }

Pack 'jiangmiao/auto-pairs'
Pack 'mattn/emmet-vim', {
            \ 'for': ['html', 'css', 'javascriptreact', 'typescriptreact', 'jsx', 'tsx'],
            \ }

" Language
Pack 'dense-analysis/ale', { 'type': 'opt' }
Pack 'neoclide/coc.nvim', { 'type': 'opt', 'branch': 'release' }

" Syntax
Pack 'rrethy/vim-hexokinase', { 'type': 'opt', 'do': 'make hexokinase' }

Pack 'bfrg/vim-cpp-modern', { 'for': 'cpp' }

Pack 'HerringtonDarkholme/yats.vim', { 
            \ 'for': ['typescript', 'typescriptreact'],
            \ }

Pack 'MaxMEllon/vim-jsx-pretty', { 
            \ 'for': ['javascriptreact', 'typescriptreact', 'jsx', 'tsx'],
            \ }

Pack 'iamcco/markdown-preview.nvim', {
            \ 'for': 'markdown',
            \ 'do': 'cd app & yarn install',
            \ }

Pack 'ryanoasis/vim-devicons', { 'type': 'opt' }

call plugpac#end()

packloadall
