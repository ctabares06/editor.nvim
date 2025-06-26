return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local args = {
          buf = bufnr,
        }
        local formatter = require('config.linter_detect').map_formatter(args)
        return {
          timeout_ms = 500,
          lsp_format = formatter and formatter or 'fallback',
        }
      end,
    },
  },
}
