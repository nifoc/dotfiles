(let [lo vim.opt_local
      ts vim.treesitter]
  (set lo.spell true)
  (ts.start))
