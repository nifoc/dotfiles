(let [luasnip (require :luasnip)
      luasnip-vscode (require :luasnip.loaders.from_vscode)]
  (luasnip.config.setup {:region_check_events "CursorHold,InsertEnter,InsertLeave"
                         :delete_check_events "TextChanged,InsertEnter"})
  (luasnip-vscode.lazy_load))

