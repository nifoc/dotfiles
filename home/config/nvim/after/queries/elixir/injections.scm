; extends

; LUA
(sigil
  (sigil_name) @_sigil_name
  (quoted_content) @injection.content
  (#eq? @_sigil_name "LUA")
  (#set! injection.language "lua"))
