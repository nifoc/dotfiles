call plug#begin('~/.config/nvim/plugged')

" Files
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'jsfaint/gen_tags.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'ryanoasis/vim-devicons'

" Languages
Plug 'elixir-editors/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'rust-lang/rust.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dag/vim-fish', { 'for': 'fish' }

" Utils
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
Plug 'w0rp/ale'
Plug 'kassio/neoterm'
Plug 'Yggdroot/indentLine'
Plug 'RRethy/vim-hexokinase'

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
Plug 'tpope/vim-surround'
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
