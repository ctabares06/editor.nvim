-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree filesystem float<CR>', desc = 'NeoTree: [E]xpand', silent = true },
    { '<leader>nr', ':Neotree filesystem float dir=' .. vim.fn.stdpath 'config' .. '<CR>', desc = 'NeoTree: [E]xpand', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<leader>n'] = 'close_window',
        },
      },
    },
  },
}
