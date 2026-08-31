(let [lo vim.opt_local
      ts vim.treesitter]
  (set lo.spell true)
  (set lo.colorcolumn :+1)
  (ts.start))
