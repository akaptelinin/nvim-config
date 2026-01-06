return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- tsgo: новый TS LSP на Go от Microsoft (быстрее в 10x)
        -- npm install -g @typescript/native-preview
        tsgo = {},

        -- отключаем старые TS серверы:
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
