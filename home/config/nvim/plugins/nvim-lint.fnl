(let [lint (require :lint)
      diagnostic (require :nifoc.diagnostic)
      augroup (vim.api.nvim_create_augroup :NifocLint {:clear true})
      aucmd vim.api.nvim_create_autocmd
      project-root (vim.fs.dirname (. (vim.fs.find [:.git] {:upward true}) 1))]
  ;; Custom Linters
  (set lint.linters.deadnix
       {:cmd :deadnix
        :stdin false
        :args [:--output-format :json]
        :stream :stdout
        :ignore_exitcode false
        :parser (fn [output]
                  (if (= output "") {}
                      (let [findings (vim.json.decode output)
                            filtered-findings (vim.tbl_filter #(not= $1.line
                                                                     nil)
                                                              findings.results)]
                        (vim.tbl_map (fn [result]
                                       {:lnum (- result.line 1)
                                        :end_lnum (- result.line 1)
                                        :col (- result.column 1)
                                        :end_col (- result.endColumn 1)
                                        :severity vim.diagnostic.severity.HINT
                                        :source :deadnix
                                        :message result.message})
                                     filtered-findings))))})
  ;; Linter Options
  (let [checkstyle (require :lint.linters.checkstyle)
        fennel (require :lint.linters.fennel)]
    (when (not= project-root nil)
      (set checkstyle.config_file
           (.. project-root :/config/checkstyle/checkstyle.xml)))
    (set fennel.globals [:vim :wezterm]))
  ;; Configure Linters per FT
  (set lint.linters_by_ft {:dockerfile [:hadolint]
                           :elixir [:credo]
                           ;:fennel [:fennel]
                           :fish [:fish]
                           :java [:checkstyle]
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

