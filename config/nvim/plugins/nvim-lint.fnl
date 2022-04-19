(let [lint (require :lint)
      augroup (vim.api.nvim_create_augroup :NifocLint {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (set lint.linters_by_ft {:dockerfile [:hadolint]
                           :elixir [:credo]
                           :fennel [:fennel]
                           :nix [:nix :statix]
                           :sh [:shellcheck]})

  (fn setup-linting [opts]
    (aucmd [:BufWritePost :BufWinEnter :InsertLeave]
           {:callback #(lint.try_lint) :buffer opts.buf :group augroup}))

  (each [ft _ (pairs lint.linters_by_ft)]
    (aucmd :InsertEnter {:pattern ft :callback setup-linting :group augroup})))

