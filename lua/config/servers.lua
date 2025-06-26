local mason_registry = require 'mason-registry'
local vue_lsp_path = mason_registry.get_package('vue-language-server'):get_install_path()

return {
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
}
