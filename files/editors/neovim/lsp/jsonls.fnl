(local schemastore (require :schemastore))

{:cmd [:vscode-json-language-server :--stdio]
 :root_markers [:.git]
 :filetypes [:json :jsonc]
 :settings {:json {:schemas (schemastore.json.schemas)
                   :validate {:enable true}}}}
