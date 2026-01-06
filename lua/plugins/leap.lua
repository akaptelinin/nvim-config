-- leap.nvim for s/S - better than flash's search mode
-- flash.nvim handles f/F/t/T/;/, (see flash.lua)
return {
  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set({"n", "x", "o"}, "s", function() require("leap").leap({ inclusive = true }) end, { desc = "Leap forward" })
      vim.keymap.set({"n", "x", "o"}, "S", function() require("leap").leap({ backward = true }) end, { desc = "Leap backward" })
    end,
  },
}
