(local inlay-hints {:includeInlayParameterNameHints :all
                    :includeInlayParameterNameHintsWhenArgumentMatchesName false
                    :includeInlayFunctionParameterTypeHints true
                    :includeInlayVariableTypeHints true
                    :includeInlayVariableTypeHintsWhenTypeMatchesName false
                    :includeInlayPropertyDeclarationTypeHints true
                    :includeInlayFunctionLikeReturnTypeHints true
                    :includeInlayEnumMemberValueHints true})

{:cmd [:typescript-language-server :--stdio]
 :root_markers [:tsconfig.json :jsconfig.json :package.json :.git]
 :filetypes [:javascript
             :javascriptreact
             :javascript.jsx
             :typescript
             :typescriptreact
             :typescript.tsx]
 :init_options {:hostInfo :neovim}
 :settings {:typescript {:inlayHints inlay-hints}
            :javascript {:inlayHints inlay-hints}}}
