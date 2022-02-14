-- Disable some built-in plugins
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_gzip = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_logipat = 1
vim.g.loaded_tutor_mode_plugin = 1

vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Require Plugin Configuration

-- Fixes
require('nifoc.config.cursorline')

-- Keybindings
require('nifoc.config.whichkey')
require('nifoc.config.yoink')
require('nifoc.config.lightspeed')

-- Syntax
require('nifoc.config.treesitter')

-- Telescope
require('nifoc.config.telescope')
require('nifoc.config.project')
require('nifoc.config.todo_comments')

-- LSP
require('nifoc.config.diagnostic')
require('nifoc.config.lsp')
require('nifoc.config.null_ls')
require('nifoc.config.lsp_trouble')
require('nifoc.config.illuminate')

-- cmp
require('nifoc.config.completion')

-- Pairs
require('nifoc.config.autopairs')
require('nvim-ts-autotag').setup()
require('nifoc.config.matchup')

-- Comments
require('nifoc.config.comments')

-- Textobjects

-- UI
require('nifoc.config.lualine')
require('nifoc.config.bufferline')
require('nifoc.config.nvim_tree')
require('nifoc.config.indent_line')
require('nifoc.config.virt_column')
require('nifoc.config.colorizer')
require('nifoc.config.gitsigns')
require('spellsitter').setup()
vim.notify = require('notify')
require('nifoc.config.visual_eof')
require('nifoc.config.fterm')
