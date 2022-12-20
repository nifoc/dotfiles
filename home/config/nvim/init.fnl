(let [o vim.opt
      g vim.g]
  ;; Preamble
  (vim.cmd.filetype "plugin indent on")
  (set o.shell :/bin/sh)
  ;; Various Options
  (set o.spelllang [:en :de])
  (set o.showmode false)
  (set o.modeline false)
  (set o.ruler false)
  (set o.cursorline true)
  (set o.list true)
  (set o.listchars {:tab "»·"
                    :trail "·"
                    :nbsp "·"
                    :precedes "←"
                    :extends "→"})
  (set o.showbreak "↪ ")
  (set o.backspace [:indent :eol :start])
  (set o.showtabline 2)
  (set o.signcolumn "yes:1")
  (set o.completeopt [:menu :menuone :noselect])
  (set o.startofline false)
  (set o.synmaxcol 300)
  (set o.viewoptions [:cursor :folds :slash :unix])
  (set o.foldenable false)
  ;; Search
  (set o.incsearch true)
  (set o.grepprg "rg --vimgrep --no-heading")
  (set o.grepformat "%f:%l:%c:%m,%f:%l:%m")
  (set o.inccommand :nosplit)
  ;; Wrap
  (set o.wrap true)
  (set o.tabstop 2)
  (set o.shiftwidth 2)
  (set o.softtabstop 2)
  (set o.expandtab true)
  ;; Splits
  (set o.splitbelow true)
  (set o.splitright true)
  ;; Diff
  (set o.diffopt [:filler :internal "algorithm:histogram" :indent-heuristic])
  ;; UI
  (set o.number true)
  (set o.relativenumber true)
  (set o.conceallevel 2)
  (set o.concealcursor :nc)
  (set o.updatetime 1000)
  (o.shortmess:append :cS)
  (set o.termguicolors true)
  (set o.mouse :a)
  (set o.mousemodel :popup_setpos)
  (set o.cmdheight 1)
  ;; Backups
  (set o.backup false)
  (set o.swapfile false)
  (set o.undofile true)
  (set o.undodir (.. (os.getenv :HOME) :/.local/share/nvim/undo//))
  ;; Theme
  (let [theme (require :nifoc.theme)]
    (theme.setup))
  ;; Plugins
  (set g.loaded_python_provider 0) ; Disable built-in providers
  (set g.loaded_python3_provider 0)
  (set g.loaded_ruby_provider 0)
  (set g.loaded_node_provider 0)
  (set g.loaded_perl_provider 0)
  (set g.loaded_matchit 1) ; Disable built-in plugins
  (set g.loaded_matchparen 1)
  (set g.loaded_gzip 1)
  (set g.loaded_rrhelper 1)
  (set g.loaded_tarPlugin 1)
  (set g.loaded_zipPlugin 1)
  (set g.loaded_netrwPlugin 1)
  (set g.loaded_netrwFileHandlers 1)
  (set g.loaded_netrwSettings 1)
  (set g.loaded_2html_plugin 1)
  (set g.loaded_vimballPlugin 1)
  (set g.loaded_getscriptPlugin 1)
  (set g.loaded_logipat 1)
  (set g.loaded_tutor_mode_plugin 1)
  (let [diagnostic (require :nifoc.diagnostic)
        formatting (require :nifoc.formatting)]
    (diagnostic.setup)
    (formatting.setup))
  (require :configuration.plugins)
  ;; Keymap
  (let [keymap (require :nifoc.keymap)]
    (keymap.setup))
  ;; Autocmds
  (let [augroup (vim.api.nvim_create_augroup :NifocInit {:clear true})
        aucmd vim.api.nvim_create_autocmd
        ls (require :nifoc.line-style)]
    (aucmd :InsertEnter {:callback #(ls.maybe-set-relativenumber false)
                         :group augroup})
    (aucmd :InsertLeave {:callback #(ls.maybe-set-relativenumber true)
                         :group augroup})))

