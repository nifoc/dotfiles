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
autocmd cursorhold,cursorholdi,focusgained,bufenter * checktime

"set shell=/usr/local/bin/fish
set shell=/bin/sh

set diffopt=filler,internal,algorithm:histogram,indent-heuristic

"
" ui
"

colorscheme gruvbox

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,BufWinEnter * if DisableLineStyle() | setlocal nonumber norelativenumber | endif
  autocmd FileType qf setlocal nonumber norelativenumber
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd BufEnter,InsertLeave * if UpdateLineStyle() | setlocal relativenumber | endif
  autocmd BufLeave,InsertEnter * if UpdateLineStyle() | setlocal norelativenumber | endif
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
" filetypes
"
augroup filetypes
  autocmd!
  autocmd bufread,bufnewfile *.rdoc setlocal filetype=rdoc
  autocmd FileType make setlocal noexpandtab shiftwidth=2 softtabstop=0
  autocmd bufread,bufnewfile *.tsv setlocal noexpandtab shiftwidth=2 softtabstop=0
  autocmd FileType json setlocal conceallevel=0
  autocmd FileType qf nnoremap <buffer> <silent> <esc> :q!<CR>
  autocmd FileType qf nnoremap <buffer> <silent> q :q!<CR>
augroup end

"
" spell check
"
augroup spell_check
  autocmd!
  autocmd FileType elixir,markdown,pandoc,rdoc setlocal spell
augroup end

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
  \  'method': 'status_manual'
  \ }

" coc
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

highlight CocHighlightText guifg=none guibg=none gui=underline

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup coc_actions
  autocmd!
  autocmd CursorHold * if <SID>HighlightSynStack() == 1 | silent call CocActionAsync('highlight') | endif
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" NERDTree
let g:NERDTreeShowHidden = 1

augroup nerdtree_actions
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
" let $FZF_PREVIEW_COMMAND = 'bat --theme="base16" --style=numbers,changes --color always {}'
let $FZF_PREVIEW_COMMAND = 'highlight --base16 --style=gruvbox-dark-medium -O truecolor -l --force {}'

if (finddir('.git', ';') != '')
  let g:fzf_custom_file_list = 'git ls-files -co --exclude-standard | uniq'
else
  let g:fzf_custom_file_list = 'rg --files --hidden --follow --glob "!.git/*"'
endif

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_buffers_jump = 1

source ~/.config/nvim/fzf.vim

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
  \ 'javascript': ['prettier'],
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

augroup asyncrun_actions
  autocmd!
  autocmd User AsyncRunStop call <SID>MaybeOpenAsyncRunList()
  autocmd BufWinLeave * call <SID>UpdateAsyncRunStatus()
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

" vista.vim
let g:vista_default_executive = 'coc'
let g:vista_executive_for = {
      \ 'elixir': 'coc'
      \ }
let g:vista_icon_indent = ["\uF0DA".' ', ""]

let g:vista#renderer#enable_icon = 1

let g:vista_fzf_preview = ['right:50%']

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

" neoterm
let g:neoterm_default_mod = 'belowright'
let g:neoterm_autoinsert = 1
let g:neoterm_size = 20
let g:neoterm_autoscroll = 1

" vim-pandoc
let g:pandoc#modules#disabled = ["formatting", "folding", "keyboard", "completion"]

" lightline
source ~/.config/nvim/lightline.vim

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
          \ 'mode': 'LightlineMode',
          \ 'filetype': 'LightlineFiletype',
          \ 'fileformat': 'LightlineFileformat',
          \ 'git': 'LightlineGit',
          \ 'method': 'LightlineNearestMethodOrFunction',
          \ 'formatter': 'LightlineAleFixer',
          \ 'spellcheck': 'LightlineSpellcheckEnabled',
          \ 'async_run': 'LightlineAsyncRunStatus',
      \ },
      \ 'component_expand': {
          \ 'linter_warnings': 'LightlineAleWarnings',
          \ 'linter_errors': 'LightlineAleErrors',
          \ 'linter_ok': 'LightlineAleOK',
      \ },
      \ 'component_type': {
          \ 'readonly': 'error',
          \ 'linter_warnings': 'warning',
          \ 'linter_errors': 'error',
      \ },
      \ 'tab_component_function': {
          \ 'tabnum': 'LightlineTabNum',
          \ 'filename': 'LightlineTabFilename',
          \ 'modified': 'LightlineTabModified',
      \ },
    \ }

