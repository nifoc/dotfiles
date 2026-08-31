(let [lo vim.opt_local
      bo vim.bo
      ts vim.treesitter]
  (set lo.spell true)
  (set bo.indentexpr "v:lua.require('nvim-treesitter').indentexpr()")
  (ts.start))
