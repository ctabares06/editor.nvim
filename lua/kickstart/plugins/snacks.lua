return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      {
        '<leader>th',
        function()
          Snacks.terminal()
        end,
        desc = 'Snacks: [T]erminal [H]orizontal',
        mode = 'n',
      },
      {
        'gl',
        function()
          Snacks.lazygit()
        end,
        desc = 'Snacks: [G]it [L]azygit',
        mode = 'n',
      },
    },
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      lazygit = { enabled = true, win = {
        width = 0.8,
        height = 0.8,
      } },
      dashboard = { enabled = true },
      input = { enabled = true },
      words = { enabled = true },
      terminal = {
        enabled = true,
        auto_insert = false,
        win = {
          border = 'solid',
          position = 'float',
          width = 0.6,
          height = 0.6,
          title_pos = 'center',
        },
      },
    },
  },
}
