(let [lint (require :lint)
      augroup (vim.api.nvim_create_augroup :NifocLint {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (set lint.linters.deadnix
       {:cmd :deadnix
        :stdin false
        :args [:--output-format :json]
        :stream :stdout
        :ignore_exitcode false
        :parser (fn [output]
                  (if (= output "") {}
                      (let [findings (vim.json.decode output)]
                        (vim.tbl_map (fn [result]
                                       {:lnum (- result.line 1)
                                        :end_lnum (- result.line 1)
                                        :col (- result.column 1)
                                        :end_col (- result.endColumn 1)
                                        :severity vim.diagnostic.severity.HINT
                                        :source :deadnix
                                        :message result.message})
                                     findings.results))))})
  (set lint.linters_by_ft {:dockerfile [:hadolint]
                           :elixir [:credo]
                           :fennel [:fennel]
                           :nix [:deadnix :nix :statix]
                           :sh [:shellcheck]})

  (fn setup-linting [opts]
    (aucmd [:BufWritePost :BufEnter :InsertLeave]
           {:callback #(lint.try_lint) :buffer opts.buf :group augroup}))

  (each [ft _ (pairs lint.linters_by_ft)]
    (aucmd :FileType {:pattern ft :callback setup-linting :group augroup})))

