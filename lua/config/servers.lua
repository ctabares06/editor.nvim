local mason_registry = require 'mason-registry'
local vue_lsp_path = mason_registry.get_package('vue-language-server'):get_install_path()

return {
  clangd = {
    keys = {
      { "<leader>cf", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
    },
    root_markers = {
      "compile_commands.json",
      "compile_flags.txt",
      "configure.ac", -- AutoTools
      "Makefile",
      "configure.ac",
      "configure.in",
      "config.h.in",
      "meson.build",
      "meson_options.txt",
      "build.ninja",
      ".git",
    },
    capabilities = {
      offsetEncoding = { "utf-16" },
    },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },
  jsonls = {
    filetypes = {
      'json'
    }
  },
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  stylua = {},
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vue_lsp_path .. '/node_modules/@vue/language-server',
          languages = { 'vue' },
        },
      },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  },
  biome = {
    filetypes = {
      'astro',
      'css',
      'graphql',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'svelte',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'vue',
    },
  },
  emmet_ls = {
    filetypes = {
      'css',
      'eruby',
      'html',
      'javascript',
      'javascriptreact',
      'less',
      'sass',
      'scss',
      'svelte',
      'pug',
      'typescriptreact',
      'vue',
    },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ['bem.enabled'] = true,
        },
      },
    },
  },
  volar = {
    init_options = {
      vue = {
        hybridMode = false,
      },
      typescript = {
        tsdk = vue_lsp_path .. '/node_modules/typescript/lib/',
      },
    },
  },
  jdtls = {},
}
