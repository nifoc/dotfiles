(let [yanky (require :yanky)
      uname (vim.loop.os_uname)]
  (yanky.setup {:ring {:storage :memory}
                :system_clipboard {:sync_with_ring (= uname.sysname :Darwin)}}))
