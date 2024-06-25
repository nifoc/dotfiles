(let [lsp (require :lspconfig)
      cmp (require :cmp_nvim_lsp)
      schemastore (require :schemastore)
      navic (require :nvim-navic)
      diagnostic (require :nifoc.diagnostic)
      augroup (vim.api.nvim_create_augroup :NifocLsp {:clear true})
      aucmd vim.api.nvim_create_autocmd
      ns (vim.api.nvim_create_namespace :nifoc_lsp_float)]
  (fn setup-inlay-hint-toggle [bufnr]
    (aucmd :InsertEnter {:callback #(vim.lsp.inlay_hint.enable false {: bufnr})
                         :buffer bufnr
                         :group augroup})
    (aucmd :InsertLeave {:callback #(vim.lsp.inlay_hint.enable true {: bufnr})
                         :buffer bufnr
                         :group augroup}))

  ;; Attach
  (aucmd :LspAttach {:callback (fn [args]
                                 (let [client (vim.lsp.get_client_by_id args.data.client_id)
                                       bufnr args.buf]
                                   (when (client.supports_method :textDocument/documentSymbol
                                                                 {: bufnr})
                                     (navic.attach client bufnr))
                                   (when (client.supports_method :textDocument/inlayHint
                                                                 {: bufnr})
                                     (vim.lsp.inlay_hint.enable true {: bufnr})
                                     (setup-inlay-hint-toggle bufnr))
                                   (diagnostic.maybe-enable-lsp client bufnr)))
                     :group augroup
                     :desc "Automatic LSP setup"})
  ;; Servers
  (vim.lsp.set_log_level :OFF)
  (let [capabilities (vim.tbl_deep_extend :force
                                          (vim.lsp.protocol.make_client_capabilities)
                                          (cmp.default_capabilities))
        handlers {:textDocument/hover (vim.lsp.with vim.lsp.handlers.hover
                                        {:border :rounded})
                  :textDocument/signatureHelp (vim.lsp.with vim.lsp.handlers.signature_help
                                                {:border :rounded})}
        flags {:allow_incremental_sync true :debounce_text_changes 700}
        default-config {: capabilities : handlers : flags}
        default-servers [:bashls
                         :cssls
                         :dockerls
                         :erlangls
                         :fennel_ls
                         :html
                         :jsonls
                         :marksman
                         :svelte
                         :taplo]]
    ;; Default
    (each [_ name (pairs default-servers)]
      ((. lsp name :setup) default-config))
    ;; Custom
    (when (= (vim.fn.executable :elixir-ls) 1)
      (lsp.elixirls.setup (->> {:cmd [:elixir-ls]}
                               (vim.tbl_extend :force default-config))))
    (lsp.jsonls.setup (->> {:settings {:json {:schemas (schemastore.json.schemas)
                                              :validate {:enable true}}}}
                           (vim.tbl_extend :force default-config)))
    (when (= (vim.fn.executable :lexical) 1)
      (lsp.lexical.setup (->> {:cmd [:lexical :start]}
                              (vim.tbl_extend :force default-config))))
    (when (= (vim.fn.executable :lua-language-server) 1)
      (lsp.lua_ls.setup (->> {:cmd [:lua-language-server]
                              :root_dir (or (lsp.util.root_pattern :init.vim
                                                                   :init.lua
                                                                   :.git)
                                            (vim.loop.os_homedir))
                              :settings {:Lua {:runtime {:version :LuaJIT
                                                         :path (vim.split package.path
                                                                          ";")}
                                               :diagnostics {:globals [:vim]}
                                               :telemetry {:enable false}}}}
                             (vim.tbl_extend :force default-config))))
    (when (= (vim.fn.executable :nil) 1)
      (lsp.nil_ls.setup (->> {:settings {:nil {:formatting {:command [:nixpkgs-fmt]}}}}
                             (vim.tbl_extend :force default-config))))
    (when (= (vim.fn.executable :nixd) 1)
      (lsp.nixd.setup (->> {:settings {:formatting {:command [:nixpkgs-fmt]}}}
                           (vim.tbl_extend :force default-config))))
    (let [inlay-hints {:includeInlayParameterNameHints :all
                       :includeInlayParameterNameHintsWhenArgumentMatchesName false
                       :includeInlayFunctionParameterTypeHints true
                       :includeInlayVariableTypeHints true
                       :includeInlayVariableTypeHintsWhenTypeMatchesName false
                       :includeInlayPropertyDeclarationTypeHints true
                       :includeInlayFunctionLikeReturnTypeHints true
                       :includeInlayEnumMemberValueHints true}]
      (lsp.tsserver.setup (->> {:cmd [:typescript-language-server :--stdio]
                                :settings {:typescript {:inlayHints inlay-hints}
                                           :javascript {:inlayHints inlay-hints}}}
                               (vim.tbl_extend :force default-config))))
    (lsp.solargraph.setup (->> {:settings {:solargraph {:diagnostics true}}}
                               (vim.tbl_extend :force default-config)))
    (lsp.yamlls.setup (->> {:settings {:yaml {:schemaStore {:enable false
                                                            :url ""}
                                              :schemas (schemastore.yaml.schemas)}}}
                           (vim.tbl_extend :force default-config))))
  ;; Hacks

  (fn add-inline-highlights [bufnr]
    (let [lines (vim.api.nvim_buf_get_lines bufnr 0 -1 false)
          mapping {"@%S+" "@parameter"
                   "^%s*(Parameters:)" "@text.title"
                   "^%s*(Return:)" "@text.title"
                   "^%s*(See also:)" "@text.title"
                   "{%S-}" "@parameter"
                   "|%S-|" "@text.reference"}]
      (each [l line (ipairs lines)]
        (each [pattern hl_group (pairs mapping)]
          (var from 1)
          (while from
            (var to nil)
            (set (from to) (line:find pattern from))
            (when from
              (vim.api.nvim_buf_set_extmark bufnr ns (- l 1) (- from 1)
                                            {:end_col to : hl_group}))
            (set from (if to (+ to 1) nil)))))))

  ;; https://github.com/MariaSolOs/dotfiles/blob/b4516aa30c2912011a7b9c9857f01dee1ba5b57f/.config/nvim/lua/lsp.lua#L260C1-L260C1
  (set vim.lsp.util.stylize_markdown
       (fn [bufnr raw-contents opts]
         (var contents raw-contents)
         (set contents
              (vim.lsp.util._normalize_markdown contents
                                                {:width (vim.lsp.util._make_floating_popup_size contents
                                                                                                opts)}))
         (tset vim :bo bufnr :filetype :markdown)
         (vim.treesitter.start bufnr)
         (vim.api.nvim_buf_set_lines bufnr 0 -1 false contents)
         (add-inline-highlights bufnr)
         contents)))
