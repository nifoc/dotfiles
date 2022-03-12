local M = {}

function M.maybe_set_relativenumber(value)
  local toggle_line_style = vim.b.toggle_line_style
  local do_toggle = toggle_line_style == nil or toggle_line_style == 1

  if do_toggle then
    vim.opt_local.relativenumber = value
  end
end

return M
