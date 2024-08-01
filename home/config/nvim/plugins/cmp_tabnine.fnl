(let [tabnine (require :cmp_tabnine)
      tabnine-config (require :cmp_tabnine.config)
      augroup (vim.api.nvim_create_augroup :NifocTabNine {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (tabnine-config:setup {:ignored_file_types {:markdown true :text true}})
  (aucmd :BufRead {:callback #(tabnine:prefetch (vim.fn.expand "%:p"))
                   :pattern [:*.css
                             :*.html
                             :*.java
                             :*.js
                             :*.jsx
                             :*.kt
                             :*.lua
                             :*.php
                             :*.py
                             :*.rb
                             :*.ts
                             :*.tsx
                             :*.yaml
                             :*.yml]
                   :group augroup}))
