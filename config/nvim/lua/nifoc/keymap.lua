local wk = require('which-key')
local npairs = require('nvim-autopairs')

local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_themes = require('telescope.themes')

-- Global key function
_G.nifoc_keymap_cr_complete = function()
  return npairs.autopairs_cr()
end

local M = {}

function M.setup()
  vim.api.nvim_set_keymap('n', '<space>', '<nop>', {noremap = true})
  vim.g.mapleader = ' '
  vim.opt.timeoutlen = 500

  -- <leader> mappings
  local leader = {
    n = {
      "<cmd>NvimTreeToggle<CR>",
      "Toggle nvim-tree"
    },
    o = {
      function() require('nifoc.utils.telescope').project_files() end,
      "Find Files"
    },
    s = {
      function() telescope_builtin.live_grep(telescope_themes.get_ivy()) end,
      "Live Grep"
    },
    ["ut"] = {
      "<cmd>UndotreeToggle<CR>",
      "Undotree"
    },
    f = {
      name = "file",
      n = {
        "<cmd>enew<cr>",
        "New File"
      },
    },
    b = {
      name = "buffer",
      l = {
        function() telescope_builtin.buffers(telescope_themes.get_dropdown()) end,
        "List Buffers"
      },
      n = {
        "<cmd>BufferLineCycleNext<CR>",
        "Next Buffer"
      },
      p = {
        "<cmd>BufferLineCyclePrev<CR>",
        "Previous Buffer"
      },
      f = {
        function() telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown()) end,
        "Find In Buffer"
      },
      t = {
        function() telescope_builtin.treesitter(telescope_themes.get_dropdown()) end,
        "Find Via Treesitter"
      },
    },
    p = {
      name = "project",
      t = {
        "<cmd>TodoTelescope<CR>",
        "TODO Comments"
      },
    },
    v = {
      name = "vcs",
      s = {
        function() telescope_builtin.git_status(telescope_themes.get_ivy()) end,
        "Status"
      },
      b = {
        function() telescope_builtin.git_branches(telescope_themes.get_ivy()) end,
        "List Branches"
      },
      l = {
        function() require('gitsigns').blame_line() end,
        "Blame Line"
      },
    },
    d = {
      name = "debug",
      l = {
        name = "lsp",
        i = {
          "<cmd>LspInfo<CR>",
          "Info"
        },
        r = {
          "<cmd>LspRestart<CR>",
          "Restart"
        }
      },
      t = {
        "<cmd>TSPlaygroundToggle<CR>",
        "TS Playground"
      },
      n = {
        function() telescope.extensions.notify.notify() end,
        "Notifications"
      },
    }
  }

  -- Register which-key mappings
  wk.register(leader, {prefix = "<leader>", noremap = false, silent = true})

  -- Other mappings
  vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', {noremap = true, silent = true})

  vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.nifoc_keymap_cr_complete()', {noremap = true, expr = true, silent = true})

  vim.api.nvim_set_keymap('n', '<A-Left>', 'b', {noremap = true})
  vim.api.nvim_set_keymap('n', '<A-Right>', 'w', {noremap = true})
  vim.api.nvim_set_keymap('n', '<S-Left>', '^', {noremap = true})
  vim.api.nvim_set_keymap('n', '<S-Right>', '$', {noremap = true})
  vim.api.nvim_set_keymap('i', '<A-Left>', '<C-o>b', {noremap = true})
  vim.api.nvim_set_keymap('i', '<A-Right>', '<C-o>w', {noremap = true})
  vim.api.nvim_set_keymap('i', '<S-Left>', '<C-o>^', {noremap = true})
  vim.api.nvim_set_keymap('i', '<S-Right>', '<C-o>$', {noremap = true})

  vim.api.nvim_set_keymap('v', 'p', '"_dP', {noremap = true})
  vim.api.nvim_set_keymap('n', 'd', '"_d', {noremap = true})
  vim.api.nvim_set_keymap('v', 'd', '"_d', {noremap = true})

  vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>lua require("FTerm").toggle()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('t', '<C-t>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<CR>', {noremap = true, silent = true})
end

function M.lsp_attach(client, bufnr)
  -- <leader> mappings
  local leader = {
    t = {
      "<cmd>Telescope lsp_document_symbols theme=get_dropdown<CR>",
      "LSP Document Tags"
    },
    l = {
      name = "lsp",
      d = {
        name = "diagnostics",
        d = {
          "<cmd>LspTroubleToggle lsp_document_diagnostics<CR>",
          "Document Diagnostics"
        },
        w = {
          "<cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>",
          "Workspace Diagnostics"
        },
      },
      c = {
        name = "code action",
        a = {
          "<cmd>Telescope lsp_code_actions theme=get_dropdown<CR>",
          "Code Action"
        },
      },
      f = {
        name = "find",
        r = {
          "<cmd>LspTroubleToggle lsp_references<CR>",
          "References"
        },
        d = {
          "<cmd>LspTroubleToggle lsp_definitions<CR>",
          "Definitions"
        },
      },
    },
  }

  -- Top-level mappings
  local top = {
    K = {
      "<cmd>lua vim.lsp.buf.hover()<CR>",
      "Show Documentation"
    },
  }

  -- Register which-key mappings
  wk.register(leader, {prefix = "<leader>", noremap = true, silent = true, buffer = bufnr})
  wk.register(top, {noremap = true, silent = true, buffer = bufnr})
end

return M
