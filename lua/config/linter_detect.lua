local M = {}

local jsts = require 'config.languages.jsts'

local languages = {
  javascript = {
    linter = function(bufnr)
      return jsts.get_linter(bufnr)
    end,
    formatter = function(bufnr)
      return jsts.get_formatter(bufnr)
    end,
  },
  javascriptreact = {
    linter = function(bufnr)
      return jsts.get_linter(bufnr)
    end,
    formatter = function(bufnr)
      return jsts.get_formatter(bufnr)
    end,
  },
  typescript = {
    linter = function(bufnr)
      return jsts.get_linter(bufnr)
    end,
    formatter = function(bufnr)
      return jsts.get_formatter(bufnr)
    end,
  },
  typescriptreact = {
    linter = function(bufnr)
      return jsts.get_linter(bufnr)
    end,
    formatter = function(bufnr)
      return jsts.get_formatter(bufnr)
    end,
  },
  lua = {
    formatter = function()
      return 'stylua'
    end,
  },
}

function M.map_linter(args)
  local filetype = vim.bo[args.buf].filetype
  local language = languages[filetype]

  if language and language.linter then
    return language.linter(args.buf)
  end

  return nil
end

function M.map_formatter(args)
  local filetype = vim.bo[args.buf].filetype
  local language = languages[filetype]

  if language and language.formatter then
    return language.formatter(args.buf)
  end

  return nil
end

return M
