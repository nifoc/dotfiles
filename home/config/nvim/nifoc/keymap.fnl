(let [mod {}
      keymap vim.keymap
      substitute (require :substitute)
      telescope-builtin (require :telescope.builtin)
      telescope-themes (require :telescope.themes)
      telescope-nifoc (require :nifoc.telescope)
      telescope-ivy (telescope-themes.get_ivy)
      telescope-dropdown (telescope-themes.get_dropdown)
      gitsigns (require :gitsigns)
      repl (require :nifoc.repl)
      formatting (require :nifoc.formatting)]
  (set _G.mini_cr_action
       (fn []
         (if (not= (vim.fn.pumvisible) 0)
             (if (not= (. (vim.fn.complete_info) :selected) -1)
                 (vim.api.nvim_replace_termcodes :<C-y> true true true)
                 (vim.api.nvim_replace_termcodes :<C-y><CR> true true true))
             ((. (require :mini.pairs) :cr)))))

  (fn mod.setup []
    (keymap.set :n :<space> :<nop> {:noremap true})
    ;; Leader Mappings
    (keymap.set :n :<leader>o telescope-nifoc.find-files {:desc "Find Files"})
    (keymap.set :n :<leader>s #(telescope-builtin.live_grep telescope-ivy)
                {:desc "Live Grep"})
    (keymap.set :n :<leader>fn :<cmd>enew<CR> {:desc "New File"})
    (keymap.set :n :<leader>u "<cmd>UrlView buffer<CR>" {:desc "Open UrlView"})
    (keymap.set :n :<leader>ut "<cmd>Telescope undo<CR>"
                {:desc "Toggle Undotree"})
    (keymap.set :n :<leader>c repl.open-shell {:desc "Open Shell"})
    (keymap.set :n :<leader>r repl.open-repl {:desc "Open REPL"})
    (keymap.set :n :<leader>bl #(telescope-builtin.buffers telescope-dropdown)
                {:desc "List Buffers"})
    (keymap.set :n :<leader>bf
                #(telescope-builtin.current_buffer_fuzzy_find telescope-dropdown)
                {:desc "Find In Buffer"})
    (keymap.set :n :<leader>bt
                #(telescope-builtin.treesitter telescope-dropdown)
                {:desc "Find via Treesitter"})
    (keymap.set :n :<leader>pt :<cmd>TodoTelescope<CR> {:desc "TODO Comments"})
    (keymap.set :n :<leader>vs #(telescope-builtin.git_status telescope-ivy)
                {:desc "VCS Status"})
    (keymap.set :n :<leader>vb
                #(telescope-builtin.git_branches telescope-dropdown)
                {:desc "List VCS Branches"})
    (keymap.set :n :<leader>vl #(gitsigns.blame_line {:full true})
                {:desc "Blame Line"})
    (keymap.set :n :<leader>lk telescope-builtin.keymaps
                {:desc "Show Keymappings"})
    (keymap.set :n :<leader>ld #(telescope-builtin.diagnostics telescope-ivy)
                {:desc "Show Diagnostics"})
    (keymap.set :n :<leader>dli :<cmd>LspInfo<CR> {:desc "LSP Info"})
    (keymap.set :n :<leader>dlr :<cmd>LspRestart<CR> {:desc "Restart LSP"})
    (keymap.set :n :<leader>ds #(vim.diagnostic.open_float {:scope :line})
                {:desc "Show Diagnostics"})
    (keymap.set :n :<leader>dtp :<cmd>TSPlaygroundToggle<CR>
                {:desc "Toggle Treetsitter Playground"})
    ;; Other Mappings
    (keymap.set :n :F #(formatting.maybe-format-buffer 0)
                {:desc "Format Buffer"})
    (keymap.set :n :<A-Left> :b)
    (keymap.set :n :<A-Right> :w)
    (keymap.set :n :<S-Left> "^")
    (keymap.set :n :<S-Right> "$")
    (keymap.set :i :<A-Left> :<C-o>b)
    (keymap.set :i :<A-Right> :<C-o>w)
    (keymap.set :i :<S-Left> :<C-o>^)
    (keymap.set :i :<S-Right> :<C-o>$)
    (keymap.set :n :p "<Plug>(YankyPutAfter)")
    (keymap.set :n :P "<Plug>(YankyPutBefore)")
    (keymap.set :x :p substitute.visual)
    (keymap.set :x :P "<Plug>(YankyPutBefore)")
    (keymap.set :n :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :n :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :x :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :x :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :n :y "<Plug>(YankyYank)")
    (keymap.set :x :y "<Plug>(YankyYank)")
    ;; Completion
    (keymap.set :i :<Tab> "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\""
                {:expr true})
    (keymap.set :i :<S-Tab> "pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\""
                {:expr true})
    (keymap.set :i :<CR> "v:lua._G.mini_cr_action()" {:expr true}))

  (fn mod.lsp-attach [client bufnr]
    (keymap.set :n :<leader>t
                #(telescope-builtin.lsp_document_symbols telescope-dropdown)
                {:buffer bufnr :desc "LSP Document Symbols"})
    (keymap.set :n :<leader>tw
                #(telescope-builtin.lsp_dynamic_workspace_symbols telescope-dropdown)
                {:buffer bufnr :desc "LSP Workspace Symbols"})
    (keymap.set :n :<leader>th #(vim.lsp.inlay_hint bufnr nil)
                {:buffer bufnr :desc "Toggle Inlay Hints"})
    (keymap.set :n :<leader>lca
                #(telescope-builtin.lsp_code_actions telescope-dropdown)
                {:buffer bufnr :desc "LSP Code Action"})
    (keymap.set :n :<leader>lfr
                #(telescope-builtin.lsp_references telescope-dropdown)
                {:buffer bufnr :desc "Find References"})
    (keymap.set :n :<leader>lfd
                #(telescope-builtin.lsp_definitions telescope-dropdown)
                {:buffer bufnr :desc "Find Definitions"})
    (keymap.set :n :<leader>lfi
                #(telescope-builtin.lsp_implementations telescope-dropdown)
                {:buffer bufnr :desc "Find Implementations"})
    (keymap.set :n :K vim.lsp.buf.hover
                {:buffer bufnr :desc "Show Documentation"}))

  (fn mod.terminal-open [bufnr]
    (let [map-opts {:buffer bufnr}]
      (keymap.set :t :<esc> "<C-\\><C-n>" map-opts)
      (keymap.set :t :<C-h> "<C-\\><C-n><C-W>h" map-opts)
      (keymap.set :t :<C-j> "<C-\\><C-n><C-W>j" map-opts)
      (keymap.set :t :<C-k> "<C-\\><C-n><C-W>k" map-opts)
      (keymap.set :t :<C-l> "<C-\\><C-n><C-W>l" map-opts)))

  mod)
