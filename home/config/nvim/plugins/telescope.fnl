(let [telescope (require :telescope)
      actions (require :telescope.actions)
      themes (require :telescope.themes)]
  (telescope.setup {:defaults {; Display
                               :prompt_prefix " "
                               :selection_caret " "
                               :set_env {:COLORTERM :truecolor}
                               :path_display [:truncate :absolute]
                               ; Layout
                               :layout_strategy :horizontal
                               :layout_config {:horizontal {:preview_width 0.5}}
                               ; Mappings
                               :mappings {:i {:<esc> actions.close}}
                               ; Arguments
                               :vimgrep_arguments [:rg
                                                   :--hidden
                                                   :--ignore-vcs
                                                   :-g
                                                   :!.git/*
                                                   :--color=never
                                                   :--no-heading
                                                   :--with-filename
                                                   :--line-number
                                                   :--column
                                                   :--smart-case
                                                   :--trim]}
                    :extensions {:ui-select [(themes.get_dropdown {})]
                                 :fzf {:fuzzy true
                                       :override_generic_sorter true
                                       :override_file_sorter true
                                       :case_mode :smart_case}}})
  (telescope.load_extension :fzf)
  (telescope.load_extension :ui-select)
  (telescope.load_extension :yank_history)
  (telescope.load_extension :undo)
  (let [augroup (vim.api.nvim_create_augroup :NifocTelescope {:clear true})
        aucmd vim.api.nvim_create_autocmd]
    (aucmd :FileType {:pattern :TelescopePrompt
                      :callback #(set vim.opt_local.cursorline false)
                      :group augroup})
    (aucmd :User {:pattern :TelescopePreviewerLoaded
                  :command "let w:is_telescope=v:true"
                  :group augroup})
    (aucmd :BufWinEnter {:callback #(when vim.w.is_telescope
                                      (set vim.opt_local.number true)
                                      (set vim.opt_local.relativenumber false)
                                      (set vim.opt_local.wrap true))
                         :group augroup})))
