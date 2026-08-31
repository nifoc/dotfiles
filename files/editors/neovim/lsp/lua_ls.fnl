{:cmd [:lua-language-server]
 :root_markers [:.luarc.json
                :.luarc.jsonc
                :.luacheckrc
                :stylua.toml
                :stylua.toml
                :selene.toml
                :selene.yml
                :.git]
 :filetypes [:lua]
 :settings {:Lua {:runtime {:version :LuaJIT
                            :path (vim.split package.path ";")}
                  :diagnostics {:globals [:vim]}
                  :telemetry {:enable false}}}}
