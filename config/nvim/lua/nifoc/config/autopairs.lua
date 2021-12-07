local npairs = require('nvim-autopairs')

npairs.setup({
  check_ts = true,
  ts_config = {
    javascript = { 'string', 'template_string' },
    elixir = { 'string' },
    lua = { 'string', 'source' },
  },
})
