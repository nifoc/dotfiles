call plug#begin('~/.config/nvim/plugged')

" Files
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'jsfaint/gen_tags.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/context_filetype.vim'

" Languages
Plug 'sheerun/vim-polyglot'

" Utils
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Autocomplete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'
Plug 'rizzatti/dash.vim'
Plug 'liuchengxu/vista.vim'

" Convenience
Plug 'janko-m/vim-test'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/caw.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'andymass/vim-matchup'
Plug 'airblade/vim-rooter'
Plug 'zhimsel/vim-stay'
Plug 'machakann/vim-sandwich'
Plug 'hgiesel/vim-motion-sickness'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'andyl/vim-textobj-elixir'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'skywind3000/asyncrun.vim'

" Themes
Plug 'cocopon/iceberg.vim'
Plug 'gruvbox-community/gruvbox'

call plug#end()
