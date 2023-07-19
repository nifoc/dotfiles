(let [formatter (require :formatter)
      api vim.api]
  (fn buffer-filename [] (api.nvim_buf_get_name 0))

  (fn args-prettier [parser]
    {:args [:--stdin-filepath (buffer-filename) :--parser parser]})

  (fn args-shfmt []
    (let [shiftwidth (vim.opt.shiftwidth:get)]
      {:args [:-i shiftwidth]}))

  (fn do-format [exe opts]
    (if (= (vim.fn.executable exe) 1)
        (vim.tbl_extend :keep opts {: exe})
        {:exe :ls :cond #false}))

  (formatter.setup {:format_on_save #(not= vim.b.nifoc_formatter_disabled 1)
                    :filetype {:css #(do-format :prettier (args-prettier :css))
                               :fennel #(do-format :fnlfmt {:args ["-"]})
                               :fish #(do-format :fish_indent {})
                               :html #(do-format :prettier
                                                 (args-prettier :html))
                               :javascript #(do-format :prettier
                                                       (args-prettier :javascript))
                               :json #(do-format :prettier
                                                 (args-prettier :json))
                               :sh #(do-format :shfmt (args-shfmt))
                               :toml #(do-format :taplo {:args [:fmt "-"]})
                               :typescript #(do-format :prettier
                                                       (args-prettier :typescript))
                               :yaml #(do-format :yamlfmt {:args [:-in]})}
                    :lsp [:elixirls :nil_ls]}))

