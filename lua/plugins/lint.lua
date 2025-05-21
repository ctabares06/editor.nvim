return {
  { -- Add a pattern for each language to watch with the linter
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
      }
      vim.api.nvim_create_augroup('EslintConfGroup', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = 'EslintConfGroup',
        pattern = { '*.js', '*.ts', '*.jsx', '*.tsx' },
        callback = function()
          require('config.eslint_conf').try_eslint_if_config_exists(lint)
        end,
      })
    end,
  },
}
