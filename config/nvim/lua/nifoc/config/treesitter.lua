local treesitter = require('nvim-treesitter')
local treesitter_config = require('nvim-treesitter.configs')

-- Custom module
treesitter.define_modules {
  nifoc_hooks = {
    enable = false,
    attach = function(bufnr)
      vim.api.nvim_buf_set_var(bufnr, 'nifoc_treesitter_enabled', 1)
    end,
    detach = function(bufnr)
      vim.api.nvim_buf_set_var(bufnr, 'nifoc_treesitter_enabled', 0)
    end,
    is_supported = function()
      return true
    end
  }
}

treesitter_config.setup {
  ensure_installed = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
      },
    },
  },
  matchup = {enable = true},
  autopairs = {enable = true},
  autotag = {enable = true},
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  playground = {enable = true},
  nifoc_hooks = {enable = true},
}
