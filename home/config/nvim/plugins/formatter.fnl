(let [M {}
      formatter (require :formatter)
      api vim.api
      toml (require :toml)
      treefmt-config-file vim.env.TREEFMT_CONFIG_FILE
      treefmt-formatters {}]
  (fn read-file [file]
    (with-open [f (io.open file :rb)]
      (f:read :*all)))

  (fn add-option [opts addable]
    (table.insert opts addable)
    opts)

  (fn remove-option [opts removeable]
    (let [new-opts []]
      (each [_ v (ipairs opts)]
        (when (not= v removeable) (table.insert new-opts v)))
      new-opts))

  (when (not= treefmt-config-file nil)
    (let [cfg (toml.parse (read-file treefmt-config-file))]
      (when (not= cfg.formatter.fnlfmt nil)
        (set treefmt-formatters.fnlfmt
             {:exe cfg.formatter.fnlfmt.command
              :args (-> cfg.formatter.fnlfmt.options (remove-option :--fix)
                        (add-option "-"))}))
      (when (not= cfg.formatter.shfmt nil)
        (set treefmt-formatters.shfmt
             {:exe cfg.formatter.shfmt.command
              :args (remove-option cfg.formatter.shfmt.options :-w)}))
      (when (not= cfg.formatter.yamlfmt nil)
        (set treefmt-formatters.yamlfmt
             {:exe cfg.formatter.yamlfmt.command
              :args (add-option cfg.formatter.yamlfmt.options :-in)}))))

  (fn buffer-filename [] (api.nvim_buf_get_name 0))

  (fn args-prettier [parser]
    {:args [:--stdin-filepath (buffer-filename) :--parser parser]})

  (fn args-shfmt []
    (let [shiftwidth (vim.opt.shiftwidth:get)]
      {:args [:-i shiftwidth]}))

  (fn do-format [exe opts]
    (let [treefmt-formatter (. treefmt-formatters exe)]
      (if (not= treefmt-formatter nil)
          treefmt-formatter
          (if (= (vim.fn.executable exe) 1)
              (vim.tbl_extend :keep opts {: exe})
              {:exe :ls :cond #false}))))

  (fn M.treefmt-based-formatters [] treefmt-formatters)

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
                    :lsp [:elixirls :nil_ls]})
  M)
