(let [bo vim.bo
      ts vim.treesitter]
  (set bo.indentexpr "v:lua.require('nvim-treesitter').indentexpr()")
  (ts.start))
