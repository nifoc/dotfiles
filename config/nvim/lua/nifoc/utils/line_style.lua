local M = {}

local check_disable = function()
  local buftype = vim.bo.buftype
  return buftype == 'terminal' or buftype == 'nofile'
end

local check_toggle = function()
  if check_disable() then
    return false
  elseif vim.w.is_telescope then
    return false
  else
    local toggle_line_style = vim.b.toggle_line_style
    return toggle_line_style == nil or toggle_line_style == 1
  end
end

function M.maybe_set_special_style()
  if check_disable() then
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end

  if vim.w.is_telescope then
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end
end

function M.maybe_set_relativenumber(value)
  if check_toggle() then
    vim.opt_local.relativenumber = value
  end
end

return M
