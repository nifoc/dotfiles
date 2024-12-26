(let [illuminate (require :illuminate)]
  (illuminate.configure {:filetypes_denylist [:TelescopePrompt :netrw :fzf]}))
