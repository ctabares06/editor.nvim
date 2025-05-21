local M = {}

local config_patterns = {
  '^%.eslintrc$',
  '^%.eslintrc%..+$',
  '^eslint%.config%..+$',
}

local function has_eslint_config(dir)
  local files = vim.fn.readdir(dir)
  if not files then
    return false
  end

  for _, file in ipairs(files) do
    for _, pat in ipairs(config_patterns) do
      if file:match(pat) then
        return true
      end
    end
  end
  return false
end

function M.try_eslint_if_config_exists(lint)
  local buf_path = vim.api.nvim_buf_get_name(0)
  if buf_path == '' then
    return
  end

  local dir = vim.fs.dirname(buf_path)
  local prev = nil

  while dir and dir ~= prev do
    if has_eslint_config(dir) then
      lint.try_lint { 'eslint' }
      return
    end
    prev = dir
    dir = vim.fn.fnamemodify(dir, ':h')
  end
end

return M
