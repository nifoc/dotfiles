(let [treesitter (require :nvim-treesitter)
      treesitter-config (require :nvim-treesitter.configs)
      treesitter-parsers (require :nvim-treesitter.parsers)
      set-bufvar vim.api.nvim_buf_set_var
      install-parsers [:bash
                       :comment
                       :css
                       :dockerfile
                       :eex
                       :elixir
                       :erlang
                       :fennel
                       :fish
                       :heex
                       :help
                       :html
                       :http
                       :javascript
                       :jsdoc
                       :json
                       :lua
                       :make
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
  (treesitter.define_modules {:nifoc_hooks {:enable false
                                            :attach (lambda [bufnr]
                                                      (set-bufvar bufnr
                                                                  :nifoc_treesitter_enabled
                                                                  1))
                                            :detach (lambda [bufnr]
                                                      (set-bufvar bufnr
                                                                  :nifoc_treesitter_enabled
                                                                  0))
                                            :is_supported #true}})
  (treesitter-config.setup {:ensure_installed install-parsers
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

