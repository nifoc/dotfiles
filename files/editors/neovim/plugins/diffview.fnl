(let [diffview (require :diffview)
      actions (require :diffview.actions)]
  (diffview.setup {:hooks {:diff_buf_read (fn [_bufnr]
                                            (set vim.opt_local.relativenumber
                                                 false)
                                            (set vim.b.toggle_line_style 0))
                           :view_opened #(actions.toggle_files)}}))
