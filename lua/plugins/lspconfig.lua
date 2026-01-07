-- inlay hints: visual noise in well-written code, useful for unfamiliar codebases
local enable_inlay_hints = false

local inlay_hints_settings = enable_inlay_hints and {
  parameterNames = { enabled = "all" },
  parameterTypes = { enabled = true },
  variableTypes = { enabled = true },
  propertyDeclarationTypes = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
  enumMemberValues = { enabled = true },
} or nil

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- tsgo: new TS LSP in Go from Microsoft (10x faster)
        -- npm install -g @typescript/native-preview
        tsgo = {
          settings = {
            typescript = { inlayHints = inlay_hints_settings },
            javascript = { inlayHints = inlay_hints_settings },
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
