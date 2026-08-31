(let [fzf (require :fzf-lua)]
  (fzf.setup {:files {:cwd_prompt false :prompt "Files❯ "}
              :grep {:prompt "Grep❯ "}
              :grep_curbuf {:prompt "BGrep❯ "}
              :buffers {:prompt "Buffers❯ "}
              :treesitter {:prompt "Tree-sitter❯ "}
              :lsp {:prompt_postfix "❯ "
                    :symbols {:prompt_postfix "❯ "}
                    :code_actions {:prompt "CodeActions❯ "}
                    :diagnostics {:prompt "Diagnostics❯ "}
                    :keymaps {:prompt "Keymaps❯ "}}
              :winopts {:backdrop false}
              :previewers {:builtin {:extensions {:gif :chafa
                                                  :jpg :chafa
                                                  :png :chafa}}}
              :fzf_colors true})
  (fzf.register_ui_select))
