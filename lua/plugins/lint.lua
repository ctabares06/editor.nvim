return {
  { -- Add a pattern for each language to watch with the linter
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      vim.api.nvim_create_augroup('EslintConfGroup', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        callback = function(args)
          local linter = require('config.linter_detect').map_linter(args)

          if linter then
            lint.try_lint(linter)
          end
        end,
      })
    end,
  },
}
