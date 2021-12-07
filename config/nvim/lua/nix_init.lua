-- Preamble
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.opt.compatible = false
vim.opt.hidden = true
vim.opt.shell = '/bin/sh'

-- Options
vim.opt.encoding = 'utf-8'
vim.opt.synmaxcol = 500
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = {tab = '»·', trail = '·'}
vim.opt.showbreak = '↪ '
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes:1'
vim.opt.wildoptions = 'pum'
vim.opt.modeline = false
vim.opt.startofline = false
vim.opt.synmaxcol = 300

vim.opt.incsearch = true
vim.opt.grepprg = 'rg --vimgrep --no-heading'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.opt.inccommand = 'nosplit'

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.viewoptions = {'cursor', 'folds', 'slash', 'unix'}

vim.opt.foldenable = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.autoread = true

vim.opt.diffopt = {'filler', 'internal', 'algorithm:histogram', 'indent-heuristic'}

vim.opt.spelllang = {'en', 'de'}

-- UI
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'niv'

-- See: https://github.com/antoinemadec/FixCursorHold.nvim
vim.opt.updatetime = 750
vim.g.cursorhold_updatetime = 100

vim.opt.shortmess:append('c')
vim.opt.shortmess:remove('S')

vim.opt.termguicolors = true
vim.cmd('set mouse=a mousemodel=popup_setpos')

-- Plugins
require('nifoc.config.themes')
require('nifoc.plugins')

-- Theme
vim.opt.background = 'dark'
vim.cmd('colorscheme dracula')

-- Backups
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.local/share/nvim/undo//'

-- Clipboard
vim.g.clipboard = {
  name = 'pbcopy',
  copy = {
    ['+'] = 'pbcopy',
    ['*'] = 'pbcopy',
  },
  paste = {
    ['+'] = 'pbpaste',
    ['*'] = 'pbpaste',
  },
  cache_enabled = 0,
}

vim.cmd('set clipboard+=unnamedplus')

-- Keymap
require('nifoc.keymap').setup()

-- Autocmds
vim.cmd('augroup nifoc_numbertoggle')
  vim.cmd('autocmd!')
  vim.cmd("autocmd BufEnter,BufWinEnter * lua require('nifoc.utils.line_style').maybe_set_special_style()")
  vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
  vim.cmd("autocmd BufEnter,InsertLeave * lua require('nifoc.utils.line_style').maybe_set_relativenumber(true)")
  vim.cmd("autocmd BufLeave,InsertEnter * lua require('nifoc.utils.line_style').maybe_set_relativenumber(false)")
vim.cmd('augroup end')

vim.cmd('augroup nifoc_yank')
  vim.cmd('autocmd!')
  vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}')
vim.cmd('augroup end')
