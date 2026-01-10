(let [lo vim.opt_local
      bo vim.bo
      ts vim.treesitter]
  (set lo.spell true)
  (set lo.textwidth 120)
  (set lo.colorcolumn :+1)
  (set bo.indentexpr "v:lua.require('nvim-treesitter').indentexpr()")
  (ts.start))
