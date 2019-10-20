"
" Preamble
"
syntax on
filetype plugin indent on
set nocompatible
set hidden

"
" Themes (Setup)
"
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 0
let g:gruvbox_undercurl = 0
let g:gruvbox_italicize_comments = 1

"
" Plugins
"
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
source ~/.config/nvim/plugins.vim

"
" Basic Options
"
set encoding=utf-8
set synmaxcol=500
set noshowmode
set noruler
set ttyfast
set cursorline
set list
set listchars=tab:»·,trail:·
set showbreak=↪\ 
set backspace=indent,eol,start
set showtabline=2
set signcolumn=auto:3
set wildoptions=pum
set nomodeline
set nostartofline

set incsearch
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
if has('nvim')
  set inccommand=nosplit
endif

set completeopt=noselect,menuone

set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set viewoptions=cursor,folds,slash,unix

set splitbelow
set splitright

set autoread

augroup nifoc_checktime
  autocmd!
  autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
augroup end

"set shell=/usr/local/bin/fish
set shell=/bin/sh

set diffopt=filler,internal,algorithm:histogram,indent-heuristic

"
" ui
"

colorscheme gruvbox

hi! NifocFloatBorder guifg=#3d3d3d guibg=#282828

set number relativenumber

augroup nifoc_numbertoggle
  autocmd!
  autocmd BufEnter,BufWinEnter * if nifoc#line_style#check_disable() | setlocal nonumber norelativenumber | endif
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd BufEnter,InsertLeave * if nifoc#line_style#check_toggle() | setlocal relativenumber | endif
  autocmd BufLeave,InsertEnter * if nifoc#line_style#check_toggle() | setlocal norelativenumber | endif
augroup end

if has('conceal')
  set conceallevel=2
  set concealcursor=niv
endif

set updatetime=300

set shortmess+=c
set shortmess-=S

"
" gui
"
if has('gui_running')
  " remove scrollbars
  set guioptions-=r
  set guioptions-=l
  set guioptions-=t

  " do not auto-copy visual selection
  set guioptions-=a

  " always show tabbar
  set showtabline=2
else
  set termguicolors
  set mouse=a mousemodel=popup_setpos
endif

"
" backups
"
set backup
set backupdir=~/.config/nvim/tmp/backup//
set noswapfile
set directory=~/.config/nvim/tmp/swap//

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

"
" clipboard
"
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }

set clipboard-=autoselect
set clipboard=unnamedplus

"
" Plugin Settings
"

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2.7'
let g:ruby_host_prog = '~/.asdf/shims/neovim-ruby-host'
let g:node_host_prog = '~/.asdf/installs/nodejs/10.15.0/.npm/bin/neovim-node-host'

" vim-yoink
let g:yoinkIncludeDeleteOperations = 1

" vim-matchup
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_offscreen = {
  \  'method': 'popup'
  \ }

" coc
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

highlight CocHighlightText guifg=none guibg=none gui=underline

augroup nifoc_coc
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" NERDTree
let g:NERDTreeShowHidden = 1

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let $FZF_PREVIEW_COMMAND = 'highlight --base16 --style=gruvbox-dark-medium -O truecolor -l --force {}'
let $FZF_DEFAULT_OPTS = '--layout=reverse'

let g:fzf_custom_file_list = 'rg --files --hidden --follow --glob "!.git/*"'

let g:fzf_layout = { 'window': 'call nifoc#fzf#floating_window()' }
let g:fzf_buffers_jump = 1

" vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'

let g:rooter_patterns = [
  \ 'mix.exs',
  \ 'rebar.config',
  \ 'Rakefile', 'Gemfile',
  \ 'package.json',
  \ '.gitlab-ci.yml', '.gitignore', '.git/'
  \ ]

" gen_tags
let g:gen_tags#use_cache_dir = 0

if (finddir('.git', ';') != '')
  let g:gen_tags#ctags_auto_gen = 1
  let g:gen_tags#ctags_auto_update = 1
  let g:gen_tags#gtags_auto_gen = 1
  let g:gen_tags#gtags_auto_update = 1
