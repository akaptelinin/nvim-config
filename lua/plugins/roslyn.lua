return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
        fsautocomplete = { enabled = false },
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      -- without this CPU usage stays at 50%+
      filewatching = "off",
      settings = {
        ["csharp|background_analysis"] = {
          -- openFiles instead of fullSolution - otherwise Roslyn analyzes ALL files
          -- in the solution in background, which kills performance on large projects.
          -- downside: errors in closed files not visible, but that's ok for neovim
          dotnet_analyzer_diagnostics_scope = "openFiles",
          dotnet_compiler_diagnostics_scope = "openFiles",
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = false,
          dotnet_enable_tests_code_lens = false,
        },
      },
    },
  },
}
