(let [mod {}]
  (fn mod.colorscheme [name]
    `(vim.api.nvim_cmd {:cmd :colorscheme :args [,name]} []))

  (fn mod.highlight [name value]
    `(vim.api.nvim_set_hl 0 ,name ,value))

  (fn mod.highlight-link [src dst]
    `(vim.api.nvim_cmd {:cmd :highlight :args [:link ,src ,dst]} []))

  (fn mod.highlight-get [name]
    `(vim.api.nvim_get_hl 0 {:name ,name :link false}))

  (fn mod.highlight-get-field [name field]
    `(. (vim.api.nvim_get_hl 0 {:name ,name :link false}) ,field))

  (fn mod.deferred_cmd [args delay]
    `(vim.defer_fn #(vim.api.nvim_cmd ,args [])
       ,delay))

  mod)
