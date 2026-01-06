return {
  -- disable LazyVim extra claudecode.nvim
  { "coder/claudecode.nvim", enabled = false },

  -- our fork based on coder/claudecode.nvim with diff feature removed
  {
    "akaptelinin/claude-code.nvim",
    commit = "9c7ab33",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      terminal_cmd = "claude --dangerously-skip-permissions",
      terminal = {
        split_side = "bottom",
        split_width_percentage = 0.5,
        provider = "native",
      },
    },
    lazy = false,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<C-,>", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude", mode = { "n", "t" } },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "n", desc = "Send to Claude" },
      { "<leader>as", ":<C-u>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    },
  },
}
