(let [lo vim.opt_local
      b vim.b]
  (set lo.formatprg "eslint_d --stdin --fix-to-stdout")
  (set b.nifoc_formatter_force_formatprg 1))

