return {
  {
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        dark_variant = 'moon',
        styles = {
          italic = false,
        },
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
