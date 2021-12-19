local fterm = require('FTerm')

fterm.setup {
  cmd = 'fish',

  border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
}

local lazygit = fterm:new({
  cmd = 'lazygit',

  dimensions = {
    height = 0.9,
    width = 0.9
  },
})

function _G.__fterm_lazygit()
  lazygit:toggle()
end
