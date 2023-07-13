(let [formatter (require :formatter)
      formatter-utils (require :formatter.util)
      treefmt-exists (vim.fn.executable :treefmt)
      treefmt-formatter #{:exe :treefmt
                          :stdin false
                          :tempfile_prefix :treefmt
                          :tempfile_postfix (.. "."
                                                (formatter-utils.get_current_buffer_file_extension))}]
  (fn builtin-formatter [ft formatter]
    (let [file (.. :formatter.filetypes. ft)]
      (. (require file) formatter)))

  (fn prefer-treefmt [ft formatter]
    (if (= treefmt-exists 1)
        (treefmt-formatter)
        ((builtin-formatter ft formatter))))

  (formatter.setup {:logging true
                    :log_level vim.log.levels.WARN
                    :filetype {:css [(prefer-treefmt :css :prettier)]
                               :fennel [#{:exe :fnlfmt :args ["-"] :stdin true}]
                               :fish [(builtin-formatter :fish :fishindent)]
                               :html [(prefer-treefmt :html :prettier)]
                               :javascript [(prefer-treefmt :javascript
                                                            :prettier)]
                               :json [(prefer-treefmt :json :prettier)]
                               :nix [(prefer-treefmt :nix :nixpkgs_fmt)]
                               :sh [(prefer-treefmt :sh :shfmt)]
                               :toml [(prefer-treefmt :toml :taplo)]
                               :typescript [(prefer-treefmt :typescript
                                                            :prettier)]}}))

