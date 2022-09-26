(let [lint (require :lint)
      diagnostic (require :nifoc.diagnostic)
      augroup (vim.api.nvim_create_augroup :NifocLint {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  ;; Custom Linters
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
  ;; Linter Options
  (let [fennel (require :lint.linters.fennel)]
    (set fennel.globals [:vim]))
  ;; Configure Linters per FT
  (set lint.linters_by_ft {:dockerfile [:hadolint]
                           :elixir [:credo]
                           ;:fennel [:fennel]
                           :fish [:fish]
                           :markdown [:vale]
                           :nix [:deadnix :nix :statix]
                           :sh [:shellcheck]
                           :yaml [:yamllint]})

  (fn setup-linting [opts]
    (diagnostic.maybe-enable-diagnostics opts.buf)
    (lint.try_lint)
    (aucmd [:BufWinEnter :BufWritePost :InsertLeave]
           {:callback #(lint.try_lint)
            :buffer opts.buf
            :group augroup
            :desc "Run Linter"}))

  (each [ft _ (pairs lint.linters_by_ft)]
    (aucmd :FileType {:pattern ft
                      :callback setup-linting
                      :group augroup
                      :desc "Setup Linter"})))

