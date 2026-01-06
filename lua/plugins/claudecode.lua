return {
  -- отключаем coder/claudecode.nvim (LazyVim extra)
  { "coder/claudecode.nvim", enabled = false },

  -- включаем greggh/claude-code.nvim
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      command = "claude --dangerously-skip-permissions",
      window = {
        position = "horizontal",
        split_ratio = 0.4,
        enter_insert = true,
      },
      git = {
        use_git_root = true,
      },
      refresh = {
        enable = true,
      },
      keymaps = {
        window_navigation = false,
        scrolling = false,
      },
    },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<C-,>", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude", mode = { "n", "t" } },
    },
  },
}