else
  let g:gen_tags#ctags_auto_gen = 0
  let g:gen_tags#ctags_auto_update = 0
  let g:gen_tags#gtags_auto_gen = 0
  let g:gen_tags#gtags_auto_update = 0
endif

" context_filetype
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte = [
  \ {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
  \ {'filetype' : 'css', 'start' : '<style>', 'end' : '</style>'},
  \ ]

" ale
let g:ale_virtualtext_cursor = 1

let g:ale_sign_error = "\uF00D"
let g:ale_sign_warning = "\uF071"
let g:ale_echo_msg_error_str = "\uF00D"
let g:ale_echo_msg_warning_str = "\uF071"
let g:ale_virtualtext_prefix = "\uF0DA".' '
let g:ale_echo_msg_format = '%severity% %s [%linter%]'

let g:ale_linters = {
  \ 'elixir': ['credo'],
  \ 'ruby': ['rubocop'],
  \ 'sh': ['shellcheck'],
  \ }

let g:ale_fixers = {
  \ 'elixir': ['mix_format'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'json': ['fixjson'],
  \ 'ruby': ['rubocop'],
  \ 'sh': ['shfmt'],
  \ }

let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" asyncrun
let g:asyncrun_status = 'stopped'

augroup nifoc_asyncrun
  autocmd!
  autocmd User AsyncRunStop call nifoc#asyncrun#maybe_open()
augroup end

" vim-test
let test#strategy = "asyncrun"

" indentLine
let g:indentLine_char = '¦'
let g:indentLine_concealcursor = 'inc'

if g:colors_name ==# 'iceberg'
  let g:indentLine_color_gui = '#292d42'
elseif g:colors_name ==# 'gruvbox'
  let g:indentLine_color_gui = '#3d3d3d'
end

let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_fileTypeExclude = ['json']

let g:indentLine_faster = 1

" vista.vim
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
      \ 'elixir': 'coc',
      \ 'javascript': 'coc',
      \ 'ruby': 'coc'
      \ }

let g:vista#renderer#enable_icon = 1

" git-messenger
let g:git_messenger_no_default_mappings = v:true

" devicons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 0
let g:webdevicons_enable_vimfiler = 0
let g:webdevicons_enable_airline_tabline = 0
let g:webdevicons_enable_airline_statusline = 0
let g:webdevicons_enable_ctrlp = 0
let g:webdevicons_enable_flagship_statusline = 0
let g:webdevicons_enable_denite = 0
let g:WebDevIconsOS = 'Darwin'

" lightline
let g:lightline = {
      \ 'colorscheme': g:colors_name,
      \ 'active': {
          \ 'left':  [ [ 'mode', 'paste' ],
          \            [ 'git', 'async_run', 'linter_warnings', 'linter_errors', 'linter_ok' ],
          \            [ 'method' ] ],
          \ 'right': [ [ 'lineinfo' ],
          \            [ 'percent' ],
          \            [ 'fileencoding', 'fileformat', 'spellcheck', 'formatter', 'filetype' ] ],
      \ },
      \ 'tabline': {
          \ 'left': [ [ 'tabs' ] ],
          \ 'right': [ [ 'close' ] ],
      \ },
      \ 'tab': {
          \ 'active': [ 'tabnum', 'filename', 'modified' ],
          \ 'inactive': [ 'tabnum', 'filename', 'modified' ],
      \ },
      \ 'component': {
          \ 'close': '%999X '."\uF00D".' ',
          \ 'percent': '%2p%% ☰',
      \ },
      \ 'component_function': {
          \ 'mode': 'nifoc#lightline#mode',
          \ 'filetype': 'nifoc#lightline#filetype',
          \ 'fileformat': 'nifoc#lightline#fileformat',
          \ 'git': 'nifoc#lightline#git',
          \ 'method': 'nifoc#lightline#nearest_method_or_function',
          \ 'formatter': 'nifoc#lightline#ale_fixer',
          \ 'spellcheck': 'nifoc#lightline#spellcheck_enabled',
          \ 'async_run': 'nifoc#lightline#asyncrun_status',
      \ },
      \ 'component_expand': {
          \ 'linter_warnings': 'nifoc#lightline#ale_warnings',
          \ 'linter_errors': 'nifoc#lightline#ale_errors',
          \ 'linter_ok': 'nifoc#lightline#ale_ok',
      \ },
      \ 'component_type': {
          \ 'readonly': 'error',
          \ 'linter_warnings': 'warning',
          \ 'linter_errors': 'error',
      \ },
      \ 'tab_component_function': {
          \ 'tabnum': 'nifoc#lightline#tab_num',
          \ 'filename': 'nifoc#lightline#tab_filename',
          \ 'modified': 'nifoc#lightline#tab_modified',
      \ },
    \ }

let g:lightline_tab_num_map = {
  \ 0: '🄌', 1: '➊', 2: '➋', 3: '➌', 4: '➍',
  \ 5: '➎', 6: '➏', 7: '➐', 8: '➑', 9: '➒'}

augroup nifoc_lightline
  autocmd!
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
  autocmd User ALEFixPre call lightline#update()
  autocmd User ALEFixPost call lightline#update()
  autocmd User ALELintPre call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User AsyncRunPre call lightline#update()
  autocmd User AsyncRunStart call lightline#update()
  autocmd User AsyncRunStop call lightline#update()
  autocmd User AsyncRunUpdate call lightline#update()
augroup end

" vim-projectionist
let g:projectionist_heuristics = {
      \   "lib/": {
      \     "lib/*.ex": {
      \        "alternate": "test/{}_test.exs",
      \        "type": "source",
      \     },
      \     "test/*_test.exs": {
      \        "alternate": "lib/{}.ex",
      \        "type": "test",
      \     },
      \   }
      \ }

"
" Keyboard Mappings
"
nnoremap <space> <nop>
nnoremap <silent> <CR> :noh<CR><CR>

let mapleader = " "
set timeoutlen=500

nnoremap <silent> <leader>o :call nifoc#fzf#smart_file_list()<CR>
nnoremap <silent> <leader>t :Vista finder<CR>
nmap <leader>s <Plug>RgRawSearch
vmap <leader>s <Plug>RgRawVisualSelection
nmap <leader>* <Plug>RgRawWordUnderCursor
nnoremap <silent> <leader>/ :History/<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>g :IndentGuidesToggle<CR>
nnoremap <silent> <leader>d :Dash<CR>
nnoremap <silent> <leader>v :Vista!!<CR>
nnoremap <silent> <leader>a :AT<CR>
nnoremap <silent> <leader>r :Repl<CR>
nnoremap <silent> <leader>aa :A<CR>
nnoremap <silent> <leader>as :AS<CR>
nnoremap <silent> <leader>av :AV<CR>
nnoremap <silent> <leader>ut :UndotreeToggle<CR>
nnoremap <silent> <leader>js :call nifoc#asyncrun#toggle()<CR>
nnoremap <silent> <leader>jc :AsyncStop()<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gh :Gbrowse<CR>
nmap <silent> <leader>gm :GitMessenger<CR>

" macOS
if has('gui_running')
  nnoremap <D-Left> <Home>
  nnoremap <D-Right> <End>
  inoremap <D-Left> <Home>
  inoremap <D-Right> <End>
endif

nnoremap <A-Left> b
nnoremap <A-Right> w
nnoremap <S-Left> ^
nnoremap <S-Right> $
inoremap <A-Left> <C-o>b
inoremap <A-Right> <C-o>w
inoremap <S-Left> <C-o>^
inoremap <S-Right> <C-o>$

" vim-cutlass
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

" vim-yoink
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
nmap <leader>ss <plug>(SubversiveSubstituteRange)
xmap <leader>ss <plug>(SubversiveSubstituteRange)
nmap <leader>sss <plug>(SubversiveSubstituteWordRange)

" vim-test
nmap <leader>ts :TestSuite<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tn :TestNearest<CR>

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ nifoc#coc#check_backspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call nifoc#coc#show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Bubbling Text
nmap <C-u> [e
nmap <C-d> ]e
vmap <C-u> [egv
vmap <C-d> ]egv
