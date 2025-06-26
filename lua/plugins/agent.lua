return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      require("codecompanion").setup({
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_results_in_chat = true
            }
          }
        },
        strategies = {
          chat = {
            adapter = "gemini"
          },
          inline = {
            adapter = "gemini"
          },
          agent = {
            adapter = "gemini"
          }
        },
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "GEMINI_API_KEY",
              },
              parameters = {
                model = "gemini-2.5-flash"
              }
            })
          end,
        },
        display = {
          chat = {
            window = {
              layout = "vertical", -- o "horizontal"
              width = 0.35,
              height = 1,
            },
          },
          action_palette = {
            provider = "snacks",
          }
        }
      })
    end,
    init = function()
      require("config.spinner"):init()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  },
}
