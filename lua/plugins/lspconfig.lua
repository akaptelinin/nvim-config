return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- tsgo: new TS LSP in Go from Microsoft (10x faster)
        -- npm install -g @typescript/native-preview
        tsgo = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
          },
        },

        -- disable old TS servers:
        vtsls = { enabled = false },
        ts_ls = { enabled = false },
        tsserver = { enabled = false },

        -- CSS/LESS/SCSS
        cssls = {
          settings = {
            css = { validate = true },
            scss = { validate = true },
            less = { validate = true },
          },
        },
      },
    },
  },
}
