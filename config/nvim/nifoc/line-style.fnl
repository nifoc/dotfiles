(let [mod {}]
  (fn mod.maybe-set-relativenumber [value]
    (let [toggle-style vim.b.toggle_line_style
          toggle? (or (= toggle-style nil) (= toggle-style 1))]
      (when toggle?
        (set vim.opt_local.relativenumber value))))

  mod)
