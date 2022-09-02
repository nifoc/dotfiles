(let [treesitter (require :nvim-treesitter)
      treesitter-config (require :nvim-treesitter.configs)
      treesitter-parsers (require :nvim-treesitter.parsers)
      nifoc-treesitter (require :nifoc.treesitter)
      install-parsers [:bash
                       :comment
                       :css
                       :dockerfile
                       :elixir
                       :erlang
                       :fennel
                       :fish
                       :heex
                       :html
                       :http
                       :javascript
                       :jsdoc
                       :json
                       :lua
                       :make
                       :markdown
                       :markdown_inline
                       :nix
                       :query
                       :regex
                       :ruby
                       :scss
                       :svelte
                       :toml
                       :tsx
                       :typescript
                       :vim
                       :yaml]
      rainbow-parsers [:fennel]]
  (nifoc-treesitter.setup)
  (treesitter-config.setup {:ensure_installed []
                            :sync_install true
                            :highlight {:enable true}
                            :indent {:enable true}
                            :textobjects {:select {:enable true
                                                   :keymaps {:af "@function.outer"
                                                             :if "@function.inner"
                                                             :ac "@conditional.outer"
                                                             :ic "@conditional.inner"}}}
                            :rainbow {:enable true
                                      :disable (vim.tbl_filter (fn [parser]
                                                                 (not (vim.tbl_contains rainbow-parsers
                                                                                        parser)))
                                                               install-parsers)}
                            :matchup {:enable true}
                            :autopairs {:enable true}
                            :autotag {:enable true}
                            :playground {:enable true}
                            :nifoc_hooks {:enable true}}))