let g:lightline_tab_num_map = {
  \ 0: '🄌', 1: '➊', 2: '➋', 3: '➌', 4: '➍',
  \ 5: '➎', 6: '➏', 7: '➐', 8: '➑', 9: '➒'}

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

nnoremap <silent> <leader>o :call FzfSmartFileList()<CR>
nnoremap <silent> <leader>t :Vista finder<CR>
nnoremap <leader>s :Rg<Space>
nnoremap <silent> <leader>/ :History/<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>g :IndentGuidesToggle<CR>
nnoremap <silent> <leader>d :Dash<CR>
nnoremap <silent> <leader>v :Vista!!<CR>
nnoremap <silent> <leader>a :AT<CR>
nnoremap <silent> <leader>r :<c-u>exec v:count.'Ttoggle'<CR>
nnoremap <silent> <leader>aa :A<CR>
nnoremap <silent> <leader>as :AS<CR>
nnoremap <silent> <leader>av :AV<CR>
nnoremap <silent> <leader>tt :Ttoggle<CR>
nnoremap <silent> <leader>ut :UndotreeToggle<CR>
nnoremap <silent> <leader>js :call <SID>ToggleAsyncRunList()<CR>
nnoremap <silent> <leader>jc :AsyncStop()<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gh :Gbrowse<CR>

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
      \ <SID>CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>ShowDocumentation()<CR>
nmap <silent> <leader>gm :GitMessenger<CR>

" Bubbling Text
nmap <C-u> [e
nmap <C-d> ]e
vmap <C-u> [egv
vmap <C-d> ]egv

" Erlang
augroup erlang_mapping
  autocmd!
  autocmd FileType erlang abbr <= =<
augroup END

"
" Custom Functions
"
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

function! SynStack()
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! DisableLineStyle()
  if &buftype ==# 'terminal' || &buftype ==# 'nofile' || &buftype ==# 'quickfix'
    return v:true
  else
    return v:false
  end
endfunction

function! UpdateLineStyle()
  if DisableLineStyle()
    return v:false
  else 
    let blacklist = [
          \ 'vista', 'nerdtree', 'startify', 'tagbar', 'fzf', 'vim-plug',
          \ 'netrw', 'ctrlsf', 'qf', 'nofile'
          \ ]
    return empty(&filetype) || index(blacklist, &filetype) == -1
  endif
endfunction

function! s:CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

function! s:HighlightSynStack()
  let search = getreg('/')
  let cword = expand('<cword>')

  if match(cword, search) == -1
    let stack = SynStack()

    if index(stack, 'elixirId') >= 0 || index(stack, 'elixirAlias') >= 0 || index(stack, 'elixirAtom') >= 0 || index(stack, 'elixirString') >= 0
      return 1
    else
      return 0
    endif
  else
    return 0
  endif
endfunction

function s:ToggleAsyncRunList() abort
  let l:asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

  if l:asyncrun_status !=# 'running' && l:asyncrun_status !=# 'failure'
    let g:asyncrun_status = 'stopped'
    doautocmd User AsyncRunUpdate
  endif

  call asyncrun#quickfix_toggle(20)
endfunction

function s:MaybeOpenAsyncRunList() abort
  let l:asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

  if l:asyncrun_status ==# 'failure'
    call asyncrun#quickfix_toggle(20, 1)
  else
    return 0
  endif
endfunction

function s:UpdateAsyncRunStatus() abort
  if &buftype ==# 'quickfix'
    let l:asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

    if l:asyncrun_status !=# 'running'
      let g:asyncrun_status = 'stopped'
      doautocmd User AsyncRunUpdate
    endif
  endif

  return 0
endfunction

augroup custom_functions
  autocmd!
  autocmd BufWritePre *.coffee,*.erl,*.ex,*.exs,*.hs,*.js,*.js.erb,*.ls,*.ls.erb,*.purs,*.rb,*.scss,*.ts call TrimWhiteSpace()
augroup END
