(let [M {}
      format (require :format)
      format-core (require :core)
      toml (require :toml)
      treefmt-config-file vim.env.TREEFMT_CONFIG_FILE
      treefmt-exts []
      level vim.log.levels]
  (var latest-used-formatter :unknown)

  (fn notify [msg lvl]
    (vim.notify (.. msg " [" latest-used-formatter "]") lvl {:title :Format}))

  (fn read-file [file]
    (with-open [f (io.open file :rb)]
      (f:read :*all)))

  (when (not= treefmt-config-file nil)
    (let [cfg (toml.parse (read-file treefmt-config-file))]
      (each [_ opts (pairs cfg.formatter)]
        (vim.list_extend treefmt-exts opts.includes))))

  (fn treefmt-or-fallback [file-path fallback]
    (let [ext (format-core.file.extension file-path)
          ext-glob (.. "*." ext)]
      (if (vim.list_contains treefmt-exts ext-glob)
          (do
            (set latest-used-formatter :treefmt)
            [{:cmd :treefmt
              :args [file-path]
              :ignore_err (fn [err data]
                            (and (= err nil) (not (string.find data :Error))))}])
          (= (vim.fn.executable fallback.cmd) 1)
          (do
            (set latest-used-formatter fallback.cmd)
            [fallback])
          [])))

  (fn formatter-prettier [file-path]
    (treefmt-or-fallback file-path {:cmd :prettier :args [:--write file-path]}))

  (fn M.treefmt-extensions [] treefmt-exts)

  (format.setup {:filetypes {:css formatter-prettier
                             :fennel (fn [file-path]
                                       (treefmt-or-fallback file-path
                                                            {:cmd :fnlfmt
                                                             :args [:--fix
                                                                    file-path]}))
                             :fish (fn [file-path]
                                     {:cmd :fish_indent
                                      :args [:--write file-path]})
                             :html formatter-prettier
                             :javascript formatter-prettier
                             :json formatter-prettier
                             :nix (fn [file-path]
                                    (treefmt-or-fallback file-path
                                                         {:cmd :nixpkgs-fmt
                                                          :args [file-path]}))
                             :sh (fn [file-path]
                                   (treefmt-or-fallback file-path
                                                        {:cmd :shfmt
                                                         :args [:-i
                                                                :2
                                                                :-s
                                                                :-w
                                                                file-path]}))
                             :typescript formatter-prettier
                             :yaml (fn [file-path]
                                     (treefmt-or-fallback file-path
                                                          {:cmd :yamlfmt
                                                           :args [file-path]}))}
                 :hooks {:on_success #(notify "Formatting Succeed" level.INFO)
                         :on_err #(notify "Formatting Failed" level.ERROR)
                         :on_timeout #(notify "Formatting Timeout" level.ERROR)}})
  M)
