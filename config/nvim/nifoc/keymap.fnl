(let [mod {}
      keymap vim.keymap
      legendary (require :legendary)
      substitute (require :substitute)
      telescope (require :telescope)
      telescope-builtin (require :telescope.builtin)
      telescope-themes (require :telescope.themes)
      telescope-nifoc (require :nifoc.telescope)
      telescope-ivy (telescope-themes.get_ivy)
      telescope-dropdown (telescope-themes.get_dropdown)
      npairs (require :nvim-autopairs)
      gitsigns (require :gitsigns)]
  (fn map-entry [key cmd opts]
    (vim.tbl_extend :keep {1 key 2 cmd} opts))

  (fn mod.setup []
    (keymap.set :n :<space> :<nop> {:noremap true})
    (set vim.g.mapleader " ")
    (set vim.opt.timeoutlen 500)
    (legendary.bind_keymaps [(map-entry :<leader>o
                                        telescope-nifoc.project-files
                                        {:description "Find Files"})
                             (map-entry :<leader>s
                                        #(telescope-builtin.live_grep telescope-ivy)
                                        {:description "Live Grep"})
                             (map-entry :<leader>fn :<cmd>enew<CR>
                                        {:description "New File"})
                             (map-entry :<leader>ut :<cmd>UndotreeToggle<CR>
                                        {:description "Toggle Undotree"})
                             ;; Buffer
                             (map-entry :<leader>bl
                                        #(telescope-builtin.buffers telescope-dropdown)
                                        {:description "List Buffers"})
                             (map-entry :<leader>bn
                                        :<cmd>BufferLineCycleNext<CR>
                                        {:description "Next Buffer"})
                             (map-entry :<leader>bp
                                        :<cmd>BufferLineCyclePrev<CR>
                                        {:description "Previous Buffer"})
                             (map-entry :<leader>bf
                                        #(telescope-builtin.current_buffer_fuzzy_find telescope-dropdown)
                                        {:description "Find In Buffer"})
                             (map-entry :<leader>bt
                                        #(telescope-builtin.treesitter telescope-dropdown)
                                        {:description "Find Via Treesitter"})
                             ;; Project
                             (map-entry :<leader>pt :<cmd>TodoTelescope<CR>
                                        {:description "TODO Comments"})
                             ;; VCS
                             (map-entry :<leader>vs
                                        #(telescope-builtin.git_status telescope-ivy)
                                        {:description "VCS Status"})
                             (map-entry :<leader>vb
                                        #(telescope-builtin.git_branches telescope-dropdown)
                                        {:description "List VCS Branches"})
                             (map-entry :<leader>vl gitsigns.blame_line
                                        {:description "Blame Line"})
                             (map-entry :<leader>vn :<cmd>Neogit<CR>
                                        {:description "Open Neogit"})
                             (map-entry :<leader>vc "<cmd>Neogit commit<CR>"
                                        {:description "Neogit Commit"})
                             (map-entry :<leader>vp "<cmd>Neogit pull<CR>"
                                        {:description "Neogit Pull"})
                             (map-entry :<leader>vP "<cmd>Neogit push<CR>"
                                        {:description "Neogit Push"})
                             ;; Legendary
                             (map-entry :<leader>lk #(legendary.find :keymaps)
                                        {:description "Legendary Keymaps"})
                             (map-entry :<leader>lc #(legendary.find :commands)
                                        {:description "Legendary Commands"})
                             (map-entry :<leader>la #(legendary.find :autocmds)
                                        {:description "Legendary Autocmds"})
                             ;; Debug
                             (map-entry :<leader>dli :<cmd>LspInfo<CR>
                                        {:description "LSP Info"})
                             (map-entry :<leader>dlr :<cmd>LspRestart<CR>
                                        {:description "LSP Restart"})
                             (map-entry :<leader>dt
                                        :<cmd>TSPlaygroundToggle<CR>
                                        {:description "Toggle Treetsitter Playground"})
                             (map-entry :<leader>dn
                                        telescope.extensions.notify.notify
                                        {:description "Display Notifications"})])
    ;; Other Mappings
    (keymap.set :n :<CR> ":nohlsearch<CR><CR>" {:noremap true :silent true})
    (keymap.set :i :<CR> npairs.autopairs_cr
                {:noremap true :expr true :silent true})
    (keymap.set :n :<A-Left> :b {:noremap true})
    (keymap.set :n :<A-Right> :w {:noremap true})
    (keymap.set :n :<S-Left> "^" {:noremap true})
    (keymap.set :n :<S-Right> "$" {:noremap true})
    (keymap.set :i :<A-Left> :<C-o>b {:noremap true})
    (keymap.set :i :<A-Right> :<C-o>w {:noremap true})
    (keymap.set :i :<S-Left> :<C-o>^ {:noremap true})
    (keymap.set :i :<S-Right> :<C-o>$ {:noremap true})
    (keymap.set :n :p "<Plug>(YankyPutAfter)")
    (keymap.set :n :P "<Plug>(YankyPutBefore)")
    (keymap.set :x :p substitute.visual)
    (keymap.set :x :P "<Plug>(YankyPutBefore)")
    (keymap.set :n :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :n :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :x :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :x :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :n :y "<Plug>(YankyYank)")
    (keymap.set :x :y "<Plug>(YankyYank)"))

  (fn mod.lsp-attach [client bufnr]
    (legendary.bind_keymaps [(map-entry :<leader>t
                                        #(telescope-builtin.lsp_document_symbols telescope-dropdown)
                                        {:description "LSP Document Symbols"
                                         :opts {:buffer bufnr}})
                             (map-entry :<leader>ld
                                        #(telescope-builtin.diagnostics (vim.tbl_extend :keep
                                                                                        telescope-ivy
                                                                                        {:bufnr 0}))
                                        {:description "LSP Document Diagnostics"
                                         :opts {:buffer bufnr}})
                             (map-entry :<leader>lca
                                        #(telescope-builtin.lsp_code_actions telescope-dropdown)
                                        {:description "LSP Code Action"
                                         :opts {:buffer bufnr}})
                             (map-entry :<leader>lfr
                                        #(telescope-builtin.lsp_references telescope-dropdown)
                                        {:description "Find References"
                                         :opts {:buffer bufnr}})
                             (map-entry :<leader>lfd
                                        #(telescope-builtin.lsp_definitions telescope-dropdown)
                                        {:description "Find Definitions"
                                         :opts {:buffer bufnr}})
                             (map-entry :<leader>lfi
                                        #(telescope-builtin.lsp_implementations telescope-dropdown)
                                        {:description "Find Implementations"
                                         :opts {:buffer bufnr}})
                             (map-entry :K vim.lsp.buf.hover
                                        {:description "Show Documentation"
                                         :opts {:buffer bufnr}})
                             (map-entry :F :<cmd>Format<CR>
                                        {:description "Format Buffer"
                                         :opts {:buffer bufnr}})]))

  mod)

