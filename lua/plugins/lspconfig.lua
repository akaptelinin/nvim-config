return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- tsgo: новый TS LSP на Go от Microsoft (быстрее в 10x)
        -- npm install -g @typescript/native-preview
        tsgo = {},

        -- отключаем старые TS серверы:
        vtsls = { enabled = false },  -- закомментить если tsgo глючит
        ts_ls = { enabled = false },     -- обёртка над tsserver
        tsserver = { enabled = false },  -- оригинальный от MS

      },
    },
  },
}
