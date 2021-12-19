local M = {}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end

  return false
end

local buffer_variable_exists = function(key)
  return buffer_not_empty() and vim.b[key] ~= nil
end

local buffer_has_lsp = function()
  return buffer_not_empty() and #vim.lsp.buf_get_clients() > 0
end

function M.line_column()
  local line = tostring(vim.fn.line('.'))
  local column = tostring(vim.fn.col('.'))

  return string.format("%3s:%-3s", line, column)
end

function M.current_line_percent()
  local current_line = vim.fn.line('.')
  local total_line = vim.fn.line('$')

  if current_line == 1 then
    return 'Top'
  elseif current_line == total_line then
    return 'Bot'
  end

  return [[%2p%%]]
end

function M.filetype()
  local f_name = vim.fn.expand('%:t')
  local f_extension = vim.fn.expand('%:e')
  local f_type = vim.bo.filetype

  if f_type:len() > 0 then
    return f_type .. ' ' .. require('nvim-web-devicons').get_icon(f_name, f_extension, {default = true})
  else
    return 'no ft'
  end
end

function M.gitsigns_formatter(status)
  local added, changed, removed = status.added, status.changed, status.removed
  local result = {}

  if added ~= nil and added > 0 then
    table.insert(result, string.format("%%#GitSignsStatuslineAdd# %s", added))
  end

  if changed ~= nil and changed > 0 then
    table.insert(result, string.format("%%#GitSignsStatuslineChange# %s", changed))
  end

  if removed ~= nil and removed > 0 then
    table.insert(result, string.format("%%#GitSignsStatuslineDelete# %s", removed))
  end

  return table.concat(result, ' ')
end

function M.current_function()
  local fn = vim.b.lsp_current_function

  if fn ~= nil and fn:len() > 0 then
    return ' ' .. fn
  else
    return ''
  end
end

function M.spell_enabled()
  if buffer_not_empty() and vim.wo.spell then
    return 'ﮒ'
  else
    return ''
  end
end

function M.fixer_enabled()
  if buffer_variable_exists('nifoc_fixer_enabled') then
    return ''
  else
    return ''
  end
end

function M.treesitter_enabled()
  if buffer_variable_exists('nifoc_treesitter_enabled') then
    return ''
  else
    return ''
  end
end

function M.lsp_enabled()
  if buffer_variable_exists('nifoc_lsp_enabled') then
    return ''
  else
    return ''
  end
end

return M
