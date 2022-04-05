(let [mod {}
      web-devicons (require :nvim-web-devicons)]
  (fn buffer-not-empty? []
    (not= (vim.fn.empty (vim.fn.expand "%:t")) 1))

  (fn buffer-variable-exists? [key]
    (and (buffer-not-empty?) (not= (. vim.b key) nil)))

  (fn maybe-insert-git-status [format value result]
    (when (and (not= value nil) (> value 0))
      (table.insert result (string.format format value))))

  (fn mod.line-column []
    (let [line (tostring (vim.fn.line "."))
          column (tostring (vim.fn.col "."))]
      (string.format "%3s:%-3s" line column)))

  (fn mod.current-line-percent []
    (let [current-line (vim.fn.line ".")
          total-lines (vim.fn.line "$")]
      (if (= current-line 1) :Top
          (= current-line total-lines) :Bot
          "%2p%%")))

  (fn mod.filetype []
    (let [name (vim.fn.expand "%:t")
          extension (vim.fn.expand "%:e")
          ftype vim.bo.filetype]
      (if (> (ftype:len) 0) (let [icon (web-devicons.get_icon name extension
                                                              {:default true})]
                              (.. ftype " " icon))
          "no ft")))

  (fn mod.gitsigns-formatter [status]
    (let [{: added : changed : removed} status
          result {}]
      (maybe-insert-git-status "%%#GitSignsStatuslineAdd# %s" added result)
      (maybe-insert-git-status "%%#GitSignsStatuslineChange# %s" changed
                               result)
      (maybe-insert-git-status "%%#GitSignsStatuslineDelete# %s" removed
                               result)
      (table.concat result " ")))

  (fn mod.current-function []
    (let [fun vim.b.lsp_current_function]
      (if (and (not= fun nil) (> (fun:len) 0)) (.. " " fun) "")))

  (fn mod.spell-enabled? []
    (if (and (buffer-not-empty?) vim.wo.spell) "ﮒ" ""))

  (fn mod.fixer-enabled? []
    (if (buffer-variable-exists? :nifoc_fixer_enabled) "" ""))

  (fn mod.treesitter-enabled? []
    (if (buffer-variable-exists? :nifoc_treesitter_enabled) "" ""))

  (fn mod.lsp-enabled? []
    (if (buffer-variable-exists? :nifoc_lsp_enabled) "" ""))

  mod)
