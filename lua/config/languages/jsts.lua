local M = {}

local function find_package_json_path(bufnr)
  local fname = vim.api.nvim_buf_get_name(bufnr)
  return vim.fs.find('package.json', { upward = true, path = fname })[1]
end

local function has_dep(pkg_json_path, name)
  if not pkg_json_path then
    return false
  end
  local ok, content = pcall(vim.fn.readfile, pkg_json_path)
  if not ok or not content then
    return false
  end
  local joined = table.concat(content, '\n')
  local ok2, pkg = pcall(vim.json.decode, joined)
  if not ok2 or not pkg then
    return false
  end

  local deps = vim.tbl_extend('force', pkg.dependencies or {}, pkg.devDependencies or {})
  return deps[name] ~= nil
end

function M.get_linter(bufnr)
  local pkg_path = find_package_json_path(bufnr)
  if has_dep(pkg_path, 'biome') then
    return 'biome'
  elseif has_dep(pkg_path, 'eslint') or has_dep(pkg_path, 'eslint-config') then
    return 'eslint_d' -- or "eslint"
  end
  return nil
end

function M.get_formatter(bufnr)
  local pkg_path = find_package_json_path(bufnr)
  if has_dep(pkg_path, 'biome') then
    return 'biome'
  elseif has_dep(pkg_path, 'prettier') then
    return 'prettierd'
  end
  return {}
end

return M
