-- flash.nvim is required for f/F/t/T/;/, to work in LazyVim
-- but we use leap.nvim for s/S, so we disable flash's s/S mappings
return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = { enabled = false },
        char = {
          enabled = true,
          keys = { "f", "F", "t", "T", ";", "," },
        },
      },
    },
    keys = {
      { "s", false },
      { "S", false },
    },
  },
}
