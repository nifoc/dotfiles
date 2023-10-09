(let [conform (require :conform)
      conform-util (require :conform.util)
      toml (require :toml)
      treefmt-config-file vim.env.TREEFMT_CONFIG_FILE
      treefmt-exts []
      tmp-filename "\$FILENAME"]
  (fn read-file [file]
    (with-open [f (io.open file :rb)]
      (f:read :*all)))

  (when (not= treefmt-config-file nil)
    (let [cfg (toml.parse (read-file treefmt-config-file))]
      (each [_ opts (pairs cfg.formatter)]
        (vim.list_extend treefmt-exts opts.includes))))

  (fn treefmt-or-fallback [fallback]
    (let [ext (vim.fn.expand "%:e")
          ext-glob (.. "*." ext)]
      (if (vim.list_contains treefmt-exts ext-glob)
          {:command :treefmt
           :args [tmp-filename]
           :stdin false
           :cwd (conform-util.root_file [:flake.nix :flake.lock])
           :require_cwd true}
          (= (vim.fn.executable fallback.command) 1)
          fallback
          [])))

  (conform.setup {:formatters_by_ft {:css [:treefmt_or_prettier]
                                     :elixir [:mix]
                                     :fennel [:treefmt_or_fnlfmt]
                                     :fish [:fish_indent]
                                     :html [:treefmt_or_prettier]
                                     :javascript [:treefmt_or_prettier]
                                     :json [:treefmt_or_prettier]
                                     :nix [:treefmt_or_nixpkgs_fmt]
                                     :sh [:treefmt_or_shfmt]
                                     :typescript [:treefmt_or_prettier]
                                     :yaml [:treefmt_or_yamlfmt]}
                  :notify_on_error true
                  :formatters {:treefmt_or_fnlfmt #(treefmt-or-fallback {:command :fnlfmt
                                                                         :args ["-"]})
                               :treefmt_or_nixpkgs_fmt #(treefmt-or-fallback {:command :nixpkgs-fmt})
                               :treefmt_or_prettier #(treefmt-or-fallback {:command :prettier
                                                                           :args [:--stdin-filepath
                                                                                  tmp-filename]
                                                                           :cwd (conform-util.root_file [:.prettierrc
                                                                                                         :package.json])})
                               :treefmt_or_shfmt #(treefmt-or-fallback {:command :shfmt
                                                                        :args [:-filename
                                                                               tmp-filename
                                                                               :-i
                                                                               :2
                                                                               :-s]})
                               :treefmt_or_yamlfmt #(treefmt-or-fallback {:command :yamlfmt
                                                                          :args ["-"]})}}))
